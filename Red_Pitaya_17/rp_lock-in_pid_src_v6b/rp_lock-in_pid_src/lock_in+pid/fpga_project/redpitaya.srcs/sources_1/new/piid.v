`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Alexei
// 
// Create Date: 21.09.2019 17:09:44
// Design Name: 
// Module Name: piid
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision: 2 (02/09/2020)
// Revision 1 - File Created
// Revision 2 - Added fast limited integrator, changed cutoff ranges of old (slow) limited integrator from 2-240 Hz to 15-2k Hz
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module piid
(
   // data
   input                     clk           ,  // clock
   input                     rst_all         ,  // reset
   input                     rst_int         ,  // reset unlimited integrator
   input                     pid_freeze      ,  // freeze pid
   input  signed  [ 14-1: 0] error           ,  // input error signal
   input  signed  [ 14-1: 0] pld_out_offset  ,  // offset for fast output = aux ramp + offset
   input  signed  [ 14-1: 0] i_out_offset    ,  // offset for unlimited intregrator output = main ramp + offset
   output signed  [ 14-1: 0] pld_out         ,  // "fast" output from proportional, limited integrator, fast limited integrator, and derivator
   output signed  [ 14-1: 0] i_out           ,  // "slow" output from unlimited intregrator
   output                    i_issat         ,
   // Gain exponents
   input          [  3-1: 0] ISR             ,  // gain exponent for unlimited Integration
   input          [  3-1: 0] PSR             ,  // gain exponent for proportional
   input          [  3-1: 0] LSR             ,  // gain exponent for Limited integration
   input          [  3-1: 0] FSR             ,  // gain exponent for Fast limited integration
   input          [  3-1: 0] DSR             ,  // gain exponent for Derivative
   // gain factors
   input signed   [ 11-1: 0] ki        ,  // unlimited integrator gain
   input signed   [ 11-1: 0] kp        ,  // proportional gain
   input signed   [ 11-1: 0] kl        ,  // limited integrator gain
   input signed   [ 11-1: 0] kf        ,  // limited integrator gain
   input signed   [ 11-1: 0] kd        ,  // derivator gain
   // frequency cutoff exponents
   input signed   [  3-1: 0] cl        ,  // limited integrator cutoff
   input signed   [  3-1: 0] cf        ,  // limited integrator cutoff
   input signed   [  3-1: 0] cd           // derivator cutoff
);


//---------------------------------------------------------------------------------
//  Proportional
//propagation delay: 2*8ns
reg  signed [     11-1:0] kp_reg    ;   // DSP48 input pipeline for gain coefficient kp
reg  signed [    24-1: 0] p_mult  ;   // error * kp_reg, int14*int11=int24 if both inputs not minimum (=> kp limited to -2^13+1 in software)
reg  signed [    27-1: 0] p_offs  ;   // p_mult + (fast output (ramp + offset))
wire signed [    17-1: 0] p_out     ;   // error * kp_reg / 2^psr_reg saturated to [int15,fxp2]   ---> THIS GOES TO PID SUM

always @(posedge clk) begin
    kp_reg <= kp;
    if (rst_all) p_mult <= 24'b0;
    else if (~pid_freeze) p_mult <= error * kp_reg;
    p_offs <= ($signed({p_mult,2'b0}) >>> {PSR,2'b0}) + $signed({pld_out_offset,2'b0});
end
satsigned #(.Ri(27),.Ro(17)) p_satsigned_out ( .in(p_offs), .out(p_out) );

//---------------------------------------------------------------------------------
//  Unlimited Integrator
/*
Operating principle:
i(n+1)=i(n)+K*err
with err=[int14] and K=ki/2^(4*ISR)=[int11,fxp(4*7=28)]
=> K*err=[int24,fxp28], i(n)=i_sum_sat=[int24,fxp28], i(n+1)=i_sum=[int25,fxp28]
*/
// propagation delay: 2*8ns
reg   signed [   11-1: 0] ki_reg  ; // DSP48 input pipeline for gain coefficient ki
reg   signed [   24-1: 0] i_mult  ; // error * ki : int14*int11=int24 if both inputs not minimum (=> ki limited to -2^13+1 in software)
reg   signed [   53-1: 0] i_sum   ; // Memory before saturation check : [int24,fxp28]+[int14,fxp28]=[int25,fxp28]
wire  signed [   42-1: 0] i_sum_sat; // Memory after saturation check : [int14;fxp28]
reg   signed [   15-1: 0] i_offs   ; // Memory plus output offset

always @(posedge clk) begin
    ki_reg <= ki;
    i_mult <= error * ki_reg;
    if (rst_all | rst_int) i_sum  <= 53'b0;//not enough to set ki_reg=0, need to clear memory
    else if (~pid_freeze) i_sum  <= i_sum_sat + ($signed({i_mult,28'b0})>>>{ISR,2'b0});
    i_offs <= $signed(i_sum_sat[42-1:28]) + i_out_offset;
end
satsigned #(.Ri(53),.Ro(42)) i_satsigned_sum ( .in(i_sum), .out(i_sum_sat));// keeping all the fxp digits for integration
satsigned #(.Ri(15),.Ro(14)) i_satsigned_offs ( .in(i_offs), .out(i_out), .issat(i_issat) );// keeping all the fxp digits for integration


//---------------------------------------------------------------------------------
//  Limited Integrator
/*
Operating principle: 
Output  = low-passed amplified error signal with high-frequency gain independent on frequency cutoff
Continuous equations:
    l(t)=int_0^infty(K*err(t-tau)*exp(-tau/T)dtau)
    d/dt(l) = K*err-l/T
    where K = gain factor and T = cutoff time
Discretized equations (dt=1):
    l(n+1)=l(n)+K*err-l(n)/T
    with err=[int14], K=kl/2^(4*LSR)=[int11,fxp(4*7=28)], and T=2^(13+cl), 13+cl in [13,20]
    Number of fxp  >= log2(slowest integration time) = 20
    => K*err=[int24,fxp20], l(n)=l_sum_sat=[int14,fxp20], l(n+1)=l_sum=[int25,fxp20], l_out=[int14,fxp2] (fxp2 to improve precision in pld_sum)
*/

// propagation delay: 2*8ns

reg   signed [    11-1:0] kl_reg  ; // DSP48 input pipeline  for gain factor kl
reg   signed [   24-1: 0] l_mult  ; // error * kl_reg, int14*int11=int24 if both inputs not minimum (=> kl limited to -2^13+1 in software)
wire  signed [   34-1: 0] l_mult_sat ; // {l_mult,20'b0}>>>lsr_reg saturated to [int14,fxp20]
reg   signed [   35-1: 0] l_sum   ; // l_sum_sat - (l_sum_sat>>>(13+cl))+({l_mult,20'b0}>>lsr_reg), before saturation check
wire  signed [   34-1: 0] l_sum_sat;// l_sum after saturation check, for integrator, [int14, fxp20]
wire  signed [   16-1: 0] l_out   ; // [int14,fxp2] part of l_sum_sat  ---> THIS GOES TO PLD SUM

always @(posedge clk) begin
    kl_reg <= kl;
    l_mult <= error * kl_reg;
    if (rst_all) l_sum   <= 35'b0;
    else if (~pid_freeze) begin
        l_sum  <= l_sum_sat -($signed(l_sum_sat[34-1:13]) >>> cl) + l_mult_sat;
    end
end
satsigned #(.Ri(44),.Ro(34)) l_satsigned_mult ( .in($signed({l_mult,20'b0}) >>> {LSR,2'b0}), .out(l_mult_sat) );
satsigned #(.Ri(35),.Ro(34)) l_satsigned_sum ( .in(l_sum), .out(l_sum_sat) );
assign l_out = l_sum_sat[34-1:18];


//---------------------------------------------------------------------------------
//  Fast limited Integrator

/*
Operating principle: 
Output  = low-passed amplified error signal with high-frequency gain independent on frequency cutoff
Continuous equations:
    f(t)=int_0^infty(K*err(t-tau)*exp(-tau/T)dtau)
    d/dt(f) = K*err-f/T
    where K = gain factor and T = cutoff time
Discretized equations (dt=1):
    f(n+1)=f(n)+K*err-f(n)/T
    with err=[int14], K=kf/2^(4*FSR)=[int11,fxp(4*7=28)], and T=2^(7+cf), 7+cf in [7,14]
    Number of fxp  >= log2(slowest integration time) = 14
    => K*err=[int24,fxp14], f(n)=f_sum_sat=[int14,fxp14], f(n+1)=f_sum=[int25,fxp14]
*/
// propagation delay: 2*8ns

reg   signed [   25-1: 0] kf_reg  ; // gain factor kf/2^fsr_reg, [int11,fxp14], to optimally use a DSP48 multiplier (18x25)
reg   signed [   38-1: 0] f_mult  ; // error * kf_reg, [int14*int11=int24,fxp14] if both inputs not minimum (=> kf limited to -2^13+1 in software)
wire  signed [   28-1: 0] f_mult_sat  ; // {f_mult,14'b0}>>>fsr_reg saturated to [int14,fxp14]
reg   signed [   29-1: 0] f_sum   ; // f_sum_sat - (f_sum_sat >>>(7+cf_reg)) + ({f_mult,14'b0}>>>fsr_reg), before saturation check
wire  signed [   28-1: 0] f_sum_sat;// f_sum after saturation check, for integrator, [int14,fxp14]
wire  signed [   16-1: 0] f_out   ; // [int14,fxp2] part of f_sum_sat  ---> THIS GOES TO PLD SUM

always @(posedge clk) begin
    kf_reg <= $signed({kf,14'b0}) >>> {FSR,2'b0};
    f_mult <= error * kf_reg;
    if (rst_all) f_sum <= 29'b0;
    else if (~pid_freeze)
        f_sum  <= f_sum_sat- ($signed(f_sum_sat[28-1:7]) >>> cf) + f_mult_sat;
end

satsigned #(.Ri(38),.Ro(28)) f_satsigned_mult ( .in(f_mult), .out(f_mult_sat) );
satsigned #(.Ri(29),.Ro(28)) f_satsigned_sum ( .in(f_sum), .out(f_sum_sat) );
assign f_out = f_sum_sat[28-1:12];

//---------------------------------------------------------------------------------
//  Band-limited derivative

//propagation delay: 2*8ns

/*
Operating principle:
Continuous derivative d_out of a low-passed error signal err_lp with a hardware-coded 2⁷ gain
    err_lp(t)=1/T*int_0^infty(error(t-tau)*exp(-t/T)*dtau)
    d_out = K * d/dt(err_lp)
          = K * (err-err_lp)/T
Discretised version (dt=1):
    T=2^c with 2 <= c=cd+7 <= 9
    K=kd*2⁷/2^(4*DSR) with 0<=DSR<=7
    err_lp(n+1) =  err_lp(n) + (err(n)-err_lp(n))/2^c
    d_out(n+1) = kd*2⁷/2^(4*DSR)*(err(t)-err_lp(t))/2^c
*/


reg   signed [   11-1: 0] kd_reg    ; //  DSP48 input pipeline for gain coefficient kd
reg   signed [   24-1: 0] d_mult    ; // error * kd_reg, [int14*int11=int24] if both inputs not minimum (=> kd limited to -2^13+1 in software)
wire  signed [   32-1: 0] d_diff_lp ; // derivative of low-passed error signal, [int(24-2+1=23),fxp(7+2=9)]
wire  signed [   17-1: 0] d_out     ; // d_diff_lp*2⁷/2^dsr_reg saturated to [int15,fxp2]

always @(posedge clk) begin
    kd_reg  <= kd;
    d_mult <= kd_reg * error ;
end

LPFilterGain1 #(.Rin(24),.Sfix(2),.MaxTau(7)) i_LP_filter_Diff (
    .clk(clk),
    .rst(rst_all),
    .run(~pid_freeze),
    .in( d_mult ),
    .tau( cd ),
    .dout( d_diff_lp )
);

satsigned #(.Ri(32),.Ro(17)) i_satsigned_d_out ( .in(d_diff_lp >>> {DSR,2'b0}), .out(d_out) );

//---------------------------------------------------------------------------------
//  Sum together - saturate output

//propagation delay : 1*8ns
reg signed [   19-1: 0] pld_sum     ; // biggest posible bit-width [int15+int14+int14+int15=int17,fxp2]

always @(posedge clk)
    pld_sum <= p_out + l_out + f_out + d_out;

satsigned #(.Ri(17),.Ro(14)) i_satsigned_pid_sum ( .in(pld_sum[19-1:2]), .out(pld_out) ); //pld_out goes directly to the output. The ENOB being <13bits, there is no point in rounding it to the nearest integer

endmodule
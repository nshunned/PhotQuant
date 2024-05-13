`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Alexei
// 
// Create Date: 19.04.2020 17:09:44
// Design Name: 
// Module Name: pidlim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: derived from piid.v used in lock+pid project for frequency locks
// 
//////////////////////////////////////////////////////////////////////////////////


module pidlim
(
   // data
   input                     clk           ,  // clock
   input                     rst         ,  // reset
   input                     freeze      ,  // freeze pid
   input  signed  [ 14-1: 0] error           ,  // input error signal
   output signed  [ 14-1: 0] pid_out         ,  // output from proportional, limited integrator, and derivator
   // DIV settings
   input          [  3-1: 0] ISR             ,  // ISR for unlimited Integration
   input          [  3-1: 0] PSR             ,  // PSR for proportional
   input          [  3-1: 0] DSR             ,  // DSR for Derivative
   // settings
   input signed   [ 11-1: 0] ki        ,  // unlimited integrator gain
   input signed   [ 11-1: 0] kp        ,  // proportional gain
   input signed   [ 11-1: 0] kd        ,  // derivator gain
   input signed   [  3-1: 0] cd        ,  // derivator cutoff
   input signed   [ 14-1: 0] pid_max   ,  // pid saturation min
   input signed   [ 14-1: 0] pid_min      // pid saturation max 
);


//---------------------------------------------------------------------------------
//  Proportional

//propagation delay: 1*8ns
//output p_out coded as [int(14+1) to allow pid_sum=+/-2^13 when i_out=-/+2^13, fxp2 to improve precision and decrease noise in pid_sum]
reg         [      5-1:0] psr_reg   ;   // PSR*4;
reg  signed [     11-1:0] kp_reg    ;   // kp pipeline
reg  signed [    24-1: 0] p_mult  ;   // error * kp, int14*int11=int24
wire signed [    17-1: 0] p_sat     ;   // error * kp / 2^(PSR*4) saturated to [int15,fxp2]
reg  signed [    17-1: 0] p_out     ;   // registered copy of p_sat   ---> to pid_sum

always @(posedge clk) begin
    psr_reg <= {PSR,2'b0};//PSR*4
    kp_reg <= kp;
    if (~freeze) p_mult <= error * kp_reg;//kp reset to 0 by rst in seqpid_ch.v,
    p_out <= p_sat;
end
satsigned #(.Ri(26),.Ro(17)) p_satsigned_out ( .in($signed({p_mult,2'b0}) >>> psr_reg), .out(p_sat) );

//---------------------------------------------------------------------------------
//  Unlimited Integrator

// propagation delay: 2*8ns
reg   signed [   24-1: 0] i_mult  ; // error * ki : int14*int11=int24
reg   signed [   53-1: 0] i_sum   ; // Memory before saturation check : [int24,fxp28]+[int14,fxp28]=[int25,fxp28]
wire  signed [   42-1: 0] i_sum_sat; // Memory after saturation check : [int14;fxp28]
reg          [    5-1: 0] isr_reg ; //gain exponent, = ISR*4, in [0,4,8,12,16,20,24,28]
reg   signed [   11-1: 0] ki_reg    ;   // ki pipeline
wire  signed [   16-1: 0] i_out   ; // int_sum_sat truncated to [int14,fxp2]  ---> THIS GOES TO PID SUM

always @(posedge clk) begin
    isr_reg <= {ISR,2'b0};
    ki_reg <= ki;
    i_mult <= error * ki_reg;//ki reset to 0 by rst in seqpid_ch.v
    if (rst) i_sum  <= 53'b0;
    else if (~freeze) i_sum  <= i_sum_sat + ($signed({i_mult,28'b0})>>>isr_reg);
end
assign i_sum_sat = ($signed(i_sum[53-1:28]) >= pid_max)? {pid_max,28'b0} : (($signed(i_sum[53-1:28])< pid_min)? {pid_min,28'b0} : i_sum[42-1:0]);
assign i_out = i_sum_sat[42-1:26];//keeping 2 fractional bits to make pid_sum more precise and less noisy

//---------------------------------------------------------------------------------
//  Band-limited derivative

//propagation delay: 2*8ns

/*
Operating principle:
Continuous derivative d_out of a low-passed error signal err_lp, with hard-coded additional 2⁷ gain
    err_lp(t)=1/T*int_0^infty(err(t-tau)*exp(-t/T)*dtau)
    d_out =  K*d/dt(err_lp)
          = K*(err-err_lp)/T
Discretised version (dt=1):
    T=2^c with 2 <= c=cd+7 <= 9
    K=kd/2^(4*DSR) with 0<=DSR<=7
    The error signal is multiplied by kd, low-passed, and its derivative is multiplied by 2⁷/2^(4*DSR)
*/

reg   signed [   11-1: 0] kd_reg    ; // timing buffer for gain coefficient kd
reg   signed [    3-1: 0] cd_reg    ; // timing buffer for gain coefficient kd
reg          [    5-1: 0] dsr_reg ; // gain exponent DSR*4, in [0,4,8,12,16,20,24,28]
reg   signed [   24-1: 0] d_mult  ; // error * kd_reg, [int14*int11=int24]
wire  signed [   32-1: 0] d_diff_lp  ; // derivative of low-passed error signal, [int(24-2+1=23),fxp(7+2=9)]
reg   signed [   32-1: 0] d_lp_reg   ; // registered copy of d_diff_lp
wire  signed [   17-1: 0] d_out   ; // d_diff_lp*2⁷/2^dsr_reg saturated to [int15,fxp2]  ---> THIS GOES TO PID SUM

always @(posedge clk) begin
    dsr_reg <= {DSR,2'b0};
    kd_reg  <= kd;
    cd_reg <= cd;
    if (~freeze)  d_mult <= kd_reg * error;
end

LPFilterGain1 #(
    .Rin(24),
    .Sfix(2),
    .WidTau(3),
    .MaxTau(7)
    ) i_LP_filter_Diff (
    .clk(clk),
    .rst(rst),
    .run(~freeze),
    .in( d_mult ),
    .tau( cd ),
    .dout( d_diff_lp ) );//for the derivative, there are 0 clk cycles here

always @(posedge clk)
    d_lp_reg <= d_diff_lp ;

satsigned #(.Ri(32),.Ro(17)) i_satsigned_d_out ( .in(d_lp_reg >>> dsr_reg), .out(d_out) );
//---------------------------------------------------------------------------------
//  Sum together - saturate output

//propagation delay : 1*8ns
reg signed [   19-1: 0] pid_sum     ; // biggest posible bit-width [int15+int14+int15=int17,fxp2]

reg   signed [   14-1: 0] pid_max_reg  ; // pid max buffer 
reg   signed [   14-1: 0] pid_min_reg  ; // pid min buffer
always @(posedge clk) begin
    pid_max_reg <=  pid_max;
    pid_min_reg <= pid_min;
    pid_sum <= p_out + i_out + d_out ;
end
assign pid_out = ($signed(pid_sum[19-1:2]) >= pid_max_reg)? pid_max_reg : (($signed(pid_sum[19-1:2])< pid_min_reg)? pid_min_reg : pid_sum[16-1:2]);

endmodule
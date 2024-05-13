`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 08.02.2017 17:17:16
// Design Name:
// Module Name: lock
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

//(* dont_touch = "true" *)
//(* keep = "true" *)
//(* use_dsp48 = "yes" *)
//(* fsm_encoding = "gray" *)


//(* keep_hierarchy = "yes" *)
module lock(
    input clk,rst,
    // inputs
    input  signed   [14-1:0] in1,in2,   // inputs from SMA connectors. in1 used for locking, in2 for auxiliary monitoring (e.g. a photodiode measuring the transmission of a cavity to lock) 
    input                    ramp_on_sw, pid_i_on_sw, ramp_sm, offset_sm, pid_freeze,  // ramp enable switch, slow lock enable switch, ramp position/rate mode, offset position/rate mode, pid freeze input from BNC->GPIO
    input           [   1:0] ramp_enc, offset_enc, // incremental encoders for ramp amplitude and offset
    // outputs
    output signed   [14-1:0] out1,out2,         // PID outputs (->DAC->SMA): out1=unlimited integrator, out2= proportional + slow & fast limited integrators + differentiator
    output signed   [14-1:0] oscA,oscB,         // signals sent to channels A and B of scope module
    output                   trigger,           // Oscilloscope trigger output (to GPIO->BNC & scope module)
    output                   mod_sqr,           // Square modulation for digital output (to GPIO->BNC)
    output reg      [ 2-1:0] osc_ctrl,           // oscilloscope filter control [osc2_filt_off,osc1_filt_off]

    // system bus
    input           [32-1:0] sys_addr        ,  //!< bus address, 20 bits per module (4 used here) see https://redpitaya.readthedocs.io/en/latest/developerGuide/fpga.html
    input           [32-1:0] sys_wdata       ,  //!< bus write data
//    input           [ 4-1:0] sys_sel         ,  //!< bus write byte select //Alexei: unused
    input                    sys_wen         ,  //!< bus write enable
    input                    sys_ren         ,  //!< bus read enable
    output reg      [32-1:0] sys_rdata       ,  //!< bus read data
    output reg               sys_err         ,  //!< bus error indicator
    output reg               sys_ack            //!< bus acknowledge signal
    );

    // Module starts here  *********************************************


    // [WIREREG DOCK]

    // gen_ramp --------------------------
    reg            [3:0] ramp_freqexp; // ramp frequency exponent
    wire          [10:0] ramp_ampl_step, ramp_offs_step; //ramp amplitude and offset steps
    wire signed [14-1:0] ramp_A,ramp_B, ramp_offset;// main (->slow output out1) and auxiliary (-> fast output out2) ramp signals, ramp offset
    wire        [14-1:0] ramp_ampl;// ramp amplitude
    reg  signed [14-1:0] ramp_B_factor; // ramp_B=ramp_A*ramp_B_factor/4096
    wire                 ramp_on; // ramp on/off (from physical 3-state switch, debounced)
    wire                 ramp_trigger;//scope trigger signal at center of rising ramp

    // modulation --------------------------
    reg         [ 8-1:0] loc_osc_phase; // local oscillator phase
    reg         [ 7-1:0] mod_period; // square local oscillator period
    wire                 loc_osc_sqr;//square local oscillator (-> demodulation module) with a phase 2*pi*loc_osc_phase/(4*mod_period) relative to mod_sqr
    wire                 mod_trigger;//scope trigger signal sync. with modulation

    // demodulation -----------------------
    reg         [ 4-1:0] demod_gain; // demodulation gain = 2^(9-demod_gain)
    reg         [ 5-1:0] demod_lpf; // demodulation low pass filter control :{4=enableLP2,3=enableLP1,2:0=damping time}
    wire signed [14-1:0] demod_out ;// demodulated signal, to PID
    

    // error signal --------------------------
    reg                  error_sw; //selector for error signal (1: from demodulator, 0: from input in1)
    reg  signed [14-1:0] error_offset;//offset compensation for error signal
    wire signed [15-1:0] offset_minus_error;// offset-error, before saturation to 14 bits
    wire signed [14-1:0] error; //error signal (offset minus error sat. to 14 bits), to PID
    reg  signed [14-1:0] error_reg; //register for error for non-time-critical tasks
    wire signed [14-1:0] error_mean;//average of error signal over 134ms
    wire        [28-1:0] error_var; //variance of error signal over 134ms

    // piid --------------------------
    reg         [ 3-1:0] pid_PSR, pid_ISR, pid_LSR, pid_FSR, pid_DSR; //PID gain exponents for proportional (P), unlim. integrator (I), limited slow (L) and fast (F) integrators, and limited differentiator (D)
    reg         [ 3-1:0] pid_cl, pid_cf, pid_cd; //PID gain cutoff time exponents for limited slow (L) and fast (F) integrators, and limited differentiator (D)
    reg  signed [11-1:0] pid_kp, pid_ki, pid_kd, pid_kl, pid_kf; //PID gain factors for proportional (P), unlim. integrator (I), limited slow (L) and fast (F) integrators, differentiator (D)
    reg                  pid_off; //PID of when high
    reg  signed [14-1:0] offset_out_B; // additional offset for "fast" PID output
    wire signed [14-1:0] pld_out, i_out; // "fast" PID output (P+L+F+D) to out2, "slow" PID output (I) to out1
    reg  signed [14-1:0] pld_out_reg, i_out_reg; //registers for pld_out and i_out for non-time-critical tasks
    wire                 pid_i_on, i_issat; // slow integrator enabled (from physical 3-state switch, debounced), unlimited integrator saturated

    // lock monitoring --------------------------
    reg         [ 4-1:0] rl_config; // Selection of (multiple) loss of lock detection sources [slow_int_issat,rl_signal_max,rl_signal_min,rl_error_max]
    reg  signed [14-1:0] rl_error_max; // Threshold for error signal. Detects loss of lock when |error| > rl_error_max
    reg  signed [14-1:0] rl_signal_min; // Threshold for signal. Detects loss of lock when signal < rl_signal_min
    reg  signed [14-1:0] rl_signal_max; // Threshold for signal. Detects loss of lock when signal > rl_signal_max
    reg          [4-1:0] lock_fail; //list of lock failure signals
    wire                 rl_unlocked; //loss of lock detection: high when a lock failure signal selected by rl_config goes high

    // scope --------------------------
    reg         [ 2-1:0] oscA_sw,oscB_sw; //selectors for signals sent to scope module
    reg                  trig_sw; // selectors for trigger sent to scope module and GPIO->BNC

    // [WIREREG DOCK END]


    // Ramp generator **************************************************

    debounce1 debounce_ramp_on(
    .clk  (clk),
    .in  (ramp_on_sw),
    .out  (ramp_on)
    );

    increment_lin_unsign #(.poswidth(14)) incr_ramp_ampl(
        .clk(clk),
        .rst(rst),
        .incr_cnt_in(ramp_enc),
        .cnt_selmode(ramp_sm),
        .step (ramp_ampl_step),
        .count(ramp_ampl)
    );

    increment_lin #(.poswidth(13),.negwidth(13)) incr_ramp_offset(
        .clk(clk),
        .rst(rst),
        .incr_cnt_in(offset_enc),
        .cnt_selmode(offset_sm),
        .step( ramp_offs_step),
        .count(ramp_offset)
    );    

    gen_ramp #(.R(14)) i_gen_ramp (
        .clk(clk),  .rst(rst),
        // inputs
        .ramp_freqexp( ramp_freqexp ),
        .ramp_ampl( ramp_ampl ),
        .ramp_offset  ( ramp_offset  ),
        .ramp_B_offset (offset_out_B),
        .ramp_reset    ( ~ramp_on       ),
        .ramp_B_factor ( ramp_B_factor   ),
        // outputs
        .trigger ( ramp_trigger ),
        .outA          ( ramp_A          ),
        .outB          ( ramp_B          )
    );
    /* end Ramp generator *********************************************/
 
    // Square modulation generator **********************************************

    gen_mod2  i_gen_mod (
       // input
      .clk       (  clk              ),  // clock
      .rst       (  rst              ),  // reset - active low
      .phase_sq  (  loc_osc_phase ),  // square modulation phase
      .sqp       (  mod_period      ),  // square modulation half-period
      // output
      .sq_ref    (  mod_sqr     ),  // square modulation
      .sq_phas   (  loc_osc_sqr    ),  // square modulation with phase
      .square_trig   ( mod_trigger   )  // trigger sync. with square modulation 

    );

    /* end square modulation generator *****************************************/

    // Demodulation *****************************************/

    SqrDemod demodIn1(
        .clk(clk),
        .rst(rst),
        .in(in1),
        .lo_in(loc_osc_sqr),
        .lpf_ctrl(demod_lpf),
        .exp_gain(demod_gain),
        .out(demod_out)
    );
    
    /* end demodulation *****************************************/

    // Error signal *****************************************/

    assign offset_minus_error =  error_sw ? error_offset - demod_out : error_offset - in1;//inverting the sign to have positive PID coeffs by default        
    satsigned #(.Ri(15),.Ro(14)) i_satsigned_error  ( .in(offset_minus_error),  .out(error) );

    always @(posedge clk)
        error_reg <= error;

    mean_var_calc #(.R(14),.N(24))  mean_var_error(
    .clk(clk),
    .rst(rst),
    .data_i(error_reg),
    .mean_o(error_mean),
    .var_o(error_var)
    ); 

    /* end error signal *****************************************/


    // PID (unlimited integrator + limited PI²D)  ****/

    debounce1 debounce_lock_en(
    .clk  (clk),
    .in  (pid_i_on_sw),
    .out  (pid_i_on)
    );

     piid i_lock_pid(
       .clk( clk ),
       .rst_all( rst | pid_off ),  
       .rst_int( ~pid_i_on ) ,  
       .pid_freeze( pid_freeze ), 
       .error( error_reg ),
       .pld_out_offset (ramp_B), 
       .i_out_offset (ramp_A), 
       .pld_out( pld_out ), 
       .i_out( i_out ),
       .i_issat(i_issat),
       .ISR (pid_ISR) ,
       .PSR( pid_PSR ) , 
       .LSR( pid_LSR ) , 
       .FSR( pid_FSR ) , 
       .DSR( pid_DSR) , 
       .ki( pid_ki), 
       .kp( pid_kp), 
       .kl( pid_kl), 
       .kf( pid_kf), 
       .kd( pid_kd), 
       .cl( pid_cl), 
       .cf( pid_cf), 
       .cd( pid_cd)
    );

    always @(posedge clk) begin // registers for non-time-critical tasks
        i_out_reg  <= i_out;
//        pld_out_reg  <= pld_out;
    end
 
    assign out1 = i_out;
    assign out2 = pld_out;

   /* end PID    ***********************************************/

    // Lock monitoring  ***************************************************
    
    always @(posedge clk)
        lock_fail <= {i_issat, (in2 > rl_signal_max), (in2 < rl_signal_min), ((error_reg > rl_error_max) | (error_reg < - rl_error_max))};

    debounce1 #(.N(7)) i_debounce_rl_unlocked ( .clk(clk), .in(|(lock_fail & rl_config)), .out(rl_unlocked));

    /* end lock monitoring  **********************************************/


    // Scope signal selection  *********************************************************

    muxer_pipe2  #(.RES(14)) i_muxer2_scope1 (
        .clk(clk),
        .sel ( oscA_sw ),
        .in0 ( in1 ),
        .in1 ( error_reg ),
        .in2 ( i_out_reg ),
        .in3 ( { ~mod_sqr  , 1'b1, 12'b0 } ),
        .out ( oscA  )
    );


    muxer_pipe2  #(.RES(14)) i_muxer2_scope2 (
        .clk(clk),
        .sel  ( oscB_sw ),
        .in0 ( in2 ),
        .in1 ( error_reg ),
//        .in2 ( pld_out_reg ),
        .in2 ( pld_out ),
        .in3 ( { ~loc_osc_sqr , 1'b1, 12'b0} ),
        .out ( oscB  )
    );


     trigger_input  #(.N(3)) i_trigger_input (
        .clk(clk), .rst(rst),
        .trig_in ( {mod_trigger,ramp_trigger} ),
        .trig_sel( trig_sw         ),
        .trig_out(trigger)
    ) ;

    /* end scope signal selection  *****************************************/


    // [FPGA MEMORY DOCK]
    //---------------------------------------------------------------------------------
        
    //
    //  System bus connection

    // SO --> MEMORIA --> FPGA

    always @(posedge clk)
    if (rst) begin
        oscA_sw                <=  2'd0     ; // switch for muxer oscA
        oscB_sw                <=  2'd0     ; // switch for muxer oscB
        osc_ctrl               <=  2'd3     ; // oscilloscope control // [osc2_filt_off,osc1_filt_off]
        trig_sw                <=  1'b0     ; // Select the external trigger signal
        mod_period             <=  7'd0     ; // square local oscillator period
        loc_osc_phase          <=  8'd0     ; // phase relation of sqf signal
        demod_lpf              <=  5'b11000    ; // demodulation low pass filter control :{4=enableLP2,3=enableLP1,2:0=damping time}
        demod_gain             <=  4'd5     ; // amplification of square local oscillator
        ramp_B_factor          <= 14'd0  ; // proportional factor ramp_A/ramp_B. // ramp_B=ramp_A*ramp_B_factor/4096
        ramp_freqexp           <=  4'd8     ; // ramp frequency exponent
        error_offset           <= 14'b0     ; // offset for the error signal
        offset_out_B           <= 14'b0     ; // offset for fast PID output
        pid_kp                <=  11'd0     ; // pid proportional gain factor
        pid_PSR               <=   3'd2     ; // pid proportional gain exponent
        pid_off               <=   1'b0     ; // pid off when high
        error_sw               <=  1'b0     ; // select error signal
        pid_ki                <=  11'd0     ; // pid unlimited integrator gain factor
        pid_ISR               <=   3'd5     ; // pid unlimited integrator gain exponent
        pid_kl                <=  11'd0     ; // pid limited integrator gain factor
        pid_LSR               <=   3'd5     ; // pid limited integrator gain exponent
        pid_cl                <=   3'd4     ; // pid limited integrator cutoff exponent
        pid_kf                <=  11'd0     ; // pid fast limited integrator gain factor
        pid_FSR               <=   3'd3     ; // pid fast limited integrator gain exponent
        pid_cf                <=   3'd3     ; // pid fast imited integrator cutoff exponent
        pid_kd                <=  11'd0     ; // pid derivator gain factor
        pid_DSR               <=   3'd3     ; // pid derivator gain exponent
        pid_cd                <=   3'd2     ; // pid derivator cutoff exponent
        rl_config              <=  4'd0     ; // Selection of (multiple) loss of lock detection sources [slow_int_issat,rl_signal_min,rl_signal_max,rl_error_max]
        rl_error_max           <= 13'd0     ; // Threshold for error signal. Detects loss of lock when |error| > rl_error_max
        rl_signal_min          <= 14'd0     ; // Threshold for signal. Detects loss of lock when signal < rl_signal_min
        rl_signal_max          <= 14'd0     ; // Selects signal for loss of lock detection
    end else begin
        if (sys_wen) begin
/* This is more resource-efficient, but I couldn't make the memory map in fpga_lock.c work like in the SeqPID project.
            if (sys_addr[5:2]==4'h0)  {trig_sw, osc_ctrl, oscB_sw, oscA_sw}               <=  {sys_wdata[24],sys_wdata[17:16],sys_wdata[9:8],sys_wdata[1:0]} ; // 20'h00000: {select error signal, trigger selection,scope filter control,switch for oscB input,switch for oscA input}
            if (sys_addr[5:2]==4'h1)  {demod_gain, demod_lpf, loc_osc_phase, mod_period}  <=  {sys_wdata[27:24],sys_wdata[20:16],sys_wdata[15:8],sys_wdata[6:0]}; // 20'h0000C: {amplification of demodulated signal, demodulation low-pass filter config, demodulation phase, period of modulation signal}
            if (sys_addr[5:2]==4'h2)  {ramp_freqexp, ramp_B_factor}                       <=  {sys_wdata[19:16],sys_wdata[13:0]}; // 20'h00010: {frequency exponent of the triangular ramp signal, proportional factor ramp_A/ramp_B. // ramp_B=ramp_A*ramp_B_factor/4096}
            if (sys_addr[5:2]==4'h3)  {offset_out_B, error_offset}                        <=  {sys_wdata[29:16],sys_wdata[13:0]}; // 20'h00014: {pid fast output offset, eror signal offset}
            if (sys_addr[5:2]==4'h4)  {error_sw, pid_off, pid_PSR, pid_kp}                <=  {sys_wdata[28],sys_wdata[24],sys_wdata[18:16],sys_wdata[10:0]}; // 20'h0001C: pid off when high, PID proportional gain {exponent, factor}
            if (sys_addr[5:2]==4'h5)  {pid_ISR, pid_ki}                                   <=  {sys_wdata[18:16],sys_wdata[10:0]}; // 20'h00018: PID unlimited integrator gain {exponent, factor}
            if (sys_addr[5:2]==4'h6)  {pid_cl, pid_LSR, pid_kl}                           <=  {sys_wdata[26:24],sys_wdata[18:16],sys_wdata[10:0]}; // 20'h00020: PID slow limited integrator gain {cutoff time, exponent, factor}
            if (sys_addr[5:2]==4'h7)  {pid_cf, pid_FSR, pid_kf}                           <=  {sys_wdata[26:24],sys_wdata[18:16],sys_wdata[10:0]}; // 20'h00004: PID fast limited integrator gain {cutoff time, exponent, factor}
            if (sys_addr[5:2]==4'h8)  {pid_cd, pid_DSR, pid_kd}                           <=  {sys_wdata[26:24],sys_wdata[18:16],sys_wdata[10:0]}; // 20'h00008: PID limited differentiator gain {cutoff time, exponent, factor}
            if (sys_addr[5:2]==4'h9)  {rl_error_max, rl_config}                           <=  {sys_wdata[28:16],sys_wdata[3:0]}; // 20'h00004: {Threshold for error signal: Detects loss of lock when |error| > rl_error_max , Selection of (multiple) loss of lock detection sources : [rl_pid_sat,rl_signal_min,rl_signal_max,rl_error_max]}
            if (sys_addr[5:2]==4'hA)  {rl_signal_max, rl_signal_min}                      <=  {sys_wdata[29:16],sys_wdata[13:0]}; // 20'h00008: {Detect loss of lock when signal > rl_signal_max, Detect loss of lock when signal < rl_signal_min}
*/
/*
            if (sys_addr[19:0]==20'h00000)  oscA_sw               <=  sys_wdata[ 2-1: 0] ; // switch for signal to oscA
            if (sys_addr[19:0]==20'h00004)  oscB_sw               <=  sys_wdata[ 2-1: 0] ; // switch for signal to  oscB
            if (sys_addr[19:0]==20'h00008)  osc_ctrl              <=  sys_wdata[ 2-1: 0] ; // oscilloscope control // [osc2_filt_off,osc1_filt_off]
            if (sys_addr[19:0]==20'h0000C)  trig_sw               <=  sys_wdata[      0] ; // Select the trigger signal
            if (sys_addr[19:0]==20'h00010)  mod_period            <=  sys_wdata[7-1: 0] ; // square modulation half-period
            if (sys_addr[19:0]==20'h00014)  loc_osc_phase         <=  sys_wdata[8-1: 0] ; // phase of local oscillator relative to modulation
            if (sys_addr[19:0]==20'h00018)  demod_lpf             <=  sys_wdata[ 5-1: 0] ; // Low Pass Filter of demodulated signal
            if (sys_addr[19:0]==20'h0001C)  demod_gain            <=  sys_wdata[ 4-1: 0] ; // amplification of demodulated signal
            if (sys_addr[19:0]==20'h00020)  ramp_B_factor         <=  sys_wdata[14-1: 0] ; // proportional factor ramp_A/ramp_B. // ramp_B=ramp_A*ramp_B_factor/4096
            if (sys_addr[19:0]==20'h00024)  ramp_freqexp          <=  sys_wdata[   3: 0] ; // frequency exponent of the triangular ramp signal
            if (sys_addr[19:0]==20'h0002C)  error_offset          <=  sys_wdata[14-1: 0] ; // offset for the error signal
            if (sys_addr[19:0]==20'h00030)  offset_out_B          <=  sys_wdata[14-1: 0] ; // offset for fast PID output
            if (sys_addr[19:0]==20'h00034)  pid_kp                <=  sys_wdata[11-1: 0] ; // pid proportional gain factor
            if (sys_addr[19:0]==20'h00038)  pid_PSR               <=  sys_wdata[ 3-1: 0] ; // pid proportional gain exponent
            if (sys_addr[19:0]==20'h0003C)  pid_off               <=  sys_wdata[0]      ; // pid off when high
            if (sys_addr[19:0]==20'h00040)  error_sw              <=  sys_wdata[      0] ; // select error signal
            if (sys_addr[19:0]==20'h00044)  pid_ki                <=  sys_wdata[11-1: 0] ; // pid unlimited integrator gain factor
            if (sys_addr[19:0]==20'h00048)  pid_ISR               <=  sys_wdata[ 3-1: 0] ; // pid unlimited integrator gain exponent
            if (sys_addr[19:0]==20'h00054)  pid_kl                <=  sys_wdata[11-1: 0] ; // pid slow limited integrator gain factor
            if (sys_addr[19:0]==20'h00058)  pid_LSR               <=  sys_wdata[ 3-1: 0] ; // pid slow limited integrator gain exponent
            if (sys_addr[19:0]==20'h0005C)  pid_cl                <=  sys_wdata[ 3-1: 0] ; // pid slow limited integrator gain cutoff time
            if (sys_addr[19:0]==20'h00060)  pid_kf                <=  sys_wdata[11-1: 0] ; // pid fast limited integrator gain factor
            if (sys_addr[19:0]==20'h00064)  pid_FSR               <=  sys_wdata[ 3-1: 0] ; // pid fast limited integrator gain exponent
            if (sys_addr[19:0]==20'h00068)  pid_cf                <=  sys_wdata[ 3-1: 0] ; // pid fast limited integrator cutoff time
            if (sys_addr[19:0]==20'h0006C)  pid_kd                <=  sys_wdata[11-1: 0] ; // pid derivative gain factor
            if (sys_addr[19:0]==20'h00070)  pid_DSR               <=  sys_wdata[ 3-1: 0] ; // pid derivative gain exponent
            if (sys_addr[19:0]==20'h00074)  pid_cd                <=  sys_wdata[ 3-1: 0] ; // pid derivative cutoff time
            if (sys_addr[19:0]==20'h00078)  rl_config             <=  sys_wdata[ 4-1: 0] ; // Selection of (multiple) loss of lock detection sources. [rl_pid_sat,rl_signal_min,rl_signal_max,rl_error_max]
            if (sys_addr[19:0]==20'h00080)  rl_error_max          <=  sys_wdata[13-1: 0] ; // Threshold for error signal. Detects loss of lock when |error| > rl_error_max
            if (sys_addr[19:0]==20'h00084)  rl_signal_min         <=  sys_wdata[14-1: 0] ; // Threshold for signal. Detects loss of lock when signal < rl_signal_min
            if (sys_addr[19:0]==20'h00088)  rl_signal_max         <=  sys_wdata[14-1: 0] ; // Threshold for signal. Detects loss of lock when signal > rl_signal_max
*/
// This is equivalent to the above, saves resources and improves timing
            if (sys_addr[7:2]==6'h00)  oscA_sw               <=  sys_wdata[ 2-1: 0] ; // 20'h00000: switch for signal to oscA
            if (sys_addr[7:2]==6'h01)  oscB_sw               <=  sys_wdata[ 2-1: 0] ; // 20'h00004: switch for signal to  oscB
            if (sys_addr[7:2]==6'h02)  osc_ctrl              <=  sys_wdata[ 2-1: 0] ; // 20'h00008: oscilloscope control // [osc2_filt_off,osc1_filt_off]
            if (sys_addr[7:2]==6'h03)  trig_sw               <=  sys_wdata[      0] ; // 20'h0000C: Select the trigger signal
            if (sys_addr[7:2]==6'h04)  mod_period            <=  sys_wdata[ 7-1: 0] ; // 20'h00010: square modulation half-period
            if (sys_addr[7:2]==6'h05)  loc_osc_phase         <=  sys_wdata[ 8-1: 0] ; // 20'h00014: phase of local oscillator relative to modulation
            if (sys_addr[7:2]==6'h06)  demod_lpf             <=  sys_wdata[ 5-1: 0] ; // 20'h00018: Low Pass Filter of demodulated signal
            if (sys_addr[7:2]==6'h07)  demod_gain            <=  sys_wdata[ 4-1: 0] ; // 20'h0001C: amplification of demodulated signal
            if (sys_addr[7:2]==6'h08)  ramp_B_factor         <=  sys_wdata[14-1: 0] ; // 20'h00020: proportional factor ramp_A/ramp_B. // ramp_B=ramp_A*ramp_B_factor/4096
            if (sys_addr[7:2]==6'h09)  ramp_freqexp          <=  sys_wdata[   3: 0] ; // 20'h00024: frequency exponent of the triangular ramp signal
            if (sys_addr[7:2]==6'h0B)  error_offset          <=  sys_wdata[14-1: 0] ; // 20'h0002C: offset for the error signal
            if (sys_addr[7:2]==6'h0C)  offset_out_B          <=  sys_wdata[14-1: 0] ; // 20'h00030: offset for fast PID output
            if (sys_addr[7:2]==6'h0D)  pid_kp                <=  sys_wdata[11-1: 0] ; // 20'h00034: pid proportional gain factor
            if (sys_addr[7:2]==6'h0E)  pid_PSR               <=  sys_wdata[ 3-1: 0] ; // 20'h00038: pid proportional gain exponent
            if (sys_addr[7:2]==6'h0F)  pid_off               <=  sys_wdata[0]       ; // 20'h0003C: pid off when high
            if (sys_addr[7:2]==6'h10)  error_sw              <=  sys_wdata[      0] ; // 20'h00040: select error signal
            if (sys_addr[7:2]==6'h11)  pid_ki                <=  sys_wdata[11-1: 0] ; // 20'h00044: pid unlimited integrator gain factor
            if (sys_addr[7:2]==6'h12)  pid_ISR               <=  sys_wdata[ 3-1: 0] ; // 20'h00048: pid unlimited integrator gain exponent
            if (sys_addr[7:2]==6'h15)  pid_kl                <=  sys_wdata[11-1: 0] ; // 20'h00054: pid slow limited integrator gain factor
            if (sys_addr[7:2]==6'h16)  pid_LSR               <=  sys_wdata[ 3-1: 0] ; // 20'h00058: pid slow limited integrator gain exponent
            if (sys_addr[7:2]==6'h17)  pid_cl                <=  sys_wdata[ 3-1: 0] ; // 20'h0005C: pid slow limited integrator gain cutoff time
            if (sys_addr[7:2]==6'h18)  pid_kf                <=  sys_wdata[11-1: 0] ; // 20'h00060: pid fast limited integrator gain factor
            if (sys_addr[7:2]==6'h19)  pid_FSR               <=  sys_wdata[ 3-1: 0] ; // 20'h00064: pid fast limited integrator gain exponent
            if (sys_addr[7:2]==6'h1A)  pid_cf                <=  sys_wdata[ 3-1: 0] ; // 20'h00068: pid fast limited integrator cutoff time
            if (sys_addr[7:2]==6'h1B)  pid_kd                <=  sys_wdata[11-1: 0] ; // 20'h0006C: pid derivative gain factor
            if (sys_addr[7:2]==6'h1C)  pid_DSR               <=  sys_wdata[ 3-1: 0] ; // 20'h00070: pid derivative gain exponent
            if (sys_addr[7:2]==6'h1D)  pid_cd                <=  sys_wdata[ 3-1: 0] ; // 20'h00074: pid derivative cutoff time
            if (sys_addr[7:2]==6'h1E)  rl_config             <=  sys_wdata[ 4-1: 0] ; // 20'h00078: Selection of (multiple) loss of lock detection sources. [rl_pid_sat,rl_signal_min,rl_signal_max,rl_error_max]
            if (sys_addr[7:2]==6'h20)  rl_error_max          <=  sys_wdata[13-1: 0] ; // 20'h00080: Threshold for error signal. Detects loss of lock when |error| > rl_error_max
            if (sys_addr[7:2]==6'h21)  rl_signal_min         <=  sys_wdata[14-1: 0] ; // 20'h00084: Threshold for signal. Detects loss of lock when signal < rl_signal_min
            if (sys_addr[7:2]==6'h22)  rl_signal_max         <=  sys_wdata[14-1: 0] ; // 20'h00088: Threshold for signal. Detects loss of lock when signal > rl_signal_max
        end
    end
    //---------------------------------------------------------------------------------
    // FPGA --> MEMORIA --> SO
    wire sys_en;
    assign sys_en = sys_wen | sys_ren;

    always @(posedge clk, posedge rst)
    if (rst) begin
        sys_err <= 1'b0  ;
        sys_ack <= 1'b0  ;
    end else begin
        sys_err <= 1'b0 ;
        sys_ack <= sys_en;//no delayed acknowledgements here (no BRAMs used)
/* This looks nice and has a wns of 0.303 but, unlike in the SeqPID project, the C code only gets the first element of a uint32
        casez (sys_addr[5:2]) //1 signal at most per 1 hex = 4 bits, to make the registers ~ human-readable
            4'h0 : sys_rdata <= { 7'b0, trig_sw, 6'b0, osc_ctrl, 6'b0, oscB_sw, 6'b0, oscA_sw };
            4'h1 : sys_rdata <= { 4'b0, demod_gain, 3'b0, demod_lpf, loc_osc_phase, 1'b0, mod_period };
            4'h2 : sys_rdata <= { 7'b0, ramp_on, 4'b0, ramp_freqexp, 2'b0, ramp_B_factor };
            4'h3 : sys_rdata <= { 2'b0, offset_out_B, 2'b0, error_offset };
            4'h4 : sys_rdata <= { 3'b0, error_sw, 3'b0, pid_off, 5'b0, pid_PSR, 5'b0, pid_kp  };
            4'h5 : sys_rdata <= { 3'b0, pid_freeze_reg, 3'b0, pid_i_on, 5'b0, pid_ISR, 5'b0, pid_ki };
            4'h6 : sys_rdata <= { 5'b0, pid_cl, 5'b0, pid_LSR, 5'b0, pid_kl };
            4'h7 : sys_rdata <= { 5'b0, pid_cf, 5'b0, pid_FSR, 5'b0, pid_kf };
            4'h8 : sys_rdata <= { 5'b0, pid_cd, 5'b0, pid_DSR, 5'b0, pid_kd };
            4'h9 : sys_rdata <= { 3'b0, rl_error_max, 7'b0, rl_unlocked, 4'b0, rl_config };
            4'hA : sys_rdata <= { 2'b0, rl_signal_max, 2'b0, rl_signal_min };
            4'hB : sys_rdata <= {18'b0, error_mean  };
            4'hC : sys_rdata <= { 4'b0, error_var  } ;
            4'hD : sys_rdata <= { 2'b0, ramp_ampl, 2'b0, ramp_offset };
            4'hE : sys_rdata <= { 5'b0, ramp_ampl_step, 5'b0, ramp_offs_step};
            default   : sys_rdata <=  32'h0        ;
        endcase
*/
/*
        casez (sys_addr[19:0])
            20'h00000 : sys_rdata <= {  30'b0                   ,          oscA_sw }; // switch for muxer oscA
            20'h00004 : sys_rdata <= {  30'b0                   ,          oscB_sw }; // switch for muxer oscB
            20'h00008 : sys_rdata <= {  30'b0                   ,         osc_ctrl }; // oscilloscope control // [osc2_filt_off,osc1_filt_off]
            20'h0000C : sys_rdata <= {  31'b0                   ,          trig_sw }; // Select the external trigger signal
            20'h00010 : sys_rdata <= {  25'b0                   ,       mod_period }; // square signal period
            20'h00014 : sys_rdata <= {  24'b0                   ,    loc_osc_phase }; // phase relation of sqf signal
            20'h00018 : sys_rdata <= {  27'b0                   ,         demod_lpf}; // Low Pass Filter of SQ
            20'h0001C : sys_rdata <= {  28'b0                   ,        demod_gain}; // amplification of SQo
            20'h00020 : sys_rdata <= {  {18{ramp_B_factor[13]}} ,    ramp_B_factor }; // proportional factor ramp_A/ramp_B. // ramp_B=ramp_A*ramp_B_factor/4096
            20'h00024 : sys_rdata <=    {28'b0                  ,      ramp_freqexp}; // period of the triangular ramp signal
            20'h00028 : sys_rdata <= {  31'b0                   ,          ramp_on }; // ramp enabled
            20'h0002C : sys_rdata <= {  {18{error_offset[13]}}  ,     error_offset }; // offset for the error signal
            20'h00030 : sys_rdata <= {  {18{offset_out_B[13]}}  ,     offset_out_B }; // offset for fast PID output
            20'h00034 : sys_rdata <= {  {21{pid_kp[10]}}        ,          pid_kp  }; // pidA proportional constant
            20'h00038 : sys_rdata <= {  29'b0                   ,         pid_PSR  }; // pidA PSR
            20'h0003C : sys_rdata <= {  31'b0                   ,         pid_off  }; // switch selector for pidA input
            20'h00040 : sys_rdata <= {  31'b0                   ,         error_sw }; // select error signal
            20'h00044 : sys_rdata <= {  {21{pid_ki[10]}}        ,          pid_ki  }; // pidA set_point
            20'h00048 : sys_rdata <= {  29'b0                   ,         pid_ISR  }; // pidA saturation control
            20'h0004C : sys_rdata <= {  31'b0                   ,         pid_i_on }; // switch selector for pidB input
            20'h00050 : sys_rdata <= {  31'b0                   ,   pid_freeze_reg }; // PID is frozen
            20'h00054 : sys_rdata <= {  {21{pid_kl[10]}}        ,          pid_kl  }; // pidA integral constant
            20'h00058 : sys_rdata <= {  29'b0                   ,         pid_LSR  }; // pidA ISR
            20'h0005C : sys_rdata <= {  29'b0                   ,          pid_cl  }; // pidA fast limited integrator cutoff
            20'h00060 : sys_rdata <= {  {21{pid_kf[10]}}        ,          pid_kf  }; // pidA fast limited integral constant
            20'h00064 : sys_rdata <= {  29'b0                   ,         pid_FSR  }; // pidA FSR
            20'h00068 : sys_rdata <= {  29'b0                   ,          pid_cf  }; // pidA fast limited integrator cutoff
            20'h0006C : sys_rdata <= {  {21{pid_kd[10]}}        ,          pid_kd  }; // pidA derivative constant
            20'h00070 : sys_rdata <= {  29'b0                   ,         pid_DSR  }; // pidA DSR
            20'h00074 : sys_rdata <= {  29'b0                   ,          pid_cd  }; // pidA differentiator cutoff
            20'h00078 : sys_rdata <= {  28'b0                   ,        rl_config }; // Selection of (multiple) loss of lock detection sources [slow_int_issat,rl_signal_min,rl_signal_max,rl_error_max]
            20'h0007C : sys_rdata <= {  31'b0                   ,      rl_unlocked }; // Relock state: [state:idle|searching|failed,signal_fail,error_fail,locked]
            20'h00080 : sys_rdata <= {  19'b0                   ,     rl_error_max }; // Threshold for error signal. Detects loss of lock when |error| > rl_error_max
            20'h00084 : sys_rdata <= { {18{rl_signal_min[13]}}  ,    rl_signal_min }; // Min threshold for signal. Detects loss of lock when signal < rl_signal_min
            20'h00088 : sys_rdata <= { {18{rl_signal_max[13]}}  ,    rl_signal_max }; // Max threshold for signal. Detects loss of lock when signal > rl_signal_max
            20'h0008C : sys_rdata <= { {18{error_mean[13]}}     ,       error_mean }; // 134 ms error mean val
            20'h00090 : sys_rdata <= {  4'b0                    ,        error_var }; // 134 ms error square sum val
            20'h00094 : sys_rdata <= { {18{ramp_offset[13]}}    ,      ramp_offset }; // ramp offset
            20'h00098 : sys_rdata <= {  18'b0                   ,        ramp_ampl }; // ramp amplitude
            20'h0009C : sys_rdata <= {  21'b0                   ,   ramp_offs_step }; // ramp offset step
            20'h000A0 : sys_rdata <= {  21'b0                   ,   ramp_ampl_step };// ramp amplitude step
            default   : sys_rdata <=  32'h0        ;
        endcase
*/
// This is equivalent to the above, saves resources and improves timing
        casez (sys_addr[7:2])
            6'h00 : sys_rdata <= {  30'b0                   ,          oscA_sw }; // 20'h00000 : switch for muxer oscA
            6'h01 : sys_rdata <= {  30'b0                   ,          oscB_sw }; // 20'h00004 : switch for muxer oscB
            6'h02 : sys_rdata <= {  30'b0                   ,         osc_ctrl }; // 20'h00008 : oscilloscope control // [osc2_filt_off,osc1_filt_off]
            6'h03 : sys_rdata <= {  31'b0                   ,          trig_sw }; // 20'h0000C : Select the external trigger signal
            6'h04 : sys_rdata <= {  25'b0                   ,       mod_period }; // 20'h00010 :square signal period
            6'h05 : sys_rdata <= {  24'b0                   ,    loc_osc_phase }; // 20'h00014 : phase relation of sqf signal
            6'h06 : sys_rdata <= {  27'b0                   ,         demod_lpf}; // 20'h00018 : Low Pass Filter of SQ
            6'h07 : sys_rdata <= {  28'b0                   ,        demod_gain}; // 20'h0001C : amplification of SQo
            6'h08 : sys_rdata <= {  {18{ramp_B_factor[13]}} ,    ramp_B_factor }; // 20'h00020 : proportional factor ramp_A/ramp_B. // ramp_B=ramp_A*ramp_B_factor/4096
            6'h09 : sys_rdata <=    {28'b0                  ,      ramp_freqexp}; // 20'h00024 : period of the triangular ramp signal
            6'h0A : sys_rdata <= {  31'b0                   ,          ramp_on }; // 20'h00028 : ramp enabled
            6'h0B : sys_rdata <= {  {18{error_offset[13]}}  ,     error_offset }; // 20'h0002C : offset for the error signal
            6'h0C : sys_rdata <= {  {18{offset_out_B[13]}}  ,     offset_out_B }; // 20'h00030 : offset for fast PID output
            6'h0D : sys_rdata <= {  {21{pid_kp[10]}}        ,          pid_kp  }; // 20'h00034 : pidA proportional constant
            6'h0E : sys_rdata <= {  29'b0                   ,         pid_PSR  }; // 20'h00038 : pidA PSR
            6'h0F : sys_rdata <= {  31'b0                   ,         pid_off  }; // 20'h0003C : switch selector for pidA input
            6'h10 : sys_rdata <= {  31'b0                   ,         error_sw }; // 20'h00040 : select error signal
            6'h11 : sys_rdata <= {  {21{pid_ki[10]}}        ,          pid_ki  }; // 20'h00044 : pidA set_point
            6'h12 : sys_rdata <= {  29'b0                   ,         pid_ISR  }; // 20'h00048 : pidA saturation control
            6'h13 : sys_rdata <= {  31'b0                   ,         pid_i_on }; // 20'h0004C : switch selector for pidB input
            6'h14 : sys_rdata <= {  31'b0                   ,       pid_freeze }; // 20'h00050 : PID is frozen
            6'h15 : sys_rdata <= {  {21{pid_kl[10]}}        ,          pid_kl  }; // 20'h00054 : pidA integral constant
            6'h16 : sys_rdata <= {  29'b0                   ,         pid_LSR  }; // 20'h00058 : pidA ISR
            6'h17 : sys_rdata <= {  29'b0                   ,          pid_cl  }; // 20'h0005C : pidA fast limited integrator cutoff
            6'h18 : sys_rdata <= {  {21{pid_kf[10]}}        ,          pid_kf  }; // 20'h00060 : pidA fast limited integral constant
            6'h19 : sys_rdata <= {  29'b0                   ,         pid_FSR  }; // 20'h00064 : pidA FSR
            6'h1A : sys_rdata <= {  29'b0                   ,          pid_cf  }; // 20'h00068 : pidA fast limited integrator cutoff
            6'h1B : sys_rdata <= {  {21{pid_kd[10]}}        ,          pid_kd  }; // 20'h0006C : pidA derivative constant
            6'h1C : sys_rdata <= {  29'b0                   ,         pid_DSR  }; // 20'h00070 : pidA DSR
            6'h1D : sys_rdata <= {  29'b0                   ,          pid_cd  }; // 20'h00074 : pidA differentiator cutoff
            6'h1E : sys_rdata <= {  28'b0                   ,        rl_config }; // 20'h00078 : Selection of (multiple) loss of lock detection sources [slow_int_issat,rl_signal_max,rl_signal_min,rl_error_max]
            6'h1F : sys_rdata <= {  31'b0                   ,      rl_unlocked }; // 20'h0007C : Relock state: [state:idle|searching|failed,signal_fail,error_fail,locked]
            6'h20 : sys_rdata <= {  19'b0                   ,     rl_error_max }; // 20'h00080 : Threshold for error signal. Detects loss of lock when |error| > rl_error_max
            6'h21 : sys_rdata <= { {18{rl_signal_min[13]}}  ,    rl_signal_min }; // 20'h00084 : Min threshold for signal. Detects loss of lock when signal < rl_signal_min
            6'h22 : sys_rdata <= { {18{rl_signal_max[13]}}  ,    rl_signal_max }; // 20'h00088 : Max threshold for signal. Detects loss of lock when signal > rl_signal_max
            6'h23 : sys_rdata <= { {18{error_mean[13]}}     ,       error_mean }; // 20'h0008C : 134 ms error mean val
            6'h24 : sys_rdata <= {  4'b0                    ,        error_var }; // 20'h00090 : 134 ms error square sum val
            6'h25 : sys_rdata <= { {18{ramp_offset[13]}}    ,      ramp_offset }; // 20'h00094 : ramp offset
            6'h26 : sys_rdata <= {  18'b0                   ,        ramp_ampl }; // 20'h00098 : ramp amplitude
            6'h27 : sys_rdata <= {  21'b0                   ,   ramp_offs_step }; // 20'h0009C : ramp offset step
            6'h28 : sys_rdata <= {  21'b0                   ,   ramp_ampl_step }; // 20'h000A0 : ramp amplitude step
            default   : sys_rdata <=  32'h0        ;
        endcase

    end
    // [FPGA MEMORY DOCK END]

endmodule

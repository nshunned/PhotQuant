`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// 
// Scanning module with ramp shape. Outputs triangular ramp. Echa  value last for ramp_step clock ticks 
// before changing to the next value.
// Outputs two signals, with a amplitud relation set by ramp_B_factor
// 
// Includes a relock system wich produce an exponential amplitud increasing signal
// to find next closest lock condition.
// 
//////////////////////////////////////////////////////////////////////////////////


module gen_ramp #(parameter R=14)
    (
    input clk,rst,
    // inputs
    input         [   3:0] ramp_freqexp,//ramp frequency exponent
    input         [  13:0] ramp_ampl,//step period multiplier
    input  signed [  13:0] ramp_offset,
    input  signed [  13:0] ramp_B_offset,
    input  signed [  13:0] ramp_B_factor,
    input                  ramp_reset,
    // outputs
    output                 trigger,
    //output          [26:0] time_step,//for testing purposes
    output signed [ 13:0] outA,
    output signed [ 13:0] outB
    );
    
    // R resolution of input and output signals
    reg  signed [ 14:0] ramp_signal;
    wire signed [ 15:0] ramp_sum; /// ramp + offset
    wire signed [ 13:0] ramp_sum_lim; // ramp signal limited to 14 bits
    reg  signed [ 15:0] ramp_B_sum; /// ramp + offset_B
    // Second output
    wire signed [27-1:0] ramp_B_prod;
    
    // Counter
    reg         [28:0] cntPeriod;
    reg         [28:0] cntStep;
    reg         [ 1:0] cntPeriodPrev;
    wire        [28:0] cntPeriodRate;
    wire        [26:0] periodStep;

    // Auxiliary signals
    reg  slope;
    wire quarterPeriodFlag; // goes to 1 at each quater-period of the ramp signal

    assign cntPeriodRate =    29'd1 << ramp_freqexp; // every clock period, cntPeriod incremented by 2^(ramp_freqexp) => ramp period = 2^(29-ramp_freqexp)
    
    always @(posedge clk) begin
        cntPeriodPrev <= cntPeriod[28:27];
        if (rst|ramp_reset)
            cntPeriod            <=    29'b0   ;
        else
            cntPeriod             <=   cntPeriod + cntPeriodRate  ; //conter automatically rolls over
    end
    
    assign quarterPeriodFlag = (cntPeriod[28:27] != cntPeriodPrev);// at every quarter-period
    assign trigger = (quarterPeriodFlag & (cntPeriod[28:27]==2'b00));//trigger at center of rising ramp (cntPeriod rollover)
    
    rampstepcalc i_rampstepcalc(
    .clk(clk),
    .rst(rst),
    .ramp_freqexp(ramp_freqexp),
    .ramp_ampl(ramp_ampl),
    .ramp_step_period(periodStep)
    );
        
    always @(posedge clk) begin
        if (rst | ramp_reset | (quarterPeriodFlag &(cntPeriod[28:27]==2'b11)))//slope set to positive at reset or at 3/4 of ramp period
            slope <= 1'b0 ;
        else if (quarterPeriodFlag & (cntPeriod[28:27]==2'b01))//slope set to negative at 1/4 of ramp period
            slope <= 1'b1 ;
    end

    always @(posedge clk) begin
        if (rst | ramp_reset | (quarterPeriodFlag &(cntPeriod[28:27]==2'b10))) begin//ramp=0 when disabled or at 1/2 of a period
            cntStep     <= 29'b0  ;
            ramp_signal <= 15'sd0 ;
        end
        else if (cntStep == periodStep) begin
            cntStep     <= 29'b0  ;
            if (slope & (ramp_signal != 15'sh4000))//negative slope, ramp_signal>-2^14
                ramp_signal <= ramp_signal - 15'sd1;
            else if (~slope & (ramp_signal != 15'sh3FFF))//positive slope, ramp_signal <2^14-1
                ramp_signal <= ramp_signal + 15'sd1;
            end
        else
            cntStep <= cntStep + 1'b1 ;
    end

    assign ramp_sum = ramp_signal + ramp_offset;
    satsigned #(.Ri(16),.Ro(14)) i_satsigned_sum ( .in(ramp_sum), .out(ramp_sum_lim) );
    
    assign outA    = ramp_sum_lim ;    
    pipe_mult_signed #(.Ra(14),.Rb(14),.level(1)) i_mult_ramp_B (.clk(clk), .a(ramp_sum_lim) , .b(ramp_B_factor), .pdt(ramp_B_prod));//ramp_B_factor > -2^14 constrained in software => 27 bits enough for the product
    always @(posedge clk)
        ramp_B_sum <= $signed(ramp_B_prod[27-1:12]) + ramp_B_offset;

    satsigned #(.Ri(16),.Ro(14)) i_satsigned_B ( .in(ramp_B_sum), .out(outB) );
    
endmodule

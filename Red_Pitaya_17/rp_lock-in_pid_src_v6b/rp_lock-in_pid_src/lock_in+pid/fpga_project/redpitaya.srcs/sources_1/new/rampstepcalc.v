`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: PhotQuant team
// Engineer: Alexei
// 
// Create Date: 11.09.2019 13:00:36
// Design Name: 
// Module Name: rampstepcalc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Calculation of the ramp step period S=T/(4*A) where T=2^(29-ramp_freqexp)=2^N is the ramp period and A=ramp_ampl is the ramp amplitude.
// We use A=2^k-l where k is the least insignificant bit and l<=2^(k-1)-1, and develop T/(4*A)=2^(N-k-2)*sum((l/2^k)^m) for m in [0,N-k-1]
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rampstepcalc(
    input clk,
    input rst,
    input [3:0] ramp_freqexp,//min = 0, max = 13
    input [13:0] ramp_ampl,
    output [26:0] ramp_step_period //ramp period T = 2^(29-ramp_freqexp)-1 => maximal step period =T/4 = 2^27-1 (for amplitide =1)
    );
    
    reg  [42-1:0] dividend_reg, divisor_reg, diff_reg;//28+14-1 bits
    reg  [28-1:0] quotient_reg,quotient_done;
    wire [42-1:0] dividend_wire;
    wire          quotient_lsb;
    reg [5-1:0]  bit_cnt;//bit counter, 

    assign dividend_wire = diff_reg[41] ? dividend_reg : diff_reg;//if difference positive, it becomes the dividend
    assign quotient_lsb = !diff_reg[41];//if difference positive, quotient bit in given step is 1
    
    always @(posedge clk) begin
        if (rst) begin
            dividend_reg    <= 42'h8000000;
            divisor_reg     <= 42'b0;
            diff_reg        <= 42'h8000000;            
            quotient_reg    <= 28'b0;
            quotient_done   <= 27'h7FFFFFF;//amplitude = 0, no ramp, stay idle
            bit_cnt         <= 5'b0;
        end
        else begin
            if (!bit_cnt) begin
                dividend_reg    <= 42'h8000000 >> ramp_freqexp;//=2^(27-freqexp)
                divisor_reg     <= {1'b0, ramp_ampl, 27'b0};
                diff_reg        <= (42'h8000000 >> ramp_freqexp) - {1'b0, ramp_ampl, 27'b0};
                quotient_reg    <= 28'b0;
                quotient_done   <= quotient_reg-1;
                bit_cnt         <= 5'd29;
            end
            else begin
                dividend_reg <= dividend_wire;
                divisor_reg <= divisor_reg >> 1;
                diff_reg <= dividend_wire - divisor_reg;
                quotient_reg <= {quotient_reg[26:0],quotient_lsb} ;
                bit_cnt <= bit_cnt - 1'b1;
            end
        end
    end
    
    assign ramp_step_period = quotient_done[26:0];
    
endmodule

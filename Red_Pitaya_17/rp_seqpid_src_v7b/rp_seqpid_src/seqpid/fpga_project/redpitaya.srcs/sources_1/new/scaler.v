`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: PhotQuant
// Engineer: Alexei
// 
// Create Date: 04/22/2021 10:15:16 AM
// Design Name: 
// Module Name: scaler
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: this module rescales the generator by the PID output/setpoint ration at the moment it was frozen. 
// If the controlled signal does not drift and that the system's response is linear, it makes the system respond as if the PID was on.
// It is used when the PID is not fast enough to follow the setpoint.
// scaled_out = seqgen_in*pid_in0/seqgen_in0 where pid_in0/seqgen_in0 is the value of pid_in/seqgen_in saved when freeze goes from 0 to 1
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module scaler(
    input clk,
    input signed [13:0] seqgen_in,
    input signed [13:0] pid_in,
    input freeze,
    input signed [13:0] offset_adc,
    input signed [14:0] offset_dac,
    output reg [13:0] scaled_out
    );

wire signed [31:0] division_out;
reg signed [30:0] division_mem;
reg signed [45:0] prod_mem;
reg signed [14:0] seqgen_offs;
reg signed [15:0] pid_offs;
wire signed [31:0] prod_offs;
wire signed [13:0] prod_offs_sat;

    
div_gen_0 i_divider(
.aclk(clk),
.s_axis_divisor_tvalid(1'b1),
.s_axis_divisor_tdata({1'b0,seqgen_offs}),
.s_axis_dividend_tvalid(1'b1),
.s_axis_dividend_tdata({pid_offs}),
.m_axis_dout_tdata(division_out)
);

always @(posedge clk) begin
    if (!freeze)
        division_mem <= division_out[30:0];
    seqgen_offs <= seqgen_in + offset_adc;
    pid_offs <= pid_in + offset_dac;
    prod_mem <= division_mem * seqgen_offs;
    scaled_out <= prod_offs;
end
assign prod_offs = $signed(prod_mem[45:15]) - offset_dac;
satsigned #(.Ri(32),.Ro(14)) i_satsigned_out ( .in(prod_offs), .out(prod_offs_sat) );

endmodule

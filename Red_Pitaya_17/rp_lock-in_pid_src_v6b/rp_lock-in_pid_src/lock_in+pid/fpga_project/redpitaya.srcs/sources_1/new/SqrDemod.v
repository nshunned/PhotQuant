`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2020 11:23:26 AM
// Design Name: 
// Module Name: SqrDemod
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

module SqrDemod(
    input clk, rst,
    input signed        [14-1:0]    in,//"analog" input
    input                           lo_in,//square local oscillator
    input               [5-1 :0]    lpf_ctrl,
    input               [4-1 :0]    exp_gain,//gain exponent (bit shift),
    output reg signed   [14-1:0]    out
    );
    
wire signed [14-1:0]    demod_raw;
reg  signed [14-1:0]    demod_raw_buf;
wire signed [23-1:0]    demod_lp1;
wire signed [23-1:0]    demod_lp2;
wire signed [23-1:0]    demod_sel;
wire signed [14-1:0]    demod_sat;


assign demod_raw = lo_in ? in:-in;

always @(posedge clk)
    demod_raw_buf <= demod_raw;

LPFilterGain1 #(.Rin(14),.Sfix(2),.MaxTau(7)) i_LP_filter_Demod1 (
    .clk(clk),
    .rst(rst),
    .run(1'b1),
    .in( demod_raw ),
    .tau( lpf_ctrl[3-1:0] ),
    .out( demod_lp1 )
);

LPFilterGain1 #(.Rin(14),.Sfix(2),.MaxTau(7)) i_LP_filter_Demod2 (
    .clk(clk),
    .rst(rst),
    .run(1'b1),
    .in( demod_lp1[23-1:9] ),//keeping only integer bits of lp1
    .tau( lpf_ctrl[3-1:0] ),
    .out( demod_lp2 )
);

assign demod_sel = lpf_ctrl[4] ? demod_lp2 : (lpf_ctrl[3] ? demod_lp1 : {demod_raw_buf,9'b0});//[int14,fxp9]
satsigned #(.Ri(23),.Ro(14)) sat_demod_ampl ( .in(demod_sel >>> exp_gain), .out(demod_sat) ); //demod_sel*2⁹/2^exp_gain

always @(posedge clk)
    out <= demod_sat;
        
endmodule

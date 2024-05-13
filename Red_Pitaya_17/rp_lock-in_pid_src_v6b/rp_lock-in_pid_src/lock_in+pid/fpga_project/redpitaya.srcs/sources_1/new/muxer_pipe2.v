`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2019 10:22:28
// Design Name: 
// Module Name: muxer_pipe2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 4-input selector with registers between each layer of 2-input selectors. To be used where delays are not critical, to ease timing constraints
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module muxer_pipe2#(
   parameter     RES = 14 
)
(
   // input
   input                 clk,
   input      [  2-1: 0] sel,             // Select wire 0-3
   input      [RES-1: 0] in0,
   input      [RES-1: 0] in1,
   input      [RES-1: 0] in2,
   input      [RES-1: 0] in3,
   // output
   output reg [RES-1: 0] out                // output data
);
 reg [RES-1: 0] pipe0;
 reg [RES-1: 0] pipe1;
// switch
always @(posedge clk)
begin
    pipe0 <= sel[0] ? in1 : in0;
    pipe1 <= sel[0] ? in3 : in2;
    out   <= sel[1] ? pipe1 : pipe0;
end

endmodule
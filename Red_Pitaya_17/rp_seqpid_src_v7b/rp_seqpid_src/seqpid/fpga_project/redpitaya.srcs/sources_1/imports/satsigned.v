`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Alexei
// 
// Create Date: 06.09.2020 12:11:16
// Design Name: 
// Module Name: satsigned
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
// Saturation protection for signed integers
//
//////////////////////////////////////////////////////////////////////////////////

//(* keep_hierarchy = "yes" *) 
module satsigned #(
   parameter     Ri  = 15, 
   parameter     Ro  = 14
)
(
    //input clk,rst,
    input  signed [Ri-1:0] in,    // input signal
    output signed [Ro-1:0] out,    // output signal
    output                 issat
    );
    
    wire possat, negsat;
    assign possat = (!in[Ri-1]) & (|in[Ri-2:Ro-1]);
    assign negsat = (in[Ri-1]) &(!(&in[Ri-2:Ro-1]));
//    assign issat = !((&in[Ri-1:Ro-1]) | (!(|in[Ri-1:Ro-1])));
//    assign out = issat ? { in[Ri-1] , {Ro-1{~in[Ri-1]}} }  :  in[Ro-1:0] ;
    assign issat = possat | negsat;
    assign out = possat ? { 1'b0 , {Ro-1{1'b1}} }  :  (negsat ? {1'b1,{Ro-1{1'b0}}}: in[Ro-1:0]) ;
    
endmodule

/* 
Instantiation example:

satsigned #(.Ri(15),.Ro(14)) i_satsigned ( .in(IN), .out(OUT) );



Documentation reference


out limits for each lim input 

  Ro  |    min  |   max 
   0  |     -1  |     0
   1  |     -2  |     1
   2  |     -4  |     3
   3  |     -8  |     7
   4  |    -16  |    15
   5  |    -32  |    31
   6  |    -64  |    63
   7  |   -128  |   127
   8  |   -256  |   255
   9  |   -512  |   511
  10  |  -1024  |  1023
  11  |  -2048  |  2047
  12  |  -4096  |  4095
  13  |  -8192  |  8191

*/



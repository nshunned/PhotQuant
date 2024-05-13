`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2019 18:42:43
// Design Name: 
// Module Name: pipe_mult_signed
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


module pipe_mult_signed #(parameter Ra=14, Rb=14, level = 4)
( a, b, clk, pdt);
/*
* parameter 'R' is the width of multiplier/multiplicand;.Application Notes 10-5
* parameter 'level' is the intended number of stages of the
* pipelined multiplier;
* which is typically the smallest integer greater than or equal
* to base 2 logarithm of 'R'
*/
    input signed [Ra-1 : 0] a;
    input signed [Rb-1 : 0] b;
    input clk;
    output signed [Ra+Rb-1 : 0] pdt;
    reg signed [Ra-1 : 0] a_int;
    reg signed [Rb-1 : 0] b_int;
    reg signed [Ra+Rb-1 : 0] pdt_int [level-1 : 0];
    integer i;

    assign pdt = pdt_int [level-1];

    always @ (posedge clk)
    begin
        // registering input of the multiplier
        a_int <= a;
        b_int <= b;
        // 'level' levels of registers to be inferred at the output
        // of the multiplier
        pdt_int[0] <= a_int * b_int;
        for(i =1;i <level;i =i +1)
            pdt_int [i] <= pdt_int [i-1];
    end // always @ (posedge clk)
    
endmodule // 
    

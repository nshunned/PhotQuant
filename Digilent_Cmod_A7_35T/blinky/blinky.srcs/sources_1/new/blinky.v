`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2024 17:27:43
// Design Name: 
// Module Name: blinky
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


module blinky(
    input sysclk,
    output led0_b,
    output led0_g,
    output led0_r,
    output led1
    );
    
    assign led0_b = 1;
    assign led0_g = 1;
    assign led0_r = 1;
    
    reg [22:0] count = 0;
    assign led1 = count[22];
    always @ (posedge(sysclk))
        begin
            count <= count + 1;
        end
endmodule

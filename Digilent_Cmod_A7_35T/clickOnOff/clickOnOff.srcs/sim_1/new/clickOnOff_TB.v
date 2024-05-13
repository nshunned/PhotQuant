`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 12:13:55
// Design Name: 
// Module Name: clickOnOff_TB
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


module clickOnOff_TB;

    reg sysclk;
    reg [1:0] btn;
    wire [1:0] led;
    wire led_b, led_g, led_r;
    
    // Generate a 12 Mhz (41 ns) clock
    always begin
        sysclk = 1; #41;
        sysclk = 0; #41;
    end

    // Input signal behavior
    always begin
        btn[0] <= 0; 
        btn[1] <= 0; #511; // buttons are pressed for 100 ns
        
        btn[0] <= 1;
        btn[1] <= 1; #511; // buttons are released for 100 ns
    end

    // Instantiate module to test
    clickOnOff clickOnOff_TEST(
        .sysclk(sysclk),
        .btn(btn),
        .led(led),
        .led_b(led_b),
        .led_g(led_g),
        .led_r(led_r)
    );        

endmodule

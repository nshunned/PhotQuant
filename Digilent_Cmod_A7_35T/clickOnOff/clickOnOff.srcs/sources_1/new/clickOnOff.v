`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2024 16:21:56
// Design Name: 
// Module Name: clickOnOff
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


module clickOnOff(
    input   sysclk,       // Ports are by default considred as nets of type wire
    input   [1:0] btn,
    output  [1:0] led,
    output  led_b,
            led_g,
            led_r
);

//  # Create VCO custom clock
    wire clkout;
    clk_wiz_0 clkgen(
        .clk_out1(clkout),
        .clk_in1(sysclk)
    );

//  # #1 No toggling
//    assign led[0] = btn[0] ? 1 : 0;
//    assign led[1] = btn[1] ? 1 : 0;

//  # #2 No togglig
//    assign led[0] = btn[0];
//    assign led[1] = btn[1];

//  # #3 Toggling
//    reg [1:0] toggle0 = 0;
//    reg [1:0] toggle1 = 0;
//    assign led[0] = toggle0[0];
//    assign led[1] = toggle1[0];

//    always @ (posedge(clkout)) begin
//        if (btn[0]) begin
//            if (toggle0[1] == toggle0[0])
//                toggle0[0] <= !toggle0[0];
//        end else
//            toggle0[1] <= toggle0[0];

//        if (btn[1]) begin
//            if (toggle1[1] == toggle1[0])
//                toggle1[0] <= !toggle1[0];
//        end else
//            toggle1[1] <= toggle1[0];
//    end

//  # #4 Toggling with arrays & for-loops

//  # btnState - 1D array with depth of 2
//  # btnState[i] - vector with width of 2-bit describing states of LED[i]
//  # btnState[i][1] - previous state of LED[i]
//  # btnState[i][0] - current state of LED[i]
    reg [1:0] btnState [1:0];

//  # #4.1.1 Initialize & assign without for-loop
//    initial begin
//        btnState[0] <= 0;
//        btnState[1] <= 0;
//    end
//    assign led[0] = btnState[0][0];
//    assign led[1] = btnState[1][0];

//  # #4.1.2 Initialize & assign with for-loop
    genvar n;
    generate
        for (n = 0; n < 2; n = n+1) begin
            initial btnState[n] = 0;
            assign led[n] = btnState[n][0];
        end
    endgenerate

//  # Update button state based on previous state
    reg [1:0] i;
    always @ (posedge(clkout)) begin
        for (i = 0; i < 2; i = i+1) begin
            if (btn[i]) begin
                if (btnState[i][1] == btnState[i][0])
                    btnState[i][0] <= !btnState[i][0];
            end else
                btnState[i][1] <= btnState[i][0];
        end
    end

//////////////////////////////////////////////////////////////////////////////////
//  # RBG LED behavior
    assign led_b = btn[0] ? 0 : 1;
    assign led_g = btn[1] ? 0 : 1;
    assign led_r = 1;
endmodule

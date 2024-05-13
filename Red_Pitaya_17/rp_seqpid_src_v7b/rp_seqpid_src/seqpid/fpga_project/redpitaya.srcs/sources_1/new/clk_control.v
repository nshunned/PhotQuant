`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2020 03:38:25 PM
// Design Name: 
// Module Name: clk_control
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


module clk_control(
    input clk,
    input clkext_locked,
    input clkext_stopped,
    output reg clkext_use_out,
    output reg clkext_rst_out
    );
    
reg     [19:0] count;
reg     [ 1:0] stateClkExt;
localparam clkExtWaitInput = 2'h0; 
localparam clkExtRelock = 2'h1; 
localparam clkExtRunning = 2'h2;
reg    clkext_locked_buf;
reg    clkext_stopped_buf;
reg    clkext_use;
reg    clkext_rst;


always @(posedge clk) begin
clkext_locked_buf <= clkext_locked;
clkext_stopped_buf <= clkext_stopped;
clkext_use_out <= clkext_use;
clkext_rst_out <= clkext_rst;
if (count == 20'h00000)
    casez (stateClkExt)
    clkExtWaitInput : begin
        clkext_use <= 1'b0;
        clkext_rst <= 1'b1;
        if (~clkext_stopped_buf) begin // wait 256*8ns (>4 cycles of external clock), then try to relock
            count <= 20'h000FF;
            stateClkExt <= clkExtRelock;
        end
    end
    clkExtRelock : begin //try to relock for 10ms
        clkext_use <= 1'b0;
        clkext_rst <= 1'b0;
        count <= 20'hFFFFF;
        stateClkExt <= clkExtRunning;
    end
    clkExtRunning :
        if (clkext_stopped_buf || ~clkext_locked_buf) begin // not locked: go back to waitinput
            clkext_rst <= 1'b1;
            stateClkExt <= clkExtWaitInput;
        end else clkext_use <= 1'b1; // locked: use external clock
    endcase
else
    count <= count - 1;
end
    
endmodule

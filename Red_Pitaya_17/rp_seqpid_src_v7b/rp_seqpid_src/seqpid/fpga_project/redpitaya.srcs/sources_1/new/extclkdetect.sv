`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2024 05:57:03 PM
// Design Name: 
// Module Name: extclkdetect
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


module extclkdetect(
    input clkint,
    input clkext,
    output reg clkext_use
    );
    
logic     [7:0] countInt;// Counter incremented by internal clock (always present)
logic     [7:0] countExt;// Counter incremented by external clock (when present)
logic           countRst;// resets countExt
logic     [1:0] countRstCDC;// Int->ext clock domain crossing for external counter reset
logic     [1:0] countExtCDC;//Ext->int clock domain crossing for most significant bit of external counter
logic           clkExtValid;//

always_ff@(posedge clkext) begin
countRstCDC <= {countRstCDC[0],countRst};
countExt <= countRstCDC[1] ? 8'h0 : countExt+1;
end


always_ff@(posedge clkint) begin
    countInt <= countInt+1;
    countRst <= !(|countInt);//reset when countInt=0
    countExtCDC <=  {countExtCDC[0],countExt[7]};
    case (countInt)
        8'h40 : clkExtValid <= !countExtCDC[1];//verify that the MSB of clkExt has been reset to 0
        8'hFF : clkext_use <= (clkExtValid && countExtCDC[1]);
    endcase
end

endmodule

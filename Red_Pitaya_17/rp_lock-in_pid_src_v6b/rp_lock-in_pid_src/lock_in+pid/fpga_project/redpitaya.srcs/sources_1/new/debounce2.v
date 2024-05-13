`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: PhotQuant
// Engineer: Alexei
// 
// Create Date: 31.07.2019 09:10:15
// Design Name: 
// Module Name: debounce2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: two-port debouncer for incremental encoders. Wait time ~500us (see http://www.farnell.com/datasheets/2360546.pdf spec sheet)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module debounce2#(parameter N=16)(
    input clk,
    input [1:0] in,
    output reg [1:0] out
    );
reg [1:0] sync0, sync1;
reg [N:0] count;

always @(posedge clk) begin
   sync0 <= in;
   sync1 <= sync0;
   if (|(sync0 ^ sync1))
      count <= 17'b0;
   else 
      count <= count + 1;
   if (count[N])
       out <= sync1;
end

endmodule

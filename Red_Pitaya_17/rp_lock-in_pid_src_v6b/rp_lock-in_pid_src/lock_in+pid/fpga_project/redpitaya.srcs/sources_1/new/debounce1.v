`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: PhotQuant
// Engineer: Alexei
// 
// Create Date: 31.07.2019 09:10:15
// Design Name: 
// Module Name: debounce1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: single-port debouncer for switches. Wait time ~500us
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module debounce1#(parameter N=16)(
    input clk,
    input in,
    output reg out
    );
reg [1:0] sync;
reg [N:0] count;


always @(posedge clk) begin
   sync[0] <= in;
   sync[1] <= sync[0];
   if (^sync)
      count <= {N{1'b0}};
   else
      count <= count + 1;
   if (count[N])
       out <= sync[1];
end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: PhotQuant
// Engineer: Alexei
// 
// Create Date: 31.07.2019 15:52:23
// Design Name: 
// Module Name: increment_lin
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: counter with adjustable increment rate, controlled by incremental counter 	Bourns PEC11R-4215F-S0024
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module increment_lin #(
   parameter     poswidth  = 13, 
   parameter     negwidth  = 13
    )
    (
    input clk,
    input rst,
    input [1:0] incr_cnt_in,
    input cnt_selmode,
    output reg [10:0] step,
    output reg signed [13:0] count
    );
reg [1:0] incr_mem;
wire [1:0] incr_in;
wire        selmode;
wire signed [14:0] sum;
wire signed [14:0] diff;

// first, sync clock domains and debounce incremental counter
debounce2 debounce_ramp_enc(
.clk  (clk),
.in  (incr_cnt_in),
.out  (incr_in)
);

debounce1 debounce_selmode(
.clk  (clk),
.in  (cnt_selmode),
.out  (selmode)
);

// then count
always @(posedge clk) begin
    incr_mem <= incr_in;
    if (rst)
    begin
        count <= 14'b0;
        step <= {5'b0,1'b1,5'b0};
    end
    else
    begin
        if (incr_mem == 2'b00) // our incremental counters make a full (not 1/4) period in one detent, and always rest at state 00
        begin
            if (incr_in == 2'b10) //increment
            begin
                if (selmode & (~step[10]))// increase increment rate
                    step <= (step << 1);
                else
                    if (sum[14] | (&(~sum[14:poswidth]))) // negative or positive-unsaturated sum: increase counter
                        count <= sum[13:0];
                    else //positive saturation
                        count <= {{14-poswidth{1'b0}}, {poswidth{1'b1}}}; //saturates at 2^(poswidth)-1
            end
            else if (incr_in == 2'b01)//decrement
            begin
                if (selmode & (~step[0]))// decrease increment rate
                    step <= (step >> 1);
                else
                    if (~diff[14] | ( & diff[14:negwidth])) // positive or negative-unsaturated difference : decrease counter
                        count <= diff[13:0];
                    else //positive saturation
//                        count <= {{14-negwidth{1'b1}}, {negwidth{1'b0}}}; //saturates at -2^(negwidth)
                        count <= {{14-negwidth{1'b1}}, {negwidth{1'b0}}}+1'b1; //saturates at -2^(negwidth)+1
            end
        end    
    end    
end

assign sum = count + $signed({3'b0,step});
assign diff = count - $signed({3'b0,step});

endmodule

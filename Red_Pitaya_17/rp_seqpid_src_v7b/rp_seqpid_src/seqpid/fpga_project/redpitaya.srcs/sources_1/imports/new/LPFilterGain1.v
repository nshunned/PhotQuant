`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: PhotQuant
// Engineer: Alexei
// 
// Create Date: 09/11/2020 09:56:45 PM
// Design Name: 
// Module Name: LPFilterGain1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Low-pass filter with low-frequency gain 1:
// out = 1/T*int_^infty(in(t-t')*exp(-t'/T)*dt'
// T=2^(tau+Sfix)
// steady state: out=in
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LPFilterGain1 
  #(parameter Rin=14,//bit width of input
    parameter Sfix=2,//exponent of fixed damping time (bit shift), MUST BE >=1
    parameter WidTau=3,//bit width of variable damping time tau
    parameter MaxTau=7)//maximum damping time tau, 0<=MaxTau<=2^WidTau-1
   (input clk, rst, run,
    input signed    [Rin-1:   0]            in,//input signal, considered as integer
    input           [WidTau-1:0]            tau,//bit width of damping time
    output signed   [Rin+MaxTau+1 -1:0]     dout,//derivative of output low-passed signal, with Rin-Sfix+1 integer and Sfix+MaxTau fractional bits
    output signed   [Rin+Sfix+MaxTau -1:0]  out//output low-passed signal, with Rin integer and Sfix+MaxTau fractional bits
    );

reg     signed [    Rin+Sfix+MaxTau+1   -1:0] mem  ; // timing buffer for gain factor kf

always @(posedge clk) begin
    if (rst)
        mem <= {Rin+Sfix+MaxTau-1{1'b0}};
    else if (run)
        mem <= out+dout;//to avoid overflow, Sfix must be >=1
end
satsigned #(.Ri(Rin+Sfix+MaxTau+1),.Ro(Rin+Sfix+MaxTau)) satsigned_mem ( .in(mem), .out(out) );
assign dout = ($signed({in,{MaxTau{1'b0}}})>>>tau) - ($signed(out[Rin+Sfix+MaxTau-1: Sfix])>>>tau);

endmodule

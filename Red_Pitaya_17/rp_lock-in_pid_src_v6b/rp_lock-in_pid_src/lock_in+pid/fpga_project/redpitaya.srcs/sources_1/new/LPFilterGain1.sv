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
    parameter Sfix=2,//exponent of fixed damping time (bit shift)
    parameter MaxTau=7)//maximum damping time tau, 0<=MaxTau<=2^WidTau-1
   (input clk, rst, run,
    input       signed  [Rin-1:   0]            in,//input signal, considered as integer
    input               [$clog2(MaxTau)-1:0]    tau,//bit width of damping time
    output logic signed  [Rin+MaxTau+1 -1:0]     dout,//derivative of output low-passed signal, with Rin-Sfix+1 integer and Sfix+MaxTau fractional bits
    output logic signed  [Rin+Sfix+MaxTau -1:0]  out//output low-passed signal, with Rin integer and Sfix+MaxTau fractional bits
    );

logic signed [Rin+Sfix+MaxTau+1 -1:0]    mem  ; // low-passed signal memory
logic signed [Rin+MaxTau -1:0]           in_div  ; // {in,fxp(Sfix+MaxTau)}/2^T,
logic signed [Rin+MaxTau -1:0]           out_div  ; // out/2^T,

always @(posedge clk) begin
    if (rst) begin
        mem <= {Rin+Sfix+MaxTau+1{1'b0}};
        dout <= {Rin+MaxTau+1{1'b0}};
    end else if (run) begin
        mem <= (out - out_div) + in_div;
        dout <= in_div - out_div;
    end
end
satsigned #(.Ri(Rin+Sfix+MaxTau+1),.Ro(Rin+Sfix+MaxTau)) satsigned_mem ( .in(mem), .out(out) );
assign in_div = $signed({in,{MaxTau{1'b0}}})>>>tau; 
assign out_div = $signed(out[Rin+Sfix+MaxTau-1: Sfix])>>>tau;
/*
This looks less elegant than mem<=out+dout,
but (out-out/2^T)+in/2^T always fits in the number of bits of mem +1, while out+(in-out)/2^T may overflow.
Plus, this has a better timing.
*/

endmodule

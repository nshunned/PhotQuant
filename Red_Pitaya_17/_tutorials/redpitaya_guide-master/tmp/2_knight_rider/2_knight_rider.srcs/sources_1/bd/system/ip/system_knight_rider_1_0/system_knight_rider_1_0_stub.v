// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Wed Mar 20 16:08:20 2024
// Host        : CDF-J5WCG42 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/photquant/VivadoProjects/Tutorials/redpitaya_guide-master/tmp/2_knight_rider/2_knight_rider.srcs/sources_1/bd/system/ip/system_knight_rider_1_0/system_knight_rider_1_0_stub.v
// Design      : system_knight_rider_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "knight_rider,Vivado 2020.1" *)
module system_knight_rider_1_0(clk, led_out)
/* synthesis syn_black_box black_box_pad_pin="clk,led_out[7:0]" */;
  input clk;
  output [7:0]led_out;
endmodule

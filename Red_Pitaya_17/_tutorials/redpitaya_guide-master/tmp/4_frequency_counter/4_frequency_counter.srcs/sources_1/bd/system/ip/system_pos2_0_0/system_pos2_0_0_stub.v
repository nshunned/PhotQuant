// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Thu Mar 21 14:35:02 2024
// Host        : CDF-J5WCG42 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/photquant/VivadoProjects/Tutorials/redpitaya_guide-master/tmp/4_frequency_counter/4_frequency_counter.srcs/sources_1/bd/system/ip/system_pos2_0_0/system_pos2_0_0_stub.v
// Design      : system_pos2_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "pow2,Vivado 2020.1" *)
module system_pos2_0_0(log2N, N)
/* synthesis syn_black_box black_box_pad_pin="log2N[4:0],N[31:0]" */;
  input [4:0]log2N;
  output [31:0]N;
endmodule

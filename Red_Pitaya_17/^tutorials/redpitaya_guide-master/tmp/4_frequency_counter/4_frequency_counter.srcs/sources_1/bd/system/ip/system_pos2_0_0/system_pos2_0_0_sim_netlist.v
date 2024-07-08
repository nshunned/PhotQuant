// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Thu Mar 21 14:35:02 2024
// Host        : CDF-J5WCG42 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/photquant/VivadoProjects/Tutorials/redpitaya_guide-master/tmp/4_frequency_counter/4_frequency_counter.srcs/sources_1/bd/system/ip/system_pos2_0_0/system_pos2_0_0_sim_netlist.v
// Design      : system_pos2_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_pos2_0_0,pow2,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "pow2,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module system_pos2_0_0
   (log2N,
    N);
  input [4:0]log2N;
  output [31:0]N;

  wire [31:0]N;
  wire [4:0]log2N;

  system_pos2_0_0_pow2 inst
       (.N(N),
        .log2N(log2N));
endmodule

(* ORIG_REF_NAME = "pow2" *) 
module system_pos2_0_0_pow2
   (N,
    log2N);
  output [31:0]N;
  input [4:0]log2N;

  wire [31:0]N;
  wire [4:0]log2N;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \N[0]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[0]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \N[10]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[10]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h00002000)) 
    \N[11]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[11]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00020000)) 
    \N[12]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[12]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00200000)) 
    \N[13]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[0]),
        .I3(log2N[1]),
        .I4(log2N[2]),
        .O(N[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h00200000)) 
    \N[14]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[14]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    \N[15]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[15]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    \N[16]_INST_0 
       (.I0(log2N[4]),
        .I1(log2N[3]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[16]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \N[17]_INST_0 
       (.I0(log2N[4]),
        .I1(log2N[3]),
        .I2(log2N[0]),
        .I3(log2N[1]),
        .I4(log2N[2]),
        .O(N[17]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \N[18]_INST_0 
       (.I0(log2N[4]),
        .I1(log2N[3]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[18]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h00002000)) 
    \N[19]_INST_0 
       (.I0(log2N[4]),
        .I1(log2N[3]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[19]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    \N[1]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[0]),
        .I3(log2N[1]),
        .I4(log2N[2]),
        .O(N[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00020000)) 
    \N[20]_INST_0 
       (.I0(log2N[4]),
        .I1(log2N[3]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[20]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00200000)) 
    \N[21]_INST_0 
       (.I0(log2N[4]),
        .I1(log2N[3]),
        .I2(log2N[0]),
        .I3(log2N[1]),
        .I4(log2N[2]),
        .O(N[21]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00200000)) 
    \N[22]_INST_0 
       (.I0(log2N[4]),
        .I1(log2N[3]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[22]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    \N[23]_INST_0 
       (.I0(log2N[4]),
        .I1(log2N[3]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[23]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000008)) 
    \N[24]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[24]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \N[25]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[0]),
        .I3(log2N[1]),
        .I4(log2N[2]),
        .O(N[25]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \N[26]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[26]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h00008000)) 
    \N[27]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[27]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00080000)) 
    \N[28]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[28]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00800000)) 
    \N[29]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[0]),
        .I3(log2N[1]),
        .I4(log2N[2]),
        .O(N[29]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    \N[2]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00800000)) 
    \N[30]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[30]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \N[31]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[31]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h00001000)) 
    \N[3]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    \N[4]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[4]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00100000)) 
    \N[5]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[0]),
        .I3(log2N[1]),
        .I4(log2N[2]),
        .O(N[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h00100000)) 
    \N[6]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[6]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h10000000)) 
    \N[7]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[7]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    \N[8]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[1]),
        .I3(log2N[0]),
        .I4(log2N[2]),
        .O(N[8]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \N[9]_INST_0 
       (.I0(log2N[3]),
        .I1(log2N[4]),
        .I2(log2N[0]),
        .I3(log2N[1]),
        .I4(log2N[2]),
        .O(N[9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

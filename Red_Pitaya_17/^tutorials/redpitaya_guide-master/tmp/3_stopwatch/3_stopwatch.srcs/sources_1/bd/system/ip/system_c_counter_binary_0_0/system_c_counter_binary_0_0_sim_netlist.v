// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Wed Mar 20 16:36:05 2024
// Host        : CDF-J5WCG42 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/photquant/VivadoProjects/Tutorials/redpitaya_guide-master/tmp/3_stopwatch/3_stopwatch.srcs/sources_1/bd/system/ip/system_c_counter_binary_0_0/system_c_counter_binary_0_0_sim_netlist.v
// Design      : system_c_counter_binary_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_c_counter_binary_0_0,c_counter_binary_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_14,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module system_c_counter_binary_0_0
   (CLK,
    CE,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} DATA_WIDTH 32}" *) output [31:0]Q;

  wire CE;
  wire CLK;
  wire [31:0]Q;
  wire SCLR;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  system_c_counter_binary_0_0_c_counter_binary_v12_0_14 U0
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "0" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "0" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "32" *) 
(* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_14" *) (* downgradeipidentifiedwarnings = "yes" *) 
module system_c_counter_binary_0_0_c_counter_binary_v12_0_14
   (CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    UP,
    LOAD,
    L,
    THRESH0,
    Q);
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  input UP;
  input LOAD;
  input [31:0]L;
  output THRESH0;
  output [31:0]Q;

  wire \<const1> ;
  wire CE;
  wire CLK;
  wire [31:0]Q;
  wire SCLR;
  wire NLW_i_synth_THRESH0_UNCONNECTED;

  assign THRESH0 = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  system_c_counter_binary_0_0_c_counter_binary_v12_0_14_viv i_synth
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_i_synth_THRESH0_UNCONNECTED),
        .UP(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
EJFZwtxl4g9/OL6+bopUV8BP4e67HNukCIy7Ih3E75y7soa6GhqEucPXMiOy+mJrcrNwD+HjZ0/I
BwEKIiA4mA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
rZCGWdmPJXoOuANoS8fyUXk7SyF+uTNJL18BfeKc+fxcyRrCB++WrM02adxoUdICz4/92yY8TQgj
xyPC0eaHZcjSLepbnHHgSReIQ1PL0hmufLbye7QTD0ygUXC4MvFVY8s3KeW9cPCqOxkyCSziJQzs
J5OT9XLQno1e9rIBr9M=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
I7Zo4frj3tO6FFzeDhpSENS0yd34dQZBtiyIrI/GMASFBUeny6muOD2l0HK69ImRJIOyobvK1+9O
DhxptAc4NzRpY4xUZvr4ix1AhM1Kars1OkrQCWz4a7ciGU/XDblidF3IL0Fa7c41gHIZR9c/Usa6
XL7UEu3aSPQYbZLSDOzeao4VtSSn+dCcjsH4X8zVjSqXg8dcN3fd5C15JaMYg00F2yOFtxwWwZWq
Yvwe1q1PG/wcA1cKAOscANbj4o3O4LjfylNIB6L+Mssxosh+e0+oobWNk/ouBa4k1c3/IzXGSCAs
hEvbI+iqkWJJKZrSb9PZk7S7XSJcScrJO/DGkQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DDRecdVJcCPEpbUqhuwKtKWXteF7XhGc5d+lQn2uiREzbHyuZvQ1wDwAGGrPwE75gjqc7CdHPMOY
8+3nqcEwR4Q5USgQcou3Cyc6C0TnzzDD/dLKPHDWA1s52x8Rx+LBH9WCvBpD5BKkE4o1s3rN1tL2
wTdCqzzKD8YlryKQ4U0lr2bX6Mlf4/nIt2K1eyPKbIrHIvKDThmaIF/qLnLnkE04pksWJ9Af1OVB
46iqBssrR5p6wZc241D4CqSRCRamfP/s1JrTi8bBNCcXhC0f0Aa35UAoG8vnFngHlFd3G2J88cas
Fo7UH4k1BTTfgbQ35ec0XfSbS/qQWS+EgAF+wA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
L11p2bsABDhO9HvT3IM+HulCClFvs/UPexuAVExicKtzrLN7tNvUjSouZSn9KwAjR2hg5ZIJ23uy
1elB+eyEl65vQnoH4+s6Q5K4EIcMo5WVKfIKwgu5Q3Sg/jYW+aWT/kGuc7CazRsTxJ7XPFndpMIM
cxYWx2DLps320t+Be0c=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Uublhc2r9VmPPq1tMATsd3XJltn9QRg1/PdCtSlxgFBDDAk13md52Fz+h+DOWptR3Q4i+Sx5IhIP
QIONVNTf1DnoK/wa1lkbd1dROJam8/cZQFiIxnsnSPGXzOGoc0c04xDSCJCCDxiDMF1YTtAqt6nw
yZh1RwOhPpgwUKjeJ4o4TY6/i0xuYAYVc83O6KwI9Ywk9UsfyIQQS8UXFo8zA9eniU2n2NcyAVNj
Y8xZ9PYJfzfDo6dHWsj4Ik588uhfO/bmsf2/ZuY5HCAMQpnda9XzPkVomNjRfsUghko7KipIl2ur
aHh+4i2kI/+cHaihhw3z14aGidBkuYKaopasbA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VYqlyQSuRywWcSrUprXX2UzoaWsJXTTbptzDY9ycgFR91H2uYfY43f80gn0E87Gvj90Qmn0Dl6ck
2VjO2Zn9yATmqtuzi/Etuf29dkl3uyKtk02OitZJEhD1CDyUJHDXKHkPMXOZCBU5CfkrIWw2SsSq
YuQKmvxp4BrhcwXypr+vRSsYd1liMxxuXOdBN5AIyzibGfcR4YUeOokIoP05xZoQOfPQkotMC1B6
SHVKEaBxe37YkyKAkQ0f9eKfnPPLG/G5qeLrFPAiIar0HHpOvdCOO69vi3RG1XqoxtTm/wGwRb5J
ZqzZyTn1Fm55PXyKhlElzXXAv1xPOTbkJXRZNQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
EktM4icAEVQRmfzXBBFeRr7d3ZTOU9f+J40sQAiff114nDU+fxlewcv+twlytUk9LMSR67RJlLt4
+ZBTwcuSPZ2Cvrommkp++7rNze0VCD8pSAdj4uo1ZnYWVWmPMQaRIqI88lnAzc5+T/LxEiXKn4ji
AYGs9fja4ME8C0CHbBsg+jfUryleVk1D8jEMCetM7qDx64s/7AGfwzDqMiW2DPCPLKNUsdlOlBYT
JAOnfy6deN7/o7BYxBsE1P4Pib1x1hvR8RwEm38pBOLKGade6KL/1SHmz5N1KGLPSXQXlK53RLTI
Exc4wN04Kg72tf503oGq6Vp90c5pksQ9cc0M+w==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qzYsaSn6YzxyfrxIwv3eyowRK7ZyzZmQHzUmV2AITf6g43c7IV/fwNBDik+XFhLScW2SxsyaGGI7
5n6kAt9uM3GerkCXA+LJQrqshcEyjuvm17vWVovBURqxhTARgZaTs5OtXdhc/wLi5e6lsdyyLtQo
bt66ubjErMgf5+tD8rpn0HkjUYmGv/MBZ0i4bGui735H12aK+wTfhGVOOiuWHCk2zCJJSx3vH4sl
dKtlpg4W0hPEM3TBPHaLnOpIDkrIUaGGN5fm6NJL6US59+Lr8/3mplbD8ld21OKzgLH+5YPRMoo4
1Pbjxkawu5Kk60AsuaR/OxngawaRMd9N4niRfQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
IXP1i+2MN3zfUH6DhHDEMqayCdekDuaiYnfZxZ8Kj9lNxzckDeIMx+0IiKXYCtarTbhIfewWdOxu
wxyFnbdLoFkWcmaO44KRreKvveyhvAepO6bh4WBWQRMIqeLiB1pr+h8+xiiVwP4aSX5lhL0oMt3E
mqjwJ98W+Kym1uXTb57K9n66kr+prMi86RSl1YA4Bz5lKiLg3PODHICvJxZ8VmXAWLBpxyEut6fM
0H73m8L8a1kPG/tWNXtPEUY0UXtEh044nNH+s6BjhE4iBmsHGC+4UHRxN9MTR4T0alpCvCD1xfvj
Xkq/pPuvdRsg3A6hYnEA0Cign4mI0qCgPPlF+A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
2gJcJsh7j9VmUVErxa9Ys+JeQzm6wer3DhqfM+C7xLWME/hzO/LZ4418tYw1DUTFM3cOac87Wh7t
PWzg69KaE1t4f4e7RYutA++opQBiQkhcxe1josoKbdIkETXwedzG5i7YFMygGfGie9tbl4MqFrBt
OcFkC3/2nlgyCacPRSUjxhVKsetaExG4VpmKg8fnpD/FwvVLCXsWV50nH1e//T0kBqiTXm9L2FEF
PSX9RMO1beYSso/R7RfzmL0ySr0uEHnH8LCDGQlNnvvAALZwEFK7O4QzA6oQd7zonwS7Z4dLTkLk
g13qUX+SU5h8f0OEwpqgVl6ljHv7IQuzGcmgRQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18096)
`pragma protect data_block
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
vTIt3lCzwjeJyTiQAGb2KSCBDVd+2PA1iKY3
`pragma protect end_protected
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

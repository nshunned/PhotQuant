// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Wed Mar 20 16:04:27 2024
// Host        : CDF-J5WCG42 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/photquant/VivadoProjects/Tutorials/redpitaya_guide-master/tmp/2_knight_rider/2_knight_rider.srcs/sources_1/bd/system/ip/system_c_counter_binary_0_0/system_c_counter_binary_0_0_sim_netlist.v
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
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} DATA_WIDTH 32}" *) output [31:0]Q;

  wire CLK;
  wire [31:0]Q;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
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
       (.CE(1'b1),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "0" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "0" *) 
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
  wire CLK;
  wire [31:0]Q;
  wire NLW_i_synth_THRESH0_UNCONNECTED;

  assign THRESH0 = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
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
       (.CE(1'b0),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
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
MJ+6DO9TFQMPuTJ/Eum5M6Th6lLtAaCY78zoamvol3Q2quRwXdEU+iQT78puzR2TIyS11CcuPlOu
5SMAa3RrGhvaqB6aAZlU0EKFYHAeXIYgayoBtfRp+mOJOURL3MEr9r1kVU5ISM+6KDqPCJZyWx/d
gSZxyl1iwETnr/nxAVfxv6p997FO4TEw/lIlsQ7rxKnUFTYf4WL2bGgnJRbCmtBUz2xkdNlOo0sD
s/X4GrfHTaS5nOeZs4OUQoyebrbE6P+TvJY4XmR1ntd80YV8tmnM11snpssqIedAZSONsb3qqwMe
WZbkpAeQr01OJctAieTI5Ah+uuJQ2q9ahJzCcw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
u9St51mezmZ0qP94YG5mn+mMwxmwQ+SHPIZLhNupOoQLlNFQULUM/ayzHXb53S156irWX78i2hj/
CiQ9Q/kBjMnh5mTbcu1G9+xHTfxcY6YhLL71dSMO5lrSKhdLTiuIisGJo/xqxDYUkbg+CN+fPODL
RCAIEaWTqsGMW3CK0KOl0JjJC4Xaj/WDQ7lplKXtNtOwbkaat6afIYsT70TBX+YK8aGHVIFBGvHM
AILNs02tOKfApIiTz72kzJfGvWAEreCP/MJgnGlCtIqZOSYx+nXakTxbpYzwMMYyuutMDbQxgUYF
VIN5TRUzCtmjzpimFc70piYwFFBtN8KIMngKmw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17616)
`pragma protect data_block
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
rpgw
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

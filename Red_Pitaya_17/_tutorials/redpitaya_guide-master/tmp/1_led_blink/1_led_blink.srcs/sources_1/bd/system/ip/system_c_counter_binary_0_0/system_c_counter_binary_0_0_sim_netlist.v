// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Wed Mar 20 15:49:06 2024
// Host        : CDF-J5WCG42 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/photquant/VivadoProjects/Tutorials/redpitaya_guide-master/tmp/1_led_blink/1_led_blink.srcs/sources_1/bd/system/ip/system_c_counter_binary_0_0/system_c_counter_binary_0_0_sim_netlist.v
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
QeAPbfRsRLGIMp7B3QRsKyrs4PsLXJOXrZDBq+6QTFhWTOcV/VWHTfJD3iX3dxYEY2bM6iBcUcHs
0E0Vp++YRrk6Jn1YmlIP9V3x/HpZCpUgKe//8F0IyVcNtk98HUYrEnDaNCYp0aUKrQahDEB8SWr5
RBgLLpMftMGL5rbwu5CqwbgzvYMTrWHhvCQEFbhEqqd4wINnLn5trrnbg+LIoy12W98JFat7XO97
EaDD+IY+e97fsL1mWaEPMQwA18tFfv+5gsO1mq/uA65UBxpHNZr1MEt33q7Vsi0okIbE4Px1V5/4
o20n9wrGQYszoBafjuknRFTz4i1XRuwVKcxdXw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
feESlqEnSzWrv+Q5jJW8mRw5b/5/7nVHo72BY+re4VYozUMW7mQtco7fxl35W/8hI6wk1tXd2arM
MRLoQl/j26Q1xoi1b1IRW84Usn+VgU7SbB21G3G6yfogrt9ZZnATtgus/ehSew1d5uDK9U73kJKD
HSWggcDCyxF67cqitPhLpTgIOrb60/s0d+XgQzfAtOnL/RPPXURUp+cSIrmbOxxhmDj0YI+yJQHz
O6oMnqdnD4xlQMsMw3kkBcDrijregiSiDKM3767FHHLcfXnBXuY6IgpwbAr8JI6jhyH5/K9JbNT1
dR/rectFj8yas0d2p9GO0t4dsQVVyNbkxuj+ng==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17616)
`pragma protect data_block
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
tmsS
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

// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Wed Mar 20 15:49:05 2024
// Host        : CDF-J5WCG42 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_c_counter_binary_0_0_sim_netlist.v
// Design      : system_c_counter_binary_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_c_counter_binary_0_0,c_counter_binary_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_14,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_14 U0
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
(* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_14
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_14_viv i_synth
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
LzQjLm4FtadRuGLNXSdEkCAgwVLV05ydzyu1UFTldrfD1OgokRgHlx50BdyqSO02tjNHxzFnGMVY
hvl7ndRXS6vVeTtCIm4AuyOuBq3fAnsk3ig3g6+YcIYLeUcqR+pnGaG1nPBaNLA6H+Goz0+qeP/0
L6x/kV1X6jLv/7jLFBgsHeg8SB5pt0vo6rLZXKypv3efCd3jC4GX+r72/dVNke9zHlxK4eemJZk1
AshqZW5A/KnFLgZWwpmxkFmDooxR+PzNUxLGhjRzIBqnAn4iCCt/Q7BaOPY39M3qRb2R6Ks8KhO+
UuHuYarkcNdwOovqEV+UpnrpIKAaaFQNON7WXQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
k5Cj/qWy9Rf/X749iTbN5UA1N0NwkavGCS5MnqUo6k2oYTELYGiMKb8NYU9jmoYW9l8sadf2of5L
BkVeAUjgz8SiTmfZCG9Ia7KwYzukWngEFwMpsjLuAwBggWPld7GG9TNoXX27qAW0O/KcAm72LxTz
0nwcMI2fM8HR7+O5cR7Hi1nas9qPSOPSPaITQERcfqZjO3VX/SYCgl2D/VBtUnKgJLWHF7BuqF9I
EpHj1PAy9SGutWW9yem5Dl+4j1jixoCO8ESVUJlVrv1DOiYhrEBCRV//2Vffk178yD3yd14Qpk7H
uBpbPF5oRTOGiJ+jS2xNYI9uFE93NRisH3KuPg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17440)
`pragma protect data_block
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
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

// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Wed Mar 20 16:36:05 2024
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_14 U0
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_14_viv i_synth
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
j9AubOCOWouGXycDMfxRK9qe8VwaamsnJJcuOiy48fDoNU0QfJDFs3hV6VfSFCvjE8cRREc48uts
F5n+FZxlDqskfIj+MX36ukWJJ8hJZoO0B3h1pTl0t3KF0xpac5XWfbH0qSN5Y4BE4KfBfEO7N/7x
VN+GvXpYIs3JHj08N3UwbTVhYA1ByWkhL+oz5rOn4hiSsKZcJOF8CE+2uzH5mO0QsMVE1EyetcAR
veKd/yGylK0/wZbMkOcdyHTW5mvsf8G9mz+0fCY5vqAD9LxpTn3idfv1jhHC5BzCFtQcV6mGv1uT
GF05aCbMRmuDUOh5qlQx2dQmiDqe0L3dtzBQ9A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bYiCaJhE/6Qo6B1dffceap/QqchfsikOmkmUe6zrxaD1oevz5UnwQRGQGeUjz/C5yKWKn1mXsUvb
ThPRPLPUwUgNrS/dh4Nlz6CrKy7FQ3lGuKb/WwNx9dazM4jeWbdZdZzUCFENBKBvZZt58Z41ofZj
QF/usLIw6wIzIGNuDRkfjM34Cm19z77wIZAvkXG4Lxzy35NOMR5Zqr8jioqp6JuQ/XBh1RMVU7x2
aijwEpGP0IK7Hr3AJzTw2Yk4tezxX20EzQPfg3AGXGFvF05ewhHfFDMzYsR6wQ06nHIZ3KE7BFGP
0Z5rKcoKgu0xndJnjQh+c9YH5WdjipsubcB1YA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17936)
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

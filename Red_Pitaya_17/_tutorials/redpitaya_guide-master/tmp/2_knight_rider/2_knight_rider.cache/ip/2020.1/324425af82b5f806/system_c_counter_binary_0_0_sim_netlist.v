// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Wed Mar 20 16:04:27 2024
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
ZKXf3bCY4jWlAMfHl+hQoQdzU9wOdk0e9WUR+2ZKYb/9Tvz+rN0FYGWHgiVw1181G+O+6PJg+ORE
kTx/1Po6gh8L2YRV2UHYlVopTdUOyF72JwAz4sqMqYnksEJUCqMlRqO4Oz5iQfFSuV+xbSqiDN+g
x3X1aP67b8InbrzBWOnmZBAZEMYKxCmOhFjj5vzGUtS7t+nmynsKwPmOBtaTTT4idn2oX9S1G6Op
xsKlK58OglJqIhJ9eKzJP7RbJAyvD77o4KFdOXOyL+93mIwmaR6QRBPUo632WxxcUu0FbVdju3IL
b/cvEx4Q3OFQ/PX3/XmA+JZ+nOyLFnEXyhobLw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RS1AhybQgIzHd2xtz4xZG6jNCACdvx/DdRr4EmBLEY2mtTg3SPs8lXa8iocvCJId4p6NK+z0KMeo
A77ah8bL6CsAUIvDTAZOgrgHAosqOwb2x0OPFvWWFeExA9g33m3O8zIcqRP3gPiHfgrB90Ajlk8Z
Wz/VJreazR8eLfODzjF5OgEwCsaY9Y70Qk1A1ix/Efo8SR0Y4rutvGHQ+rGWx4MHvhUKMNDqJzDF
/gueaJ0+VD9cr2g268l76X8jhgAiCj81WWIIkA4eeL6TQjINUCgnEghlG3K5VmRlsjZ0fxUHkeYs
gs2vX0KRHWi7NvVixqIIulC97KNgI4rVqB52SQ==

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

set_property SRC_FILE_INFO {cfile:c:/Users/photquant/VivadoProjects/Digilent_Cmod_A7_35T/clickOnOff/clickOnOff.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc rfile:../../../clickOnOff.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc id:1 order:EARLY scoped_inst:clkgen} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Users/photquant/VivadoProjects/Digilent_Cmod_A7_35T/clickOnOff/clickOnOff.srcs/constrs_1/imports/digilent-xdc-master/Cmod-A7-Master.xdc rfile:../../../clickOnOff.srcs/constrs_1/imports/digilent-xdc-master/Cmod-A7-Master.xdc id:2} [current_design]
current_instance clkgen
set_property src_info {type:SCOPED_XDC file:1 line:1 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 83.333 [get_ports -no_traverse {}]
set_property src_info {type:SCOPED_XDC file:1 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -source [get_ports clk_in1] -edges {1 2 3} -edge_shift {0.000 -36.458 -72.916} [get_ports {}]
current_instance
set_property src_info {type:XDC file:2 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN L17   IOSTANDARD LVCMOS33 } [get_ports { sysclk }]; #IO_L12P_T1_MRCC_14 Sch=gclk
set_property src_info {type:XDC file:2 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A17   IOSTANDARD LVCMOS33 } [get_ports { led[0] }]; #IO_L12N_T1_MRCC_16 Sch=led[1]
set_property src_info {type:XDC file:2 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C16   IOSTANDARD LVCMOS33 } [get_ports { led[1] }]; #IO_L13P_T2_MRCC_16 Sch=led[2]
set_property src_info {type:XDC file:2 line:15 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVCMOS33 } [get_ports { led_b }]; #IO_L14N_T2_SRCC_16 Sch=led0_b
set_property src_info {type:XDC file:2 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVCMOS33 } [get_ports { led_g }]; #IO_L13N_T2_MRCC_16 Sch=led0_g
set_property src_info {type:XDC file:2 line:17 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { led_r }]; #IO_L14P_T2_SRCC_16 Sch=led0_r
set_property src_info {type:XDC file:2 line:20 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { btn[0] }]; #IO_L19N_T3_VREF_16 Sch=btn[0]
set_property src_info {type:XDC file:2 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { btn[1] }]; #IO_L19P_T3_16 Sch=btn[1]

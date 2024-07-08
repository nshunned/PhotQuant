# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "DIR_INIT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "LEDS_INIT" -parent ${Page_0}


}

proc update_PARAM_VALUE.DIR_INIT { PARAM_VALUE.DIR_INIT } {
	# Procedure called to update DIR_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DIR_INIT { PARAM_VALUE.DIR_INIT } {
	# Procedure called to validate DIR_INIT
	return true
}

proc update_PARAM_VALUE.LEDS_INIT { PARAM_VALUE.LEDS_INIT } {
	# Procedure called to update LEDS_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LEDS_INIT { PARAM_VALUE.LEDS_INIT } {
	# Procedure called to validate LEDS_INIT
	return true
}


proc update_MODELPARAM_VALUE.LEDS_INIT { MODELPARAM_VALUE.LEDS_INIT PARAM_VALUE.LEDS_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LEDS_INIT}] ${MODELPARAM_VALUE.LEDS_INIT}
}

proc update_MODELPARAM_VALUE.DIR_INIT { MODELPARAM_VALUE.DIR_INIT PARAM_VALUE.DIR_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DIR_INIT}] ${MODELPARAM_VALUE.DIR_INIT}
}


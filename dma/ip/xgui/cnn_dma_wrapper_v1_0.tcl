# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "BITS_TRANS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FILE_INPUT_LOG" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FILE_OUTPUT_LOG" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FIXED_BURST_SIZE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "LOG_BURST_SIZE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "M_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "M_AXI_ARUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "M_AXI_AWUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "M_AXI_BUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "M_AXI_CACHE_VALUE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "M_AXI_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "M_AXI_ID_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "M_AXI_PROT_VALUE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "M_AXI_RUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "M_AXI_USER_VALUE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "M_AXI_WSTRB_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "M_AXI_WUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "M_W" -parent ${Page_0}
  ipgui::add_param $IPINST -name "OUTFILE00" -parent ${Page_0}
  ipgui::add_param $IPINST -name "OUTFILE01" -parent ${Page_0}
  ipgui::add_param $IPINST -name "OUTFILE02" -parent ${Page_0}
  ipgui::add_param $IPINST -name "OUTFILE03" -parent ${Page_0}
  ipgui::add_param $IPINST -name "S_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "S_AXI_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "S_AXI_WSTRB_WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.BITS_TRANS { PARAM_VALUE.BITS_TRANS } {
	# Procedure called to update BITS_TRANS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITS_TRANS { PARAM_VALUE.BITS_TRANS } {
	# Procedure called to validate BITS_TRANS
	return true
}

proc update_PARAM_VALUE.FILE_INPUT_LOG { PARAM_VALUE.FILE_INPUT_LOG } {
	# Procedure called to update FILE_INPUT_LOG when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FILE_INPUT_LOG { PARAM_VALUE.FILE_INPUT_LOG } {
	# Procedure called to validate FILE_INPUT_LOG
	return true
}

proc update_PARAM_VALUE.FILE_OUTPUT_LOG { PARAM_VALUE.FILE_OUTPUT_LOG } {
	# Procedure called to update FILE_OUTPUT_LOG when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FILE_OUTPUT_LOG { PARAM_VALUE.FILE_OUTPUT_LOG } {
	# Procedure called to validate FILE_OUTPUT_LOG
	return true
}

proc update_PARAM_VALUE.FIXED_BURST_SIZE { PARAM_VALUE.FIXED_BURST_SIZE } {
	# Procedure called to update FIXED_BURST_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FIXED_BURST_SIZE { PARAM_VALUE.FIXED_BURST_SIZE } {
	# Procedure called to validate FIXED_BURST_SIZE
	return true
}

proc update_PARAM_VALUE.LOG_BURST_SIZE { PARAM_VALUE.LOG_BURST_SIZE } {
	# Procedure called to update LOG_BURST_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LOG_BURST_SIZE { PARAM_VALUE.LOG_BURST_SIZE } {
	# Procedure called to validate LOG_BURST_SIZE
	return true
}

proc update_PARAM_VALUE.M_AXI_ADDR_WIDTH { PARAM_VALUE.M_AXI_ADDR_WIDTH } {
	# Procedure called to update M_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M_AXI_ADDR_WIDTH { PARAM_VALUE.M_AXI_ADDR_WIDTH } {
	# Procedure called to validate M_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.M_AXI_ARUSER_WIDTH { PARAM_VALUE.M_AXI_ARUSER_WIDTH } {
	# Procedure called to update M_AXI_ARUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M_AXI_ARUSER_WIDTH { PARAM_VALUE.M_AXI_ARUSER_WIDTH } {
	# Procedure called to validate M_AXI_ARUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.M_AXI_AWUSER_WIDTH { PARAM_VALUE.M_AXI_AWUSER_WIDTH } {
	# Procedure called to update M_AXI_AWUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M_AXI_AWUSER_WIDTH { PARAM_VALUE.M_AXI_AWUSER_WIDTH } {
	# Procedure called to validate M_AXI_AWUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.M_AXI_BUSER_WIDTH { PARAM_VALUE.M_AXI_BUSER_WIDTH } {
	# Procedure called to update M_AXI_BUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M_AXI_BUSER_WIDTH { PARAM_VALUE.M_AXI_BUSER_WIDTH } {
	# Procedure called to validate M_AXI_BUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.M_AXI_CACHE_VALUE { PARAM_VALUE.M_AXI_CACHE_VALUE } {
	# Procedure called to update M_AXI_CACHE_VALUE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M_AXI_CACHE_VALUE { PARAM_VALUE.M_AXI_CACHE_VALUE } {
	# Procedure called to validate M_AXI_CACHE_VALUE
	return true
}

proc update_PARAM_VALUE.M_AXI_DATA_WIDTH { PARAM_VALUE.M_AXI_DATA_WIDTH } {
	# Procedure called to update M_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M_AXI_DATA_WIDTH { PARAM_VALUE.M_AXI_DATA_WIDTH } {
	# Procedure called to validate M_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.M_AXI_ID_WIDTH { PARAM_VALUE.M_AXI_ID_WIDTH } {
	# Procedure called to update M_AXI_ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M_AXI_ID_WIDTH { PARAM_VALUE.M_AXI_ID_WIDTH } {
	# Procedure called to validate M_AXI_ID_WIDTH
	return true
}

proc update_PARAM_VALUE.M_AXI_PROT_VALUE { PARAM_VALUE.M_AXI_PROT_VALUE } {
	# Procedure called to update M_AXI_PROT_VALUE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M_AXI_PROT_VALUE { PARAM_VALUE.M_AXI_PROT_VALUE } {
	# Procedure called to validate M_AXI_PROT_VALUE
	return true
}

proc update_PARAM_VALUE.M_AXI_RUSER_WIDTH { PARAM_VALUE.M_AXI_RUSER_WIDTH } {
	# Procedure called to update M_AXI_RUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M_AXI_RUSER_WIDTH { PARAM_VALUE.M_AXI_RUSER_WIDTH } {
	# Procedure called to validate M_AXI_RUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.M_AXI_USER_VALUE { PARAM_VALUE.M_AXI_USER_VALUE } {
	# Procedure called to update M_AXI_USER_VALUE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M_AXI_USER_VALUE { PARAM_VALUE.M_AXI_USER_VALUE } {
	# Procedure called to validate M_AXI_USER_VALUE
	return true
}

proc update_PARAM_VALUE.M_AXI_WSTRB_WIDTH { PARAM_VALUE.M_AXI_WSTRB_WIDTH } {
	# Procedure called to update M_AXI_WSTRB_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M_AXI_WSTRB_WIDTH { PARAM_VALUE.M_AXI_WSTRB_WIDTH } {
	# Procedure called to validate M_AXI_WSTRB_WIDTH
	return true
}

proc update_PARAM_VALUE.M_AXI_WUSER_WIDTH { PARAM_VALUE.M_AXI_WUSER_WIDTH } {
	# Procedure called to update M_AXI_WUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M_AXI_WUSER_WIDTH { PARAM_VALUE.M_AXI_WUSER_WIDTH } {
	# Procedure called to validate M_AXI_WUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.M_W { PARAM_VALUE.M_W } {
	# Procedure called to update M_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M_W { PARAM_VALUE.M_W } {
	# Procedure called to validate M_W
	return true
}

proc update_PARAM_VALUE.OUTFILE00 { PARAM_VALUE.OUTFILE00 } {
	# Procedure called to update OUTFILE00 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OUTFILE00 { PARAM_VALUE.OUTFILE00 } {
	# Procedure called to validate OUTFILE00
	return true
}

proc update_PARAM_VALUE.OUTFILE01 { PARAM_VALUE.OUTFILE01 } {
	# Procedure called to update OUTFILE01 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OUTFILE01 { PARAM_VALUE.OUTFILE01 } {
	# Procedure called to validate OUTFILE01
	return true
}

proc update_PARAM_VALUE.OUTFILE02 { PARAM_VALUE.OUTFILE02 } {
	# Procedure called to update OUTFILE02 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OUTFILE02 { PARAM_VALUE.OUTFILE02 } {
	# Procedure called to validate OUTFILE02
	return true
}

proc update_PARAM_VALUE.OUTFILE03 { PARAM_VALUE.OUTFILE03 } {
	# Procedure called to update OUTFILE03 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OUTFILE03 { PARAM_VALUE.OUTFILE03 } {
	# Procedure called to validate OUTFILE03
	return true
}

proc update_PARAM_VALUE.S_AXI_ADDR_WIDTH { PARAM_VALUE.S_AXI_ADDR_WIDTH } {
	# Procedure called to update S_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.S_AXI_ADDR_WIDTH { PARAM_VALUE.S_AXI_ADDR_WIDTH } {
	# Procedure called to validate S_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.S_AXI_DATA_WIDTH { PARAM_VALUE.S_AXI_DATA_WIDTH } {
	# Procedure called to update S_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.S_AXI_DATA_WIDTH { PARAM_VALUE.S_AXI_DATA_WIDTH } {
	# Procedure called to validate S_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.S_AXI_WSTRB_WIDTH { PARAM_VALUE.S_AXI_WSTRB_WIDTH } {
	# Procedure called to update S_AXI_WSTRB_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.S_AXI_WSTRB_WIDTH { PARAM_VALUE.S_AXI_WSTRB_WIDTH } {
	# Procedure called to validate S_AXI_WSTRB_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.S_AXI_DATA_WIDTH { MODELPARAM_VALUE.S_AXI_DATA_WIDTH PARAM_VALUE.S_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.S_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.S_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.S_AXI_ADDR_WIDTH { MODELPARAM_VALUE.S_AXI_ADDR_WIDTH PARAM_VALUE.S_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.S_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.S_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.M_AXI_ID_WIDTH { MODELPARAM_VALUE.M_AXI_ID_WIDTH PARAM_VALUE.M_AXI_ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M_AXI_ID_WIDTH}] ${MODELPARAM_VALUE.M_AXI_ID_WIDTH}
}

proc update_MODELPARAM_VALUE.M_AXI_ADDR_WIDTH { MODELPARAM_VALUE.M_AXI_ADDR_WIDTH PARAM_VALUE.M_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.M_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.M_AXI_DATA_WIDTH { MODELPARAM_VALUE.M_AXI_DATA_WIDTH PARAM_VALUE.M_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.M_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.M_AXI_AWUSER_WIDTH { MODELPARAM_VALUE.M_AXI_AWUSER_WIDTH PARAM_VALUE.M_AXI_AWUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M_AXI_AWUSER_WIDTH}] ${MODELPARAM_VALUE.M_AXI_AWUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.M_AXI_ARUSER_WIDTH { MODELPARAM_VALUE.M_AXI_ARUSER_WIDTH PARAM_VALUE.M_AXI_ARUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M_AXI_ARUSER_WIDTH}] ${MODELPARAM_VALUE.M_AXI_ARUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.M_AXI_WUSER_WIDTH { MODELPARAM_VALUE.M_AXI_WUSER_WIDTH PARAM_VALUE.M_AXI_WUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M_AXI_WUSER_WIDTH}] ${MODELPARAM_VALUE.M_AXI_WUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.M_AXI_RUSER_WIDTH { MODELPARAM_VALUE.M_AXI_RUSER_WIDTH PARAM_VALUE.M_AXI_RUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M_AXI_RUSER_WIDTH}] ${MODELPARAM_VALUE.M_AXI_RUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.M_AXI_BUSER_WIDTH { MODELPARAM_VALUE.M_AXI_BUSER_WIDTH PARAM_VALUE.M_AXI_BUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M_AXI_BUSER_WIDTH}] ${MODELPARAM_VALUE.M_AXI_BUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.M_AXI_USER_VALUE { MODELPARAM_VALUE.M_AXI_USER_VALUE PARAM_VALUE.M_AXI_USER_VALUE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M_AXI_USER_VALUE}] ${MODELPARAM_VALUE.M_AXI_USER_VALUE}
}

proc update_MODELPARAM_VALUE.M_AXI_PROT_VALUE { MODELPARAM_VALUE.M_AXI_PROT_VALUE PARAM_VALUE.M_AXI_PROT_VALUE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M_AXI_PROT_VALUE}] ${MODELPARAM_VALUE.M_AXI_PROT_VALUE}
}

proc update_MODELPARAM_VALUE.M_AXI_CACHE_VALUE { MODELPARAM_VALUE.M_AXI_CACHE_VALUE PARAM_VALUE.M_AXI_CACHE_VALUE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M_AXI_CACHE_VALUE}] ${MODELPARAM_VALUE.M_AXI_CACHE_VALUE}
}

proc update_MODELPARAM_VALUE.S_AXI_WSTRB_WIDTH { MODELPARAM_VALUE.S_AXI_WSTRB_WIDTH PARAM_VALUE.S_AXI_WSTRB_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.S_AXI_WSTRB_WIDTH}] ${MODELPARAM_VALUE.S_AXI_WSTRB_WIDTH}
}

proc update_MODELPARAM_VALUE.M_AXI_WSTRB_WIDTH { MODELPARAM_VALUE.M_AXI_WSTRB_WIDTH PARAM_VALUE.M_AXI_WSTRB_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M_AXI_WSTRB_WIDTH}] ${MODELPARAM_VALUE.M_AXI_WSTRB_WIDTH}
}

proc update_MODELPARAM_VALUE.M_W { MODELPARAM_VALUE.M_W PARAM_VALUE.M_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M_W}] ${MODELPARAM_VALUE.M_W}
}

proc update_MODELPARAM_VALUE.FIXED_BURST_SIZE { MODELPARAM_VALUE.FIXED_BURST_SIZE PARAM_VALUE.FIXED_BURST_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIXED_BURST_SIZE}] ${MODELPARAM_VALUE.FIXED_BURST_SIZE}
}

proc update_MODELPARAM_VALUE.LOG_BURST_SIZE { MODELPARAM_VALUE.LOG_BURST_SIZE PARAM_VALUE.LOG_BURST_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LOG_BURST_SIZE}] ${MODELPARAM_VALUE.LOG_BURST_SIZE}
}

proc update_MODELPARAM_VALUE.BITS_TRANS { MODELPARAM_VALUE.BITS_TRANS PARAM_VALUE.BITS_TRANS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BITS_TRANS}] ${MODELPARAM_VALUE.BITS_TRANS}
}

proc update_MODELPARAM_VALUE.FILE_INPUT_LOG { MODELPARAM_VALUE.FILE_INPUT_LOG PARAM_VALUE.FILE_INPUT_LOG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILE_INPUT_LOG}] ${MODELPARAM_VALUE.FILE_INPUT_LOG}
}

proc update_MODELPARAM_VALUE.FILE_OUTPUT_LOG { MODELPARAM_VALUE.FILE_OUTPUT_LOG PARAM_VALUE.FILE_OUTPUT_LOG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILE_OUTPUT_LOG}] ${MODELPARAM_VALUE.FILE_OUTPUT_LOG}
}

proc update_MODELPARAM_VALUE.OUTFILE00 { MODELPARAM_VALUE.OUTFILE00 PARAM_VALUE.OUTFILE00 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OUTFILE00}] ${MODELPARAM_VALUE.OUTFILE00}
}

proc update_MODELPARAM_VALUE.OUTFILE01 { MODELPARAM_VALUE.OUTFILE01 PARAM_VALUE.OUTFILE01 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OUTFILE01}] ${MODELPARAM_VALUE.OUTFILE01}
}

proc update_MODELPARAM_VALUE.OUTFILE02 { MODELPARAM_VALUE.OUTFILE02 PARAM_VALUE.OUTFILE02 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OUTFILE02}] ${MODELPARAM_VALUE.OUTFILE02}
}

proc update_MODELPARAM_VALUE.OUTFILE03 { MODELPARAM_VALUE.OUTFILE03 PARAM_VALUE.OUTFILE03 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OUTFILE03}] ${MODELPARAM_VALUE.OUTFILE03}
}


set_db lib_search_path /home/pabitra/pad/counter
set_db library uk65lscllmvbbh_120c25_tc.lib
set_db hdl_search_path /


set lut(0) "SMS_5"
set lut(1) "SMS_10"
set lut(2) "SMS_17"
set lut(3) "SMS_20"
set lut(4) "SMS_34"
set lut(5) "SMS_40"

set lut(6) "SMS_13"
set lut(7) "SMS_19"
set lut(8) "SMS_26"
set lut(9) "SMS_38"
set lut(10) "SMS_41"
set lut(11) "SMS_52"

set lut(12) "SMSL_13"
set lut(13) "SMSL_19"
set lut(14) "SMSL_26"
set lut(15) "SMSL_38"
set lut(16) "SMSL_41"
set lut(17) "SMSL_52"

set lut(18) "SMS_23"
set lut(19) "SMS_62"

set lut(20) "APN"
set lut(21) "FIELD"
set lut(22) "SPEEDY"
set lut(23) "BipBip"
set lut(24) "SC2000"

for {set i 0} {$i < 25} {incr i} {
	read_hdl $lut($i)\_LUT.v
	elaborate $lut($i)\_LUT
	current_design $lut($i)
	synthesize $lut($i)\_LUT -to_mapped -effort high
	write_hdl > $lut($i)\_LUT\_netlist.v
	report area  > $lut($i)\_LUT\_area.rep
	report power > $lut($i)\_LUT\_power.rep
	report timing -unconstrained > $lut($i)\_LUT\_timing.rep
}


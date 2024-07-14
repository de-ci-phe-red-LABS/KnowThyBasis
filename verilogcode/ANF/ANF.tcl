set_db lib_search_path /home/pabitra/pad/counter
set_db library uk65lscllmvbbh_120c25_tc.lib
set_db hdl_search_path /

set anf(0) "SMS_5"
set anf(1) "SMS_10"
set anf(2) "SMS_17"
set anf(3) "SMS_20"
set anf(4) "SMS_34"
set anf(5) "SMS_40"

set anf(6) "SMS_13"
set anf(7) "SMS_19"
set anf(8) "SMS_26"
set anf(9) "SMS_38"
set anf(10) "SMS_41"
set anf(11) "SMS_52"

set anf(12) "SMSL_13"
set anf(13) "SMSL_19"
set anf(14) "SMSL_26"
set anf(15) "SMSL_38"
set anf(16) "SMSL_41"
set anf(17) "SMSL_52"


set anf(18) "SMS_23"
set anf(19) "SMS_62"


for {set i 0} {$i < 20} {incr i} {
	read_hdl $anf($i)\_ANF.v
	elaborate $anf($i)\_ANF
	current_design $anf($i)\_ANF
	synthesize $anf($i)\_ANF -to_mapped -effort high
	write_hdl > $anf($i)\_ANF\_netlist.v
	report area  > $anf($i)\_ANF\_area.rep
	report power > $anf($i)\_ANF\_power.rep
	report timing -unconstrained > $anf($i)\_ANF\_timing.rep
}


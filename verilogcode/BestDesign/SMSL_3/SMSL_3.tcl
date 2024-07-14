set_db lib_search_path /home/pabitra/pad/counter
set_db library uk65lscllmvbbh_120c25_tc.lib
set_db hdl_search_path /

set SMSL_3(1) "SMS23_2_13_nn_12_2"
set SMSL_3(2) "SMS23_2_13_np_10_6"
set SMSL_3(3) "SMS23_2_13_pn_12_5"
set SMSL_3(4) "SMS23_2_13_pp_1_6"
set SMSL_3(5) "SMS23_2_19_nn_11_2"
set SMSL_3(6) "SMS23_2_19_np_6_1"
set SMSL_3(7) "SMS23_2_19_pn_5_1"
set SMSL_3(8) "SMS23_2_19_pp_8_4"
set SMSL_3(9) "SMS23_2_26_nn_10_4"
set SMSL_3(10) "SMS23_2_26_np_10_5"
set SMSL_3(11) "SMS23_2_26_pn_12_6"
set SMSL_3(12) "SMS23_2_26_pp_12_3"
set SMSL_3(13) "SMS23_2_38_nn_1_6"
set SMSL_3(14) "SMS23_2_38_np_10_5"
set SMSL_3(15) "SMS23_2_38_pn_3_2"
set SMSL_3(16) "SMS23_2_38_pp_11_5"
set SMSL_3(17) "SMS23_2_41_nn_1_2"
set SMSL_3(18) "SMS23_2_41_np_10_1"
set SMSL_3(19) "SMS23_2_41_pn_8_2"
set SMSL_3(20) "SMS23_2_41_pp_11_1"
set SMSL_3(21) "SMS23_2_52_nn_5_1"
set SMSL_3(22) "SMS23_2_52_np_12_2"
set SMSL_3(23) "SMS23_2_52_pn_7_2"
set SMSL_3(24) "SMS23_2_52_pp_11_5"
set SMSL_3(25) "SMS32_2_13_nn_7_4"
set SMSL_3(26) "SMS32_2_13_np_11_3"
set SMSL_3(27) "SMS32_2_13_pn_11_5"
set SMSL_3(28) "SMS32_2_13_pp_1_2"
set SMSL_3(29) "SMS32_2_19_nn_7_5"
set SMSL_3(30) "SMS32_2_19_np_12_4"
set SMSL_3(31) "SMS32_2_19_pn_10_5"
set SMSL_3(32) "SMS32_2_19_pp_11_1"
set SMSL_3(33) "SMS32_2_26_nn_11_1"
set SMSL_3(34) "SMS32_2_26_np_3_6"
set SMSL_3(35) "SMS32_2_26_pn_10_3"
set SMSL_3(36) "SMS32_2_26_pp_18_3"
set SMSL_3(37) "SMS32_2_38_nn_6_3"
set SMSL_3(38) "SMS32_2_38_np_14_4"
set SMSL_3(39) "SMS32_2_38_pn_8_5"
set SMSL_3(40) "SMS32_2_38_pp_4_1"
set SMSL_3(41) "SMS32_2_41_nn_7_4"
set SMSL_3(42) "SMS32_2_41_np_14_4"
set SMSL_3(43) "SMS32_2_41_pn_10_2"
set SMSL_3(44) "SMS32_2_41_pp_13_2"
set SMSL_3(45) "SMS32_2_52_nn_7_4"
set SMSL_3(46) "SMS32_2_52_np_13_2"
set SMSL_3(47) "SMS32_2_52_pn_7_4"
set SMSL_3(48) "SMS32_2_52_pp_17_5"
set SMSL_3(49) "SMSS23_2_13_nn_10_2"
set SMSL_3(50) "SMSS23_2_13_np_10_2"
set SMSL_3(51) "SMSS23_2_19_nn_10_3"
set SMSL_3(52) "SMSS23_2_19_np_10_2"
set SMSL_3(53) "SMSS23_2_26_nn_10_5"
set SMSL_3(54) "SMSS23_2_26_np_10_2"
set SMSL_3(55) "SMSS23_2_38_nn_10_1"
set SMSL_3(56) "SMSS23_2_38_np_10_2"
set SMSL_3(57) "SMSS23_2_41_nn_10_2"
set SMSL_3(58) "SMSS23_2_41_np_10_3"
set SMSL_3(59) "SMSS23_2_52_nn_10_2"
set SMSL_3(60) "SMSS23_2_52_np_10_2"
set SMSL_3(61) "SMSS32_2_13_nn_10_4"
set SMSL_3(62) "SMSS32_2_13_np_10_5"
set SMSL_3(63) "SMSS32_2_19_nn_10_4"
set SMSL_3(64) "SMSS32_2_19_np_10_1"
set SMSL_3(65) "SMSS32_2_26_nn_10_1"
set SMSL_3(66) "SMSS32_2_26_np_10_3"
set SMSL_3(67) "SMSS32_2_38_nn_10_1"
set SMSL_3(68) "SMSS32_2_38_np_10_2"
set SMSL_3(69) "SMSS32_2_41_nn_10_2"
set SMSL_3(70) "SMSS32_2_41_np_10_5"
set SMSL_3(71) "SMSS32_2_52_nn_10_1"
set SMSL_3(72) "SMSS32_2_52_np_10_3"


for {set i 1} {$i < 73} {incr i} {
	read_hdl $SMSL_3($i).v
	elaborate $SMSL_3($i)
	current_design $SMSL_3($i)
	synthesize $SMSL_3($i) -to_mapped -effort high
	write_hdl > $SMSL_3($i)\_netlist.v
	report area  > $SMSL_3($i)\_area.rep
	report power > $SMSL_3($i)\_power.rep
	report messages > $SMSL_3($i)\_message.rep
	report timing -unconstrained > $SMSL_3($i)\_timing.rep
}


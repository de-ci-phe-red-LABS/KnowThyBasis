set_db lib_search_path /home/pabitra/pad/counter
set_db library uk65lscllmvbbh_120c25_tc.lib
set_db hdl_search_path /

set SMS_3(1) "SMS23_13_nn_6_3"
set SMS_3(2) "SMS23_13_np_3_4"
set SMS_3(3) "SMS23_13_pn_1_5"
set SMS_3(4) "SMS23_13_pp_11_6"
set SMS_3(5) "SMS23_19_nn_5_5"
set SMS_3(6) "SMS23_19_np_6_4"
set SMS_3(7) "SMS23_19_pn_2_6"
set SMS_3(8) "SMS23_19_pp_9_3"
set SMS_3(9) "SMS23_26_nn_11_6"
set SMS_3(10) "SMS23_26_np_6_3"
set SMS_3(11) "SMS23_26_pn_6_2"
set SMS_3(12) "SMS23_26_pp_2_2"
set SMS_3(13) "SMS23_38_nn_11_6"
set SMS_3(14) "SMS23_38_np_4_5"
set SMS_3(15) "SMS23_38_pn_9_2"
set SMS_3(16) "SMS23_38_pp_6_3"
set SMS_3(17) "SMS23_41_nn_11_6"
set SMS_3(18) "SMS23_41_np_6_1"
set SMS_3(19) "SMS23_41_pn_5_3"
set SMS_3(20) "SMS23_41_pp_8_5"
set SMS_3(21) "SMS23_52_nn_4_6"
set SMS_3(22) "SMS23_52_np_5_2"
set SMS_3(23) "SMS23_52_pn_2_2"
set SMS_3(24) "SMS23_52_pp_3_4"
set SMS_3(25) "SMS32_13_nn_9_3"
set SMS_3(26) "SMS32_13_np_18_5"
set SMS_3(27) "SMS32_13_pn_5_5"
set SMS_3(28) "SMS32_13_pp_14_3"
set SMS_3(29) "SMS32_19_nn_9_2"
set SMS_3(30) "SMS32_19_np_10_5"
set SMS_3(31) "SMS32_19_pn_11_1"
set SMS_3(32) "SMS32_19_pp_17_1"
set SMS_3(33) "SMS32_26_nn_9_2"
set SMS_3(34) "SMS32_26_np_10_4"
set SMS_3(35) "SMS32_26_pn_11_2"
set SMS_3(36) "SMS32_26_pp_7_6"
set SMS_3(37) "SMS32_38_nn_4_2"
set SMS_3(38) "SMS32_38_np_18_2"
set SMS_3(39) "SMS32_38_pn_2_1"
set SMS_3(40) "SMS32_38_pp_5_5"
set SMS_3(41) "SMS32_41_nn_15_3"
set SMS_3(42) "SMS32_41_np_14_6"
set SMS_3(43) "SMS32_41_pn_15_6"
set SMS_3(44) "SMS32_41_pp_13_2"
set SMS_3(45) "SMS32_52_nn_16_4"
set SMS_3(46) "SMS32_52_np_13_6"
set SMS_3(47) "SMS32_52_pn_8_4"
set SMS_3(48) "SMS32_52_pp_12_5"
set SMS_3(49) "SMSS23_13_nn_10_3"
set SMS_3(50) "SMSS23_13_np_10_1"
set SMS_3(51) "SMSS23_19_nn_10_3"
set SMS_3(52) "SMSS23_19_np_10_1"
set SMS_3(53) "SMSS23_26_nn_10_6"
set SMS_3(54) "SMSS23_26_np_10_3"
set SMS_3(55) "SMSS23_38_nn_10_6"
set SMS_3(56) "SMSS23_38_np_10_5"
set SMS_3(57) "SMSS23_41_nn_10_6"
set SMS_3(58) "SMSS23_41_np_10_6"
set SMS_3(59) "SMSS23_52_nn_10_3"
set SMS_3(60) "SMSS23_52_np_10_1"
set SMS_3(61) "SMSS32_13_nn_10_6"
set SMS_3(62) "SMSS32_13_np_10_1"
set SMS_3(63) "SMSS32_19_nn_10_2"
set SMS_3(64) "SMSS32_19_np_10_4"
set SMS_3(65) "SMSS32_26_nn_10_1"
set SMS_3(66) "SMSS32_26_np_10_5"
set SMS_3(67) "SMSS32_38_nn_10_5"
set SMS_3(68) "SMSS32_38_np_10_1"
set SMS_3(69) "SMSS32_41_nn_10_1"
set SMS_3(70) "SMSS32_41_np_10_2"
set SMS_3(71) "SMSS32_52_nn_10_4"
set SMS_3(72) "SMSS32_52_np_10_1"
set SMS_3(73) "SMSS32_23_np_10_3"
set SMS_3(74) "SMSS32_23_nn_10_1"
set SMS_3(75) "SMSS32_62_nn_10_5"
set SMS_3(76) "SMSS32_62_np_10_6"


for {set i 1} {$i < 77} {incr i} {
	read_hdl $SMS_3($i).v
	elaborate $SMS_3($i)
	current_design $SMS_3($i)
	synthesize $SMS_3($i) -to_mapped -effort high
	write_hdl > $SMS_3($i)\_netlist.v
	report area  > $SMS_3($i)\_area.rep
	report power > $SMS_3($i)\_power.rep
	report messages > $SMS_3($i)\_message.rep
	report timing -unconstrained > $SMS_3($i)\_timing.rep
}


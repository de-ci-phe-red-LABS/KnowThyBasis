set_db lib_search_path /home/pabitra/pad/counter
set_db library uk65lscllmvbbh_120c25_tc.lib
set_db hdl_search_path /

set SMS_2(1) "SMS23_10_nn_10_1"
set SMS_2(2) "SMS23_10_np_10_4"
set SMS_2(3) "SMS23_10_pn_7_2"
set SMS_2(4) "SMS23_10_pp_1_1"
set SMS_2(5) "SMS23_17_nn_10_1"
set SMS_2(6) "SMS23_17_np_1_3"
set SMS_2(7) "SMS23_17_pn_7_2"
set SMS_2(8) "SMS23_17_pp_1_6"
set SMS_2(9) "SMS23_20_nn_10_1"
set SMS_2(10) "SMS23_20_np_1_3"
set SMS_2(11) "SMS23_20_pn_8_2"
set SMS_2(12) "SMS23_20_pp_2_2"
set SMS_2(13) "SMS23_34_nn_10_5"
set SMS_2(14) "SMS23_34_np_10_4"
set SMS_2(15) "SMS23_34_pn_7_2"
set SMS_2(16) "SMS23_34_pp_10_3"
set SMS_2(17) "SMS23_40_nn_10_1"
set SMS_2(18) "SMS23_40_np_10_1"
set SMS_2(19) "SMS23_40_pn_7_2"
set SMS_2(20) "SMS23_40_pp_1_1"
set SMS_2(21) "SMS23_5_nn_10_1"
set SMS_2(22) "SMS23_5_np_1_3"
set SMS_2(23) "SMS23_5_pn_10_3"
set SMS_2(24) "SMS23_5_pp_8_2"
set SMS_2(25) "SMS32_10_nn_4_5"
set SMS_2(26) "SMS32_10_np_10_3"
set SMS_2(27) "SMS32_10_pn_12_5"
set SMS_2(28) "SMS32_10_pp_16_5"
set SMS_2(29) "SMS32_17_nn_4_5"
set SMS_2(30) "SMS32_17_np_10_2"
set SMS_2(31) "SMS32_17_pn_4_1"
set SMS_2(32) "SMS32_17_pp_16_5"
set SMS_2(33) "SMS32_20_nn_8_1"
set SMS_2(34) "SMS32_20_np_16_1"
set SMS_2(35) "SMS32_20_pn_14_6"
set SMS_2(36) "SMS32_20_pp_2_3"
set SMS_2(37) "SMS32_34_nn_13_1"
set SMS_2(38) "SMS32_34_np_8_1"
set SMS_2(39) "SMS32_34_pn_1_6"
set SMS_2(40) "SMS32_34_pp_12_5"
set SMS_2(41) "SMS32_40_nn_3_6"
set SMS_2(42) "SMS32_40_np_8_3"
set SMS_2(43) "SMS32_40_pn_14_5"
set SMS_2(44) "SMS32_40_pp_18_5"
set SMS_2(45) "SMS32_5_nn_13_3"
set SMS_2(46) "SMS32_5_np_10_6"
set SMS_2(47) "SMS32_5_pn_14_5"
set SMS_2(48) "SMS32_5_pp_11_3"
set SMS_2(49) "SMSS23_10_nn_10_2"
set SMS_2(50) "SMSS23_10_np_10_3"
set SMS_2(51) "SMSS23_17_nn_10_1"
set SMS_2(52) "SMSS23_17_np_10_5"
set SMS_2(53) "SMSS23_20_nn_10_1"
set SMS_2(54) "SMSS23_20_np_10_5"
set SMS_2(55) "SMSS23_34_nn_10_6"
set SMS_2(56) "SMSS23_34_np_10_3"
set SMS_2(57) "SMSS23_40_nn_10_1"
set SMS_2(58) "SMSS23_40_np_10_3"
set SMS_2(59) "SMSS23_5_nn_10_2"
set SMS_2(60) "SMSS23_5_np_10_2"
set SMS_2(61) "SMSS32_10_nn_10_1"
set SMS_2(62) "SMSS32_10_np_10_1"
set SMS_2(63) "SMSS32_17_nn_10_1"
set SMS_2(64) "SMSS32_17_np_10_6"
set SMS_2(65) "SMSS32_20_nn_10_1"
set SMS_2(66) "SMSS32_20_np_10_1"
set SMS_2(67) "SMSS32_34_nn_10_1"
set SMS_2(68) "SMSS32_34_np_10_1"
set SMS_2(69) "SMSS32_40_nn_10_1"
set SMS_2(70) "SMSS32_40_np_10_1"
set SMS_2(71) "SMSS32_5_nn_10_1"
set SMS_2(72) "SMSS32_5_np_10_1"


for {set i 1} {$i < 73} {incr i} {
	read_hdl $SMS_2($i).v
	elaborate $SMS_2($i)
	current_design $SMS_2($i)
	synthesize $SMS_2($i) -to_mapped -effort high
	write_hdl > $SMS_2($i)\_netlist.v
	report area  > $SMS_2($i)\_area.rep
	report power > $SMS_2($i)\_power.rep
	report messages > $SMS_2($i)\_message.rep
	report timing -unconstrained > $SMS_2($i)\_timing.rep
}


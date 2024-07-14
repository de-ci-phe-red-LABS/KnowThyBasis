set_db lib_search_path /home/pabitra/pad/counter
set_db library uk65lscllmvbbh_120c25_tc.lib
set_db hdl_search_path /

set power(0) "13"
set power(1) "19"
set power(2) "26"
set power(3) "38"
set power(4) "41"
set power(5) "52"

set basis(0) "nn"
set basis(1) "np"

for {set k 0} {$k < 6}  {incr k} {
	for {set l 0} {$l < 2}  {incr l} {
		for {set i 1} {$i < 19} {incr i} {
			for {set j 1} {$j < 7} {incr j} {
				read_hdl SMSS32_$power($k)\_$basis($l)\_$i\_$j.v
				elaborate SMSS32_$power($k)\_$basis($l)\_$i\_$j
				current_design SMSS32_$power($k)\_$basis($l)\_$i\_$j
				synthesize SMSS32_$power($k)\_$basis($l)\_$i\_$j -to_mapped -effort high
				report area  > SMSS32_$power($k)\_$basis($l)\_$i\_$j\_area.rep
				report power > SMSS32_$power($k)\_$basis($l)\_$i\_$j\_power.rep
				report timing -unconstrained > SMSS32_$power($k)\_$basis($l)\_$i\_$j\_timing.rep
			}
		}
	}
}

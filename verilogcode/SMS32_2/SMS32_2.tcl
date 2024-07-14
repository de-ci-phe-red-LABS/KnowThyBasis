set_db lib_search_path /home/pabitra/pad/counter
set_db library uk65lscllmvbbh_120c25_tc.lib
set_db hdl_search_path /

set power(0) "5"
set power(1) "10"
set power(2) "17"
set power(3) "20"
set power(4) "34"
set power(5) "40"

set basis(0) "nn"
set basis(1) "np"
set basis(2) "pp"
set basis(3) "pn"
for {set k 0} {$k < 6}  {incr k} {
	for {set l 0} {$l < 4}  {incr l} {
		for {set i 1} {$i < 19} {incr i} {
			for {set j 1} {$j < 7} {incr j} {
				read_hdl SMS32_$power($k)\_$basis($l)\_$i\_$j.v
				elaborate SMS32_$power($k)\_$basis($l)\_$i\_$j
				current_design SMS32_$power($k)\_$basis($l)\_$i\_$j
				synthesize SMS32_$power($k)\_$basis($l)\_$i\_$j -to_mapped -effort high
				report area  > SMS32_$power($k)\_$basis($l)\_$i\_$j\_area.rep
				report power > SMS32_$power($k)\_$basis($l)\_$i\_$j\_power.rep
				report timing -unconstrained > SMS32_$power($k)\_$basis($l)\_$i\_$j\_timing.rep
			}
		}
	}
}

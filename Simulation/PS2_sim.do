vsim work.PS2_Controller
add wave -binary *

force D 1 @ 1, 0 @ 2000
force reset 1 @ 0, 0 @ 1
force en 1 @ 1
force CLK 0 @ 0, 1 @ 10 -r 20 

run 4000
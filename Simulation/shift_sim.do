vsim work.shift_register
add wave -binary *

force reset 1 @ 0, 0 @ 1
force en 1 @ 0
force CLK 0 @ 0, 1 @ 5 -r 10

force D 0 @ 0, 1 @ 7, 0 @ 17, 1 @ 27, 0 @ 37, 1 @ 47, 0 @ 57, 1 @ 67

run 100
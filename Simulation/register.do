vsim work.register
add wave -binary *

force CLK 0 @ 0, 1 @ 5 -r 10
force reset 1 @ 0, 0 @ 1
force en 1 @ 0
force D 8'b0100_1110 @ 0, 8'b1010_0101 @ 17

run 30
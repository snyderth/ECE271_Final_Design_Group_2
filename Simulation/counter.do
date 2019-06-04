vsim work.Counter
add wave -unsigned *

force clk 0 @ 0, 1 @ 1 -r 2
force en 1 @ 0
force reset 1 @ 0, 0 @ 1


run 50
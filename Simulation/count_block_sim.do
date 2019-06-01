vsim work.Count_Block
add wave *

force clk 0 @ 0, 1 @ 1 -r 2
force reset 1 @ 0, 0 @ 1
force en 1 @ 0

run 50
vsim work.PS2_test
add wave *

force test_data 11'b11000111011 @ 0
force reset 1 @ 0, 0 @ 1
force en 1 @ 0
force lat 1 @ 1, 0 @ 2
force clk 0 @ 0, 1 @ 4 -r 8



run 100
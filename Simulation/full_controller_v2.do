vsim work.Final_Project
add wave in NESout sdata NES_clk srl

add wave -position insertpoint \
sim:/Final_Project/inst/count/q

force CLK_50M 0 @ 0, 1 @ 6 -r 12
force clk 0 @ 0, 1 @ 12 -r 24

force in 8'b1100_1010 @ 0, 8'b0011_0101 @ 400, \
	8'b1111_1111 @ 900
force reset 1 @ 0, 0 @ 1
force en 1 @ 0

run 5000
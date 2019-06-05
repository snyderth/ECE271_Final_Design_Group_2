vsim work.Final_Project
add wave a b strt sel up dn l r NESout sdata NES_clk
#add wave -position insertpoint sim:/Final_Project/inst/*
#add wave -position insertpoint sim:/Final_Project/inst2/*

force CLK_50M 0 @ 0, 1 @ 1 -r 2
force clk 0 @ 0, 1 @ 2 -r 4
force a 0 @ 0,1 @ 40, 0 @ 80
force b 0 @ 0,0 @ 40, 1 @ 80
force sel 0 @ 0,1 @ 40, 1 @ 80
force strt 0 @ 0,1 @ 40, 1 @ 80
force up 0 @ 0,0 @ 40, 1 @ 80
force dn 0 @ 0,0 @ 40, 1 @ 80
force l 0 @ 0,0 @ 40, 1 @ 80
force r 0 @ 0,0 @ 40, 1 @ 80
force reset 1 @ 0, 0 @ 1, 1 @ 2, 0 @ 3
force en 1 @ 0

run 200

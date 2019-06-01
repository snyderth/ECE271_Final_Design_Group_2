vsim work.Final_Project
add wave *
add wave -position insertpoint sim:/Final_Project/inst/*
add wave -position insertpoint sim:/Final_Project/inst2/*


force clk 0 @ 0, 1 @ 1 -r 2
force a 1 @ 0
force b 0 @ 0
force sel 1 @ 0
force strt 1 @ 0
force up 0 @ 0
force dn 0 @ 0
force l 0 @ 0
force r 0 @ 0
force reset 1 @ 0, 0 @ 1, 1 @ 2, 0 @ 3
force en 1 @ 0

run 70
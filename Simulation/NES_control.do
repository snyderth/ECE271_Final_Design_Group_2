vsim work.NES_Controller
add wave *

force clk 0 @ 0, 1 @ 1 -r 2
force A 1 @ 0
force B 0 @ 0
force SEL 1 @ 0
force STRT 1 @ 0
force UP 0 @ 0
force DN 0 @ 0
force L 0 @ 0
force R 0 @ 0
force srlatch 0 @ 0, 1 @ 4, 0 @ 7
force reset 1 @ 0, 0 @ 1
force en 1 @ 0

run 20
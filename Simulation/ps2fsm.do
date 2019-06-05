vsim work.PS2FSM

add wave -binary *

force clk 0 @ 0, 1 @ 1 -r 2
force reset 1 @ 0, 0 @ 10
force key_clock 1 @ 0
force key_clock 0 @ 100, 1 @ 120, 0 @ 140, 1 @ 160, 0 @ 180, 1 @ 200, 0 @ 220, 1 @ 240, 0 @ 260, 1 @ 280, 0 @ 300, 1 @ 320
force key_clock 0 @ 340, 1 @ 360, 0 @ 380, 1 @ 400, 0 @ 420, 1 @ 440, 0 @ 460, 1 @ 480, 0 @ 500, 1 @ 520
force data 0 @ 0, 1 @ 210, 0 @ 330, 1 @ 490

run 1000
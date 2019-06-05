vsim work.PS2FSM

add wave -divider "Keyboard Outputs" key_clock data
add wave -divider "Other Inputs" clk reset
add wave -divider "Error Checking" parity_error1 parity_error2
add wave -binary -divider "Raw Data" key1 key2
add wave -hexadecimal -divider "Scan Codes" code1 code2
add wave -divider "Internal" shift counter state nextstate

force clk 0 @ 0, 1 @ 1 -r 2
force reset 1 @ 0, 0 @ 10
force key_clock 1 @ 0


# The A key make code: 00011100001 (1C when reversed and start/end/parity bits omitted)
force key_clock 0 @ 100, 1 @ 120, 0 @ 140, 1 @ 160, 0 @ 180, 1 @ 200, 0 @ 220, 1 @ 240, 0 @ 260, 1 @ 280, 0 @ 300, 1 @ 320
force key_clock 0 @ 340, 1 @ 360, 0 @ 380, 1 @ 400, 0 @ 420, 1 @ 440, 0 @ 460, 1 @ 480, 0 @ 500, 1 @ 520
force data 0 @ 0, 1 @ 210, 0 @ 330, 1 @ 490, 0 @ 530


# The F key break code: 00000111111 01101010011 (F0, 2B)
force key_clock 0 @ 1000, 1 @ 1020, 0 @ 1040, 1 @ 1060, 0 @ 1080, 1 @ 1100, 0 @ 1120, 1 @ 1140, 0 @ 1160, 1 @ 1180, 0 @ 1200
force key_clock 1 @ 1220, 0 @ 1240, 1 @ 1260, 0 @ 1280, 1 @ 1300, 0 @ 1320, 1 @ 1340, 0 @ 1360, 1 @ 1380, 0 @ 1400, 1 @ 1420
force data 1 @ 1190, 0 @ 1430

force key_clock 0 @ 1600, 1 @ 1620, 0 @ 1640, 1 @ 1660, 0 @ 1680, 1 @ 1700, 0 @ 1720, 1 @ 1740, 0 @ 1760, 1 @ 1780, 0 @ 1800
force key_clock 1 @ 1820, 0 @ 1840, 1 @ 1860, 0 @ 1880, 1 @ 1900, 0 @ 1920, 1 @ 1940, 0 @ 1960, 1 @ 1980, 0 @ 2000, 1 @ 2020
force data 1 @ 1630, 0 @ 1710, 1 @ 1750, 0 @ 1790, 1 @ 1830, 0 @ 1870, 1 @ 1950, 0 @ 2030

run 3000
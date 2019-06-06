vsim work.PS2_decoder

add wave -divider "Codes from PS/2 FSM" code1 code2
add wave -divider "Parity Errors" par_err1 par_err2
add wave -divider "Decoded Signals" A_break A_make \
                                    D_break D_make \
                                    E_break E_make \
                                    F_break F_make \
                                    R_break R_make \
                                    S_break S_make \
                                    Q_break Q_make \
                                    T_break T_make \
                                    W_break W_make \
                                    G_break G_make

force par_err1 0 @ 0
force par_err2 0 @ 0

#W make code
force code1 8'h1d @ 0
force code2 0 @ 0

#W break code
force code1 8'hf0 @ 10
force code2 8'h1d @ 10

#A make code
force code1 8'h1c @ 20
force code2 0 @ 20

#A break code
force code1 8'hf0 @ 30
force code2 8'h1c @ 30

#T make code
force code1 8'h2c @ 40
force code2 0 @ 40

#T break code
force code1 8'hf0 @ 50
force code2 8'h2c @ 50

#E make code
force code1 8'h24 @ 60
force code2 0 @ 60

#E break code
force code1 8'hf0 @ 70
force code2 8'h24 @ 70

#R make code
force code1 8'h2d @ 80
force code2 0 @ 80

#R break code
force code1 8'hf0 @ 90
force code2 8'h2d @ 90

run 100

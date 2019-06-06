module PS2_decoder(input logic[7:0] code1, code2,
									 input logic	par_err1, par_err2,
									 output logic W_make, W_break,
																D_make, D_break,
																A_make, A_break,
																T_make, T_break,
																E_make, E_break,
																F_make, F_break,
																R_make, R_break,
																S_make, S_break,
																Q_make, Q_break);

				assign A_break = (code1 == 8'hf0 & code2 == 8'h1c);
				assign D_break = (code1 == 8'hf0 & code2 == 8'h23);
				assign E_break = (code1 == 8'hf0 & code2 == 8'h24);
				assign F_break = (code1 == 8'hf0 & code2 == 8'h2b);
				assign R_break = (code1 == 8'hf0 & code2 == 8'h2d);
				assign S_break = (code1 == 8'hf0 & code2 == 8'h1b);
				assign Q_break = (code1 == 8'hf0 & code2 == 8'h15);
				assign T_break = (code1 == 8'hf0 & code2 == 8'h2c);
				assign W_break = (code1 == 8'hf0 & code2 == 8'h1d);

				assign A_make = (code1 == 8'h1c);
				assign D_make = (code1 == 8'h23);
				assign E_make = (code1 == 8'h24);
				assign F_make = (code1 == 8'h2b);
				assign R_make = (code1 == 8'h2d);
				assign S_make = (code1 == 8'h1b);
				assign Q_make = (code1 == 8'h15);
				assign T_make = (code1 == 8'h2c);
				assign W_make = (code1 == 8'h1d);



endmodule

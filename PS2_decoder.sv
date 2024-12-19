/*************************************************************************
/* School:    		Oregon State University
/* Engineers: 		Kyle Noble, Alvin Deng, Rogers Dong, Thomas Snyder
/* 
/* Date:      		05/05/2019
/* File Name: 		PS2 decoder
/* Target Device:	DE-10 Lite
/* Tool Version:	Quartus Lite 18.0.0
/* Description:		A decoder to interpret the values received and
/*			and output by the PS/2 driver
/* Parameters:		
/*
/* 
/* Dependencies:
/*
/*
/**************************************************************************/


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
				Q_make, Q_break,
				G_make, G_break);

	assign A_break = (code1 == 8'hf0 & code2 == 8'h1c);
	assign D_break = (code1 == 8'hf0 & code2 == 8'h23);
	assign E_break = (code1 == 8'hf0 & code2 == 8'h24);
	assign F_break = (code1 == 8'hf0 & code2 == 8'h2b);
	assign G_break = (code1 == 8'hf0 & code2 == 8'h34);
	assign R_break = (code1 == 8'hf0 & code2 == 8'h2d);
	assign S_break = (code1 == 8'hf0 & code2 == 8'h1b);
	assign Q_break = (code1 == 8'hf0 & code2 == 8'h15);
	assign T_break = (code1 == 8'hf0 & code2 == 8'h2c);
	assign W_break = (code1 == 8'hf0 & code2 == 8'h1d);

	assign A_make = (code1 == 8'h1c);
	assign D_make = (code1 == 8'h23);
	assign E_make = (code1 == 8'h24);
	assign F_make = (code1 == 8'h2b);
	assign G_make = (code1 == 8'h34);
	assign R_make = (code1 == 8'h2d);
	assign S_make = (code1 == 8'h1b);
	assign Q_make = (code1 == 8'h15);
	assign T_make = (code1 == 8'h2c);
	assign W_make = (code1 == 8'h1d);



endmodule

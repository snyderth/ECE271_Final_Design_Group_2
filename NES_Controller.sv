/*************************************************************************
/* School:    		Oregon State University
/* Engineers: 		Kyle Noble, Alvin Deng, Rogers Dong, Thomas Snyder
/* 
/* Date:      		05/05/2019
/* File Name: 		NES Controller
/* Target Device:	DE-10 Lite
/* Tool Version:	Quartus Lite 18.0.0
/* Description:		An implementation of an NES controller to simulate
/*			functionality of the NES driver
/*
/* Parameters:		
/* 
/* Dependencies:	shift_register.sv
/*
/*
/**************************************************************************/
/*Output:
		Bit# | Button   
		--------------
		  0  |   A  
		--------------
		  1  |   B  
		--------------
		  2  | Select   
		--------------
		  3  | Start  
		--------------
		  4  |   Up  
		--------------
		  5  |  Down  
		--------------
		  6  |  Left   
		--------------
		  7  | Right   
		--------------

*/
module NES_Controller(input logic 	srlatch, clk, A, B, 
					STRT, SEL, UP,DN, L, 
					R, reset, en,
		      output logic 	q);
	
	logic [7:0] data;
	
	assign data = {R,L,DN,UP,STRT,SEL,B,A};
	
	shift_register #(8) shifter(.load(srlatch),
				.CLK(clk),
				.sout(q),
				.reset(reset),
				.par(data),
				.en(en),
				.D(1'b0));
endmodule

/*************************************************************************
/* School:    		Oregon State University
/* Engineers: 		Kyle Noble, Alvin Deng, Rogers Dong, Thomas Snyder
/* 
/* Date:      		05/05/2019
/* File Name: 		NES Driver
/* Target Device:	DE-10 Lite
/* Tool Version:	Quartus Lite 18.0.0
/* Description:		A driver to interface an FPGA with an NES controller
/*
/* Parameters:		
/* 
/* Dependencies:	shift_register.sv, Counter.sv, register.sv, 
/*			Synchronizer.sv
/*
/*
/**************************************************************************/
/*Serial Input/ Parallel Output:
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
module NES_driver(input logic D, CLK, reset, en, CLK_50M,
		  output logic SRCLK, SRL,
		  output logic A,B,SEL,STRT,UP,DN,L,R);

	logic [7:0] n1;
	logic [3:0] cc;
	logic internal_latch;
	logic [7:0] Q;
	
	//assigning outputs
	assign A = 	Q[0];
	assign B = 	Q[1];
	assign SEL = 	Q[2];
	assign STRT = 	Q[3];
	assign UP = 	Q[4];
	assign DN = 	Q[5];
	assign L = 	Q[6];
	assign R = 	Q[7];
	
	//Shifts data in
	shift_register #(8) shift(.D(D),
				.CLK(CLK),
				.reset(reset),
				.en(en),
				.Q(n1),
				.load(0),
				.par(0));
	
	//Counts on the clock
	Counter #(4) count(.clk(CLK),
			.reset(reset | SRL),
			 .en(en),
			 .d(cc),
			 .q(cc));

	//Compares for resseting, HIGH at 8							
	Comparator #(4) c(.a(cc),
			.b(4'd7),
			.gt(internal_latch));
			
	//Stores the last latched values			
	register #(8) regist(.D(n1),
			.CLK(SRL),
			.reset(reset),
			.en(en),
			.Q(Q));
	
	//Holds reset valid for one clk					
	Synchronizer sync(.D(internal_latch),
			.CLK(CLK_50M),
			.reset(reset),
			.en(en),
			.Q(SRL));
	
	assign SRCLK = CLK;
	
endmodule

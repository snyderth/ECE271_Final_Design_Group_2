/*************************************************************************
/* School:    		Oregon State University
/* Engineers: 		Kyle Noble, Alvin Deng, Rogers Dong, Thomas Snyder
/* 
/* Date:      		05/05/2019
/* File Name: 		Count Block
/* Target Device:	DE-10 Lite
/* Tool Version:	Quartus Lite 18.0.0
/* Description:		A block that keeps track of a count and resets at
/*			set number.
/* Parameters:		N: Size of the bus, must be able to hold compNum
/*			compNum: Number to reset at
/* 
/* Dependencies:	Counter.sv, Comparator.sv, Synchronizer.sv
/*
/*
/**************************************************************************/
module Count_Block #(parameter N=8, compNum=11)
		    (input logic	clk, en, reset,
		     output logic 	q);
	
	logic [N-1:0] c_num;
	logic greater;
	
	Counter	#(N) count(.clk(clk),
			  .en(en),
			  .reset(reset | q),
			  .q(c_num),
			  .d(c_num));		
	Comparator #(N) hit_compNum(.a(c_num),
			 .b(compNum-1),
			 .gte(greater));
	
	Synchronizer keep_valid(.reset(reset),
			 .en(en),
			 .D(greater),
			 .Q(q),
			 .CLK(clk));
				
endmodule

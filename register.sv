/*************************************************************************
/* School:    		Oregon State University
/* Engineers: 		Kyle Noble, Alvin Deng, Rogers Dong, Thomas Snyder
/* 
/* Date:      		05/05/2019
/* File Name: 		register
/* Target Device:	DE-10 Lite
/* Tool Version:	Quartus Lite 18.0.0
/* Description:		An N-bit register to store values
/*
/* Parameters:		N: Width of register
/* 
/* Dependencies:	
/*
/**************************************************************************/
module register #(parameter N = 8)
		(input logic [N-1:0] D,
		 input logic CLK, reset, en,
		 output logic [N-1:0] Q);

	always_ff@(posedge CLK, posedge reset) 
	begin
		if(reset) Q <= 0;
		else if(en)	Q <= D;
	end					
endmodule

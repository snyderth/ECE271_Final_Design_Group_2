/*************************************************************************
/* School:    		Oregon State University
/* Engineers: 		Kyle Noble, Alvin Deng, Rogers Dong, Thomas Snyder
/* 
/* Date:      		05/05/2019
/* File Name: 		Comparator
/* Target Device:	DE-10 Lite
/* Tool Version:	Quartus Lite 18.0.0
/* Description:		A comparator that combines multiple functions in
/*			comparing numbers
/* Parameters:		N: Size of the busses, must be able to hold a and b
/*			
/*
/* Dependencies:
/*
/*
/**************************************************************************/
module Comparator #(parameter N = 6)
		   (input logic [N-1:0] a, b,
		   output logic eq,neq,lt,lte,gt,gte);
			
			assign eq = (a == b);
			assign neq = (a != b); 
			assign lt = (a < b); 
			assign lte = (a <= b); 
			assign gt = (a > b); 
			assign gte = (a >= b); 
			
endmodule

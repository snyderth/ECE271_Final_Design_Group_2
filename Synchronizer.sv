/*************************************************************************
/* School:    		Oregon State University
/* Engineers: 		Kyle Noble, Alvin Deng, Rogers Dong, Thomas Snyder
/* 
/* Date:      		05/05/2019
/* File Name: 		Synchronizer
/* Target Device:	DE-10 Lite
/* Tool Version:	Quartus Lite 18.0.0
/* Description:		A Synchronizer that holds data valid for one clock
/*
/* Parameters:		
/* 
/* Dependencies:	
/*
/*
/**************************************************************************/
module Synchronizer(input logic D, CLK, en, reset,
		    output logic Q);
				
		logic n1;
				
		always_ff@(posedge CLK, posedge reset)
		begin
			if(reset) Q<=0;
			else if(en)
			begin
				n1 <= D;
				Q 	<= n1;
			end
		end
						  
						  
endmodule

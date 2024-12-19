/*************************************************************************
/* School:    		Oregon State University
/* Engineers: 		Kyle Noble, Alvin Deng, Rogers Dong, Thomas Snyder
/* 
/* Date:      		05/05/2019
/* File Name: 		Counter
/* Target Device:	DE-10 Lite
/* Tool Version:	Quartus Lite 18.0.0
/* Description:		A simple counter that increments on the rising edge
/*			of the clock signal
/*
/* Parameters:		N: Width of d and q. Must be wide enough to hold the
/*			value that will be counted to.
/* 
/* Dependencies:	
/*
/*
/**************************************************************************/
module Counter#(parameter width=6)
		(input 	logic	clk, reset, en,
		 input 	logic [width-1:0] d,
		 output logic [(width-1):0] q);
			
	always_ff@(posedge clk, posedge reset)
	begin
		if(reset) 	q <= 0; //asynch reset
		else if (en) 	q <= q + 1;
	end
endmodule

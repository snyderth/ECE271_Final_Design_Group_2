/*************************************************************************
/* School:    		Oregon State University
/* Engineers: 		Kyle Noble, Alvin Deng, Rogers Dong, Thomas Snyder
/* 
/* Date:      		05/05/2019
/* File Name: 		Shift Register
/* Target Device:	DE-10 Lite
/* Tool Version:	Quartus Lite 18.0.0
/* Description:		An N-bit shift register
/*
/* Parameters:		N: Width of shift register
/* 
/* Dependencies:	
/*
/*
/**************************************************************************/
module shift_register#(parameter N=8)
		(input 	logic CLK, D, en, reset, load,
		 input	logic [N-1:0] par,//for parallel load
		 output logic	sout, //for serial out
		 output logic 	[N-1:0] Q);
	
	
	
	
	always_ff@(posedge CLK, posedge reset)
	begin
		if(reset) Q <= 0;
		//parallel load, serial out
		else if(load & en) Q <= par;
		//parallel out, serial load
		else if(en) Q <= {D, Q[N-1:1]};
	end
	
	
	assign sout = Q[0];
	
endmodule

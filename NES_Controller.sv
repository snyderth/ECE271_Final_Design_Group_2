module NES_Controller(input logic	srlatch, clk, A, B, STRT, SEL, UP,DN, L, R, reset, en,
							 output logic 	q);

							 
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
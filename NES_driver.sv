module NES_driver(input logic D, CLK, reset, en, CLK_50M,
		  output logic SRCLK, SRL,
		  output logic A,B,SEL,STRT,UP,DN,L,R);
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
	logic [7:0] n1;
	logic [3:0] cc;
	logic internal_latch;
	logic [7:0] Q;
	
	//assigning outputs
	assign A = Q[0];
	assign B = Q[1];
	assign SEL = Q[2];
	assign STRT = Q[3];
	assign UP = Q[4];
	assign DN = Q[5];
	assign L = Q[6];
	assign R = Q[7];
	
	shift_register #(8) shift(.D(D),
				.CLK(CLK),
				.reset(reset),
				.en(en),
				.Q(n1),
				.load(0),
				.par(0));
	
	Counter #(4) count(.clk(CLK),
			.reset(reset | SRL),
			 .en(en),
			 .d(cc),
			 .q(cc));
								
	Comparator #(4) c(.a(cc),
			.b(4'd7),
			.gt(internal_latch));
						
	register #(8) regist(.D(n1),
			.CLK(SRL),
			.reset(reset),
			.en(en),
			.Q(Q));
								
	Synchronizer sync(.D(internal_latch),
			.CLK(CLK_50M),
			.reset(reset),
			.en(en),
			.Q(SRL));
	
	assign SRCLK = CLK;
	
	
	/*
	always_ff@(posedge SRL, posedge reset) 
	begin
		if(reset) Q <= 1;
		else if(en)	Q <= n1;
	end	
		*/
endmodule

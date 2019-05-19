module NES_driver(input logic D, CLK, reset, en,
						output logic SRCLK, SRL,
						output logic [7:0] Q);
	
	logic [7:0] n1;
	logic [3:0] cc;
	
	shift_register #(8) shift(.D(D),
								.CLK(CLK),
								.reset(reset),
								.en(en),
								.Q(n1));
	
	Counter #(4) count(.clk(CLK),
							 .reset(reset | SRL),
							 .d(cc),
							 .q(cc));
								
	Comparator #(4) c(.a(cc),
						.b(4'd7),
						.gt(SRL));
	
	assign SRCLK = CLK;
	
	always_ff@(posedge SRL, posedge reset) 
	begin
		if(reset) Q <= 1;
		else if(en)	Q <= n1;
	end					
endmodule
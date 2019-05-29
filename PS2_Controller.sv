module PS2_Controller(input logic D, CLK, reset, en,
						output logic rdy,
						output logic [8:0] Q);
	
	logic [8:0] n1;
	logic [3:0] cc;
	logic internal_latch;
	logic SRL;
	
	shift_register #(9) shift(.D(D),
								  	  .CLK(!CLK),
									  .reset(reset),
									  .en(en),
									  .Q(n1));
	
	Counter #(4) count(.clk(!CLK),
							 .reset(reset | SRL),
							 .en(en),
							 .d(cc),
							 .q(cc));
								
	Comparator #(4) c(.a(cc),
						.b(4'd9),
						.lte(internal_latch));
						
	register #(9) regist(.D(n1),
								.CLK(SRL),
								.reset(reset),
								.en(en),
								.Q(Q));
								
	Synchronizer sync(.D(internal_latch),
							.CLK(!CLK),
							.reset(reset),
							.en(en),
							.Q(SRL));
		
	assign rdy = SRL;
	
endmodule

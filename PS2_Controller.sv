module PS2_Controller(input logic D, CLK, reset, en,
						output logic rdy,
						output logic [8:0] Q);
	
	logic [8:0] n1;
	logic [3:0] count_out;
	logic nine_clks;
	logic reg_clk;
	
	shift_register #(11) shift(.D(D),
								  	  .CLK(!CLK),
									  .reset(reset),
									  .en(en),
									  .Q(n1));
	
//	Counter #(4) count(.clk(!CLK),
//							 .reset(reset | reg_clk),
//							 .en(en),
//							 .d(count_out),
//							 .q(count_out));
								
//	Comparator #(4) c(.a(count_out),
//						.b(4'd9),
//						.gte(nine_clks));
						
	register #(11) regist(.D(n1),
								.CLK(reg_clk),
								.reset(reset),
								.en(en),
								.Q(Q));
								
//	Synchronizer sync(.D(nine_clks),
//							.CLK(!CLK),
//							.reset(reset),
//							.en(en),
//							.Q(reg_clk));

	Count_Block tracker(.clk(!CLK),
								.reset(reset),
								.en(en),
								.q(reg_clk));
		
	assign rdy = reg_clk;
	
endmodule

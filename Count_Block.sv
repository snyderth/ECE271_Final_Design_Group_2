module Count_Block #(parameter N=8, compNum=11)
						  (input logic	clk, en, reset,
							output logic 	q);
	
	logic [N-1:0] c_num;
	logic greater;
	
	Counter	#(N) count(.clk(clk),
							  .en(en),
							  .reset(reset | q),
							  .q(c_num),
							  .d(c_num));		
	Comparator #(N) hit_compNum(.a(c_num),
										 .b(compNum-1),
										 .gte(greater));
	
	Synchronizer keep_valid(.reset(reset),
									.en(en),
									.D(greater),
									.Q(q),
									.CLK(clk));
				
endmodule
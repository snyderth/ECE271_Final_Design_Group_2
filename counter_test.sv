module counter_test(input logic clk, reset, en,
						  output logic q);
						  
						  logic n1;
			
				Counter count(.clk(clk), .reset(reset), .en(en), .q(n1), .d(n1));
				assign q = n1;
endmodule
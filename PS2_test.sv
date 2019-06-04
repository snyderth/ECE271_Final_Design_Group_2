module PS2_test(input 	logic [8:0] test_data,
					 input	logic clk, reset, en, lat,
					 output	logic [8:0] letter, 
					 output	logic rdy);
					 
				logic ps2_data;
					 
				shift_register #(9) data_sender(.par(test_data),
														  .CLK(clk),
														  .sout(ps2_data),
														  .en(en),
														  .reset(reset),
														  .load(lat),
														  .D(0));
				
				PS2_Controller ps2(.D(ps2_data),
										 .Q(letter),
										 .rdy(rdy),
										 .CLK(clk),
										 .en(en),
										 .reset(reset));
					 
					 
endmodule
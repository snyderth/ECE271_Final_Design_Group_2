module Counter#(parameter width=6)
					(input 	logic	clk, reset, en,
					 input 	logic [width-1:0] d,
					 output 	logic [(width-1):0] q);
			
	always_ff@(posedge clk, posedge reset)
		begin
			if(reset) 		q <= 0;
			else if (en) 	q <= q + 1;
		end
endmodule
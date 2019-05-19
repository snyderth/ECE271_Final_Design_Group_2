module shift_register#(parameter N=8)
							(input 	logic CLK, D, en, reset,
							 output logic 	[N-1:0] Q);
	
	
	always_ff@(posedge CLK, posedge reset)
	begin
		if(reset) Q <= 0;
		else if(en)
		begin
			Q <= {D, Q[N-1:1]};
		end
	end
endmodule
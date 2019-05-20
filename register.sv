module register #(parameter N = 8)
			(input logic [N-1:0] D,
			 input logic CLK, reset, en,
			 output logic [N-1:0] Q);

	always_ff@(posedge CLK, posedge reset) 
	begin
		if(reset) Q <= 0;
		else if(en)	Q <= D;
	end					
endmodule
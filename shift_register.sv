module shift_register#(parameter N=8)
							(input 	logic CLK, D, en, reset, load,
							 input	logic [N-1:0] par,//for parallel load
							 output logic	sout, //for serial out
							 output logic 	[N-1:0] Q);
	
	
	
	
	always_ff@(posedge CLK, posedge reset)
	begin
		if(reset) Q <= 0;
		//else if(en & load)//parallel load, serial out
		else if(load & en) Q <= par;
		//parallel out, serial load
		else if(en) Q <= {D, Q[N-1:1]};
		//else Q <= {D, Q[N-1:1]};
	end
	
	
	assign sout = Q[0];
	
endmodule
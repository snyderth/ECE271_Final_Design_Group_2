module Synchronizer(input 	logic D, CLK, en, reset,
						  output logic Q);
				
				logic n1;
				
				always_ff@(posedge CLK, posedge reset)
				begin
					if(reset) Q<=0;
					else if(en)
					begin
						n1 <= D;
						Q 	<= n1;
					end
				end
						  
						  
endmodule
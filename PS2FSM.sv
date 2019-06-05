module PS2FSM (input logic clk, key_clock, reset, data,
					output logic [10:0] key1, key2);
		
		logic [10:0] shift;
		logic [3:0] counter;
		
		typedef enum logic[2:0] {start, read1, waitread1, getkey1, read2, waitread2, getkey2, waitstart} statetype;
		statetype state, nextstate;
		
		//state reg
		always_ff @(posedge clk, posedge reset)
			if (reset)	state = start;			// Note: these need to be blocking otherwise
			else			state = nextstate;	//			the counter can activate twice before
														//			the state updates
		
		//next state logic
		always_ff @(posedge clk)
			case(state)
			
				// Initial state: waiting for low key_clock signal to begin reading data
				start:		if (key_clock) begin
									nextstate <= start;
									counter <= 0;
								end
								else begin
									nextstate <= read1;
									shift <= {data, shift[10:1]};
									counter <= counter + 1;
								end
								
				// The state when key_clock is low. After 11 bits, moves to getkey state.				
				read1:		if (!key_clock & counter > 10) begin
									nextstate <= getkey1;
									counter <= 0;
								end
								else if (key_clock)
									nextstate <= waitread1;
								else
									nextstate <= read1;
									
				// The state when key_clock is high. Data is taken into the shift reg on
				// 	the falling edge of the key_clock (ie when this state is exited).
				waitread1:	if (key_clock)
									nextstate <= waitread1;
								else begin
									shift <= {data, shift[10:1]};
									counter <= counter + 1;
									nextstate <= read1;
								end
								
				// Records key code from shift register as parallel output.
				getkey1:		begin
									key1 = shift;
									if (key1 == 11'b00000111111)
										nextstate <= read2;
									else
										nextstate <= waitstart;
								end
								
				// Similar to read1 but for case when key1 is a '0F' indicating that the code
				//		is a break code, not a make code.
				read2:		if (!key_clock & counter > 10)
									nextstate <= getkey2;
								else if (key_clock)
									nextstate <= waitread2;
								else
									nextstate <= read2;
									
				waitread2:	if (key_clock)
									nextstate <= waitread2;
								else begin
									nextstate <= read2;
									shift <= {data, shift[10:1]};
									counter <= counter + 1;
								end
								
				getkey2:		begin
									key2 <= shift;
									nextstate <= waitstart;
									counter <= 0;
								end
								
				waitstart:	if (key_clock)	nextstate <= start;
								else				nextstate <= waitstart;
			endcase
		
		
endmodule

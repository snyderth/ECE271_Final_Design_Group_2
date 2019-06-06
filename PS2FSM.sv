/*************************************************************************
/* School:    		Oregon State University
/* Engineers: 		Kyle Noble, Alvin Deng, Rogers Dong, Thomas Snyder
/* 
/* Date:      		05/05/2019
/* File Name: 		PS/2 FSM
/* Target Device:	DE-10 Lite
/* Tool Version:	Quartus Lite 18.0.0
/* Description:		A driver to interface an FPGA with a PS/2 Keyboard
/*
/* Parameters:		
/* 
/* Dependencies:	
/*
/*
/**************************************************************************/
module PS2FSM (input logic clk, key_clock, reset, data,
	       output logic parity_error1, parity_error2,
	       output logic [7:0] code1, code2);

	logic [10:0] key1, key2;
	logic [10:0] shift;
	logic [3:0] counter;
	
	typedef enum logic[2:0] {start, read1, waitread1, getkey1, read2, 
				waitread2, getkey2, waitstart} statetype;
	
	statetype state, nextstate;
	
	//state reg
	always_ff @(posedge clk, posedge reset)
		if (reset)	state = start;	  // Note: these need to be blocking otherwise
		else		state = nextstate;//       the counter can activate twice before	
						  //       the state updates
	
	//next state logic
	always_ff @(posedge clk)
	case(state)
	
	// Initial state: waiting for low key_clock signal to begin reading data
	start:	if (key_clock) begin
			nextstate <= start;
			counter <= 0;
		end
		else begin
			nextstate <= read1;
			shift <= {shift[9:0], data};
			counter <= counter + 1;
		end
					
	// The state when key_clock is low. After 11 bits, moves to getkey state.				
	read1:	if (!key_clock & counter > 10) begin
			nextstate <= getkey1;
			counter <= 0;
		end
			else if (key_clock)
						nextstate <= waitread1;
					else
						nextstate <= read1;
						
	// The state when key_clock is high. Data is taken into the shift reg on
	// 	the falling edge of the key_clock (ie when this state is exited).
	waitread1: if (key_clock)
			nextstate <= waitread1;
		else begin
			shift <= {shift[9:0], data};
			counter <= counter + 1;
			nextstate <= read1;
		end
					
	// Records key code from shift register as parallel output.
	getkey1: begin
		key1 = shift;
		if (key1 == 11'b00000111111)
			nextstate <= read2;
		else
			nextstate <= waitstart;
			key2 <= 0;
		end
					
	// Similar to read1 but for case when key1 is a '0F' indicating that the code
	//		is a break code, not a make code.
	read2:	if (!key_clock & counter > 10)
			nextstate <= getkey2;
		else if (key_clock)
			nextstate <= waitread2;
		else
			nextstate <= read2;
		
	waitread2: if (key_clock)
			nextstate <= waitread2;
		else begin
			nextstate <= read2;
			shift <= {shift[9:0], data};
			counter <= counter + 1;
		end
					
	getkey2: begin
			key2 <= shift;
			nextstate <= waitstart;
			counter <= 0;
		end
					
	waitstart: if (key_clock)	nextstate <= start;
		else			nextstate <= waitstart;
	endcase
	//output logic

	
	assign parity_error1 = ^key1; //xor all together, if parity error = 1, there is an issue
	assign parity_error2 = ^key2;
	assign code1 = {key1[2],key1[3],key1[4],key1[5],key1[6],key1[7],key1[8],key1[9]};
	assign code2 = {key2[2],key2[3],key2[4],key2[5],key2[6],key2[7],key2[8],key2[9]};
	
endmodule

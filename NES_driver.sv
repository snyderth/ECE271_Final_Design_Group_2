module NES_driver(input logic DATA,
						output logic SRCLK, SRL);
			// clock pulsewidth no smaller than 180 ns
			
			//	Pulse latch (should be HIGH): LOW HIGH LOW HIGH	
			// Read bit 0 (a)
			// Pulse clock
			// Read bit 1 (b)
			// repreat 6 more times to get the next bits 
			// a b sel strt u d l r
			// 0 1  2    3  4 5 6 7
			// BUTTONS ARE ACTIVE LOW
						
endmodule
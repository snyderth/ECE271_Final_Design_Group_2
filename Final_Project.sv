/*************************************************************************
/* School:    		Oregon State University
/* Engineers: 		Kyle Noble, Alvin Deng, Rogers Dong, Thomas Snyder
/* 
/* Date:      		05/05/2019
/* File Name: 		Final Project
/* Target Device:	DE-10 Lite
/* Tool Version:	Quartus Lite 18.0.0
/* Description:		An implementation of a combined NES controller/PS/2
/*			keyboard driver on an FPGA
/* Parameters:		
/* 
/* Dependencies:	NES_driver.sv, NES_controller.sv, PS2FSM.sv, 
/*			PS2_decoder.sv, shift_register.sv, Counter.sv,  
/*			register.sv, Synchronizer.sv
/*
/*
/**************************************************************************/
module Final_Project(input  logic clk, 
		     reset, en, CLK_50M,
		     key_clock, data,
		     input  logic [7:0] NESin,
		     output logic [7:0] NESout,
		     output logic A_break, A_make,
			  	  D_break, D_make,
				  E_break, E_make,
				  F_break, F_make,
				  R_break, R_make,
				  S_break, S_make,
				  Q_break, Q_make,
				  T_break, T_make,
				  W_break, W_make);
		
		
		
		
		//intermediate nodes for NES driver and controller
		logic srl, sdata, NES_clk,
		a,b,strt,sel,up,dn,l,r;

		//Assigning nes driver inputs
		assign a    =	NESin[0];
		assign b    =	NESin[1];
		assign sel  =	NESin[2];
		assign strt =	NESin[3];
		assign up   =	NESin[4];
		assign dn   =	NESin[5];
		assign l    =	NESin[6];
		assign r    =	NESin[7];
		
		/*

		This module is instantiated from another file, NES_driver.sv
		It is the NES driver instantiation.
		Inputs:
			CLK_50M: fast clock for synchronizers
			CLK:	 normal clock for counter, should be relatively slow
			en:	 enable pin
			SRL:	 latch pin to NES controller
			D:	 Serial data from NES controller
			A:	 A output, active LOW
			B:	 B output, active LOW
			SEL:	 SEL output, active LOW
			STRT:	 STRT output, active LOW
			UP:	 UP output, active LOW
			DN:	 DN output, active LOW
			L:	 L output, active LOW
			R:	 R output, active LOW
			SRCLK:	 Clock output to NES Controller
		*/
		NES_driver inst(.CLK(clk),
				 .CLK_50M(CLK_50M),
				 .reset(reset),
				 .en(en),
				 .SRL(srl),
				 .D(sdata),
				 .A(NESout[0]),
				 .B(NESout[1]),
				 .SEL(NESout[2]),
				 .STRT(NESout[3]),
				 .UP(NESout[4]),
				 .DN(NESout[5]),
				 .L(NESout[6]),
				 .R(NESout[7]),
				 .SRCLK(NES_clk));

		/*

		Instantiated from NES_Controller.sv file
		This block is soley for simulation of inputs.
		Allows parallel data to be written in ModelSim
		and outputs a serial data stream to the NES
		driver.

		*/
		NES_Controller inst2(.A(a),
				.B(b),
				.STRT(strt),
				.SEL(sel),
				.UP(up),
				.DN(dn),
				.L(l),
				.R(r),
				.reset(reset),
				.en(en),
				.q(sdata),
				.srlatch(srl),
				.clk(NES_clk));


		//Intermediate nodes for PS/2 driver and decoder
		logic [7:0] code1, code2;
		logic par_err1, par_err2;
		
		/*

		Instantiated from PS2FSM.sv. This is the keyboard driver
		that will take the data frames and clock fromt the keyboard
		inputs.
		Inputs:
			key_clock:	clock line from the keyboard
			clk:		clock to drive all flops, relatively fast
			data:		data line from the keyboard
		Outputs:
			code1:		First scan code read in
			code2:		Second scan code read in, only used if code1
					is equal to 8'hf0

		*/
		PS2FSM ps2keyboard(.clk(clk),
				 .key_clock(key_clock),
				 .reset(reset),
				 .data(data),
				 .code1(code1),
				 .code2(code2));
					
		/*
		
		Instantiated from PS2_decoder.sv. This is module
		decodes the scan codes sent from the PS/2 driver
		and outputs a logic HIGH for the scancode that is
		received.
		Inputs:
			code1:	Input for the first code in the data
			code2:	Input for the second code in the data.
				Only used when code1 equals 8'h0f
		
		Outputs:
			Respective make and break codes, active HIGH

		*/			 
		PS2_decoder decode(.code1(code1),
				 .code2(code2),
				 .A_break(A_break),
				 .D_break(D_break),
				 .E_break(E_break),
				 .F_break(F_break),
				 .R_break(R_break),
				 .S_break(S_break),
				 .Q_break(Q_break),
				 .T_break(T_break),
				 .W_break(W_break),
				 .A_make(A_make),
				 .D_make(D_make),
				 .E_make(E_make),
				 .F_make(F_make),
				 .R_make(R_make),
				 .S_make(S_make),
				 .Q_make(Q_make),
				 .T_make(T_make),
				 .W_make(W_make));
endmodule

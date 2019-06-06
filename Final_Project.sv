module Final_Project(input logic	clk, //a, b, strt, sel, up,dn, l, r, 
							reset, en, CLK_50M,
							key_clock, data,
							input logic [7:0] in,
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
		
		
		
		

		logic srl, sdata, NES_clk,
		a,b,strt,sel,up,dn,l,r;
		assign a=in[0];
		assign b=in[1];
		assign sel=in[2];
		assign strt=in[3];
		assign up=in[4];
		assign dn=in[5];
		assign l=in[6];
		assign r=in[7];
		

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
//
//
//		NES_Controller inst2(.A(a),
//									.B(b),
//									.STRT(strt),
//									.SEL(sel),
//									.UP(up),
//									.DN(dn),
//									.L(l),
//									.R(r),
//									.reset(reset),
//									.en(en),
//									.q(sdata),
//									.srlatch(srl),
//									.clk(NES_clk));

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

//PS2_Controller ps2();
//counter_test ct();
		
		logic [7:0] code1, code2;
		logic par_err1, par_err2;

		PS2FSM ps2keyboard(.clk(clk),
								 .key_clock(key_clock),
								 .reset(reset),
								 .data(data),
								 .code1(code1),
								 .code2(code2));
								 
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
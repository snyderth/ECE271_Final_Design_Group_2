module Final_Project(input logic	clk, //a, b, strt, sel, up,dn, l, r, 
							reset, en, CLK_50M,
							input logic [7:0] in,
							output logic [7:0] NESout);

							
		

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
endmodule

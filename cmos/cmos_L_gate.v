`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:07:03 12/02/2015 
// Design Name: 
// Module Name:    cmos_L_gate 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module cmos_L_gate(
	input [2:0] x,
	output a
    );

	wire c0, c1, d0, d1;
	wire x2p, x1p;
	supply1 pwr;
	supply0 gnd;
	not(x2p, x[2]);
	not(x1p, x[1]);

	// pull up network
	// term 0
	pmos(c0, pwr, x[2]);
	pmos(a, c0, x1p);

	// term 1
	pmos(c1, pwr, x2p);
	pmos(a, c1, x[0]);

	// pull down network
	// term 0
	nmos(d0, gnd, x2p);
	nmos(a, d0, x1p);

	// term 1
	nmos(d1, gnd, x[2]);
	nmos(a, d1, x[0]);

endmodule

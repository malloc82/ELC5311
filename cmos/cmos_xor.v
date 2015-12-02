`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:42:00 12/02/2015 
// Design Name: 
// Module Name:    cmos_xor 
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
module cmos_xor(
	input x, y,
	output a
    );
	wire c0, c1, d0, d1;
	wire xp, yp;
	supply1 pwr;
	supply0 gnd;
	not(xp, x);
	not(yp, y);
	
	// pull up network
	// term 0
	pmos(c0, pwr, x);
	pmos(a, c0, yp);

	// term 1
	pmos(c1, pwr, xp);
	pmos(a, c1, y);

	// pull down network
	// term 0
	nmos(d0, gnd, xp);
	nmos(a, d0, yp);

	// term 1
	nmos(d1, gnd, x);
	nmos(a, d1, y);

endmodule

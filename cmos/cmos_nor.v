`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:24:55 12/02/2015 
// Design Name: 
// Module Name:    cmos_nor 
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
module cmos_nor(
	input x, y,
	output a
    );
	wire c;
	supply1 pwr;
	supply0 gnd;
	
	// pull up network
	pmos(c, pwr, x);
	pmos(a, c, y);

	// pull down network
	
	// term 1
	nmos(a, gnd, x);
	
	// term 2
	nmos(a, gnd, y);
endmodule

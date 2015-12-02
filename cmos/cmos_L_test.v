`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:12:32 12/02/2015
// Design Name:   cmos_L_gate
// Module Name:   H:/ELC5311/cmos_nor/cmos_L_test.v
// Project Name:  cmos_nor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cmos_L_gate
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cmos_L_test;

	// Inputs
	reg [2:0] x;

	// Outputs
	wire a;

	// Instantiate the Unit Under Test (UUT)
	cmos_L_gate uut (
		.x(x), 
		.a(a)
	);

	initial begin
		// Initialize Inputs
		x = 0;
		repeat (7)
			#10 x<=x+1;
		#10 $finish;
	end
	
	initial begin
	$display("x0 x1 x2| a");
	$display("------------");
	$monitor("%b  %b  %b| %b", x[0], x[1], x[2], a);
	end
	    
endmodule


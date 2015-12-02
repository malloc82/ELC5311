`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:32:38 12/02/2015
// Design Name:   cmos_nor
// Module Name:   H:/ELC5311/cmos_nor/cmos_nor_test.v
// Project Name:  cmos_nor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cmos_nor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cmos_xor_test;

	// Outputs
	reg x, y;
	wire a;

	// Instantiate the Unit Under Test (UUT)
	cmos_xor uut (
		.x(x),
		.y(y),
		.a(a)
	);

	initial begin
		// Initialize Inputs

		// Wait 100 ns for global reset to finish
		x = 0;
		y = 0;
		#10;
		
		x = 0;
		y = 1;
		#10;
		
		x = 1;
		y = 0;
		#10;
		
		x = 1;
		y = 1;
		#10;
		#10 $finish;
		// Add stimulus here
	end
      
	initial begin
	$display("x y | z");
	$display("--------");
	$monitor("%b %b | %b", x, y, a);
	end
	
endmodule


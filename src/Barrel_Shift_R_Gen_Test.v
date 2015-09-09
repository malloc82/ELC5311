`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   14:07:00 09/02/2015
// Design Name:   Barrel_Shift_R_Gen
// Module Name:   C:/Users/schubertk/Documents/Baylor/classes/4396 adv digital logic/labs/advDigDesign/Barrel_Shift_R_Gen_test.v
// Project Name:  advDigDesign
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: Barrel_Shift_R_Gen
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module Barrel_Shift_R_Gen_Test;

	// Inputs
	reg [7:0] num;
	reg [2:0] amt;

	// Outputs
	wire [7:0] shifted;

	// Instantiate the Unit Under Test (UUT)
	Barrel_Shift_R_Gen uut (
		.num(num),
		.amt(amt),
		.shifted(shifted)
	);

	initial begin
		// Initialize Inputs
		num = 8'b11010111;
		amt = 0;

		#10;

	end
	
	always
		#10 amt = amt+1;

endmodule

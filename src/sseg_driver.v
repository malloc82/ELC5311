`timescale 1ns / 1ps
module sseg_driver(
    input [3:0] num,
    output reg [0:6] sseg,
    output dp
    );
	assign dp = 1;
	
	always@* begin
		case(num)
		0:       sseg <= 7'b0000001;
		1:       sseg <= 7'b1001111;
		2:       sseg <= 7'b0010010;
		3:       sseg <= 7'b0000110;
		4:       sseg <= 7'b1001100;
		5:       sseg <= 7'b0100100;
		6:       sseg <= 7'b0000010;
		7:       sseg <= 7'b0001111;
		8:       sseg <= 7'b0000000;
		9:       sseg <= 7'b0001100;
		10:      sseg <= 7'b0001000;
		11:      sseg <= 7'b1100000;
		12:      sseg <= 7'b0110001;
		13:      sseg <= 7'b1000010;
		14:      sseg <= 7'b0110000;
		default: sseg <= 7'b0111000;
		endcase
		
	end
endmodule

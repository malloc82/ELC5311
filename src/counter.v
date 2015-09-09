`timescale 1ns / 1ps
module counter#(
	 parameter BITS=20
	 )(
    input clk,
	 input reset,
    output reg [BITS-1:0] count
    );
		initial
			count <=0;
			
		always @(posedge(clk), posedge(reset))
			if(reset)
				count <= 0;
			else
				count <= count+1;

endmodule

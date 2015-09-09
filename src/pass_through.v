`timescale 1ns / 1ps
module pass_through(
    input [7:0] sw,
	input mclk,
    // input btn,
    // output [7:0] Led,
    output [0:6] seg,
    output dp,
    output reg [3:0] an
    );
    reg [3:0]  value;
	 // wire [15:0] sseg_values;
	wire [25:0] count;

// assign Led=sw;

sseg_driver my_sseg_conv(
    .num(value),
    .sseg(seg),
    .dp(dp)
    );

counter #(26) my_timer(
	.clk(mclk),
	.reset(0),
	.count(count)
	);

// counter #(16) my_count(
// 	.clk(count0[25]),
// 	.reset(btn),
// 	.count(count1)
// 	);

always @*
  begin
     case(count[19:18])
       2'b00: begin
          value <= sw[3:0];
          an    <= 4'b1110;
       end
       2'b01: begin
          value <= sw[7:4];
          an    <= 4'b1101;
       end
       2'b10: begin
          value <= 4'h0;
          an    <= 4'b1011;
       end
       2'b11: begin
          value <= 4'h0;
          an    <= 4'b0111;
       end
       default: begin
          value <= 4'h0;
          an    <= 4'b1111;
       end
     endcase
  end

endmodule

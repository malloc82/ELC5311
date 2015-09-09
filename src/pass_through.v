`timescale 1ns / 1ps
module pass_through
  (input [7:0]  sw,
   input        mclk,
   input [2:0]  btn,
   // output [7:0] Led,
   output [0:6] seg,
   output       dp,
   out put reg [3:0] an
   );
   reg [3:0]    value;
   reg [7:0]    shift_reg, shift_result_next;
   wire [7:0]   right_shifted, left_shifted;
   // wire [15:0] sseg_values;
   wire [25:0]                   count;


   sseg_driver my_sseg_conv(.num(value),
                            .sseg(seg),
                            .dp(dp)
                            );

   counter #(26) my_timer(.clk(mclk),
	                      .reset(0),
	                      .count(count)
	                      );

   Barrel_Shift_R_Gen #(ADDRESS_BITS = 3)
   right_shifter (.num(shift_reg),
		          .amt(3'b001),
		          .shifted(right_shifted)
	              );
   Barrel_Shift_R_Gen #(ADDRESS_BITS = 3)
   left_shifter (.num(shift_reg),
		         .amt(3'b010),
		         .shifted(left_shifted)
	             );

   always @(posedge btn[0], posedge btn[1], posedge btn[2])
     begin
        if (btn[2])
          shift_reg <= sw;
        else if (btn[1])
          shift_reg <= left_shifted;
        else if (btn[0])
          shift_reg <= right_shifted;
     end

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
             value <= shift_reg[3:0];
             an    <= 4'b1011;
          end
          2'b11: begin
             value <= shift_reg[7:4];
             an    <= 4'b0111;
          end
          default: begin
             value <= 4'h0;
             an    <= 4'b1111;
          end
        endcase
     end

endmodule

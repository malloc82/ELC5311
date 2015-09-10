`timescale 1ns / 1ps
module pass_through
  (input [7:0]      sw,
   input            mclk,
   input            reset,
   input [2:0]      btn,
   output [7:0]     led,
   output [0:6]     seg,
   output           dp,
   output reg [3:0] an
   );
   reg [3:0]    value;
   reg [7:0]    shift_reg, shift_next,
	            result_reg, result_next;

   reg          start, start_next;

   wire [7:0]   right_shifted, left_shifted;
   // wire [15:0] sseg_values;
   wire [25:0]  count;
   wire         btn_0,
                btn_1,
                btn_2;

   assign led = shift_reg;

   debounce btn_0_db (.clk(mclk), .reset(reset), .sw(btn[0]), .db_level(), .db_tick(btn_0));
   debounce btn_1_db (.clk(mclk), .reset(reset), .sw(btn[1]), .db_level(), .db_tick(btn_1));
   debounce btn_2_db (.clk(mclk), .reset(reset), .sw(btn[2]), .db_level(), .db_tick(btn_2));

   sseg_driver my_sseg_conv(.num(value),
                            .sseg(seg),
                            .dp(dp)
                            );

   counter #(26) my_timer(.clk(mclk),
	                      .reset(0),
	                      .count(count)
	                      );

   Barrel_Shift_Gen #(.ADDRESS_BITS(3), .RIGHT(1))
   right_shifter (.num(result_reg),
		          .amt(sw[2:0]),
		          .shifted(right_shifted)
	              );
   Barrel_Shift_Gen #(.ADDRESS_BITS(3), .LEFT(1))
   left_shifter (.num(result_reg),
		         .amt(sw[2:0]),
		         .shifted(left_shifted)
	             );

   always @(posedge mclk, posedge reset)
     begin
        if (reset)
          begin
             start      <= 1'b0;
             result_reg <= 8'h00;
             shift_reg  <= 8'h00;
          end
        else
          begin
             start      <= start_next;
             result_reg <= result_next;
             shift_reg  <= shift_next;
          end
     end

   always @*
     begin
	    value       <= 4'h0;
		an          <= 4'b1111;
        start_next  <= start;
        result_next <= result_reg;
		shift_next  <= shift_reg;

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
             value <= result_reg[3:0];
             an    <= 4'b1011;
          end
          2'b11: begin
             value <= result_reg[7:4];
             an    <= 4'b0111;
          end
        endcase // case (count[19:18])

		case({btn_2, btn_1, btn_0})
          3'b000: begin
             if (start)
               result_next <= shift_reg;
          end
          3'b100: begin
             result_next <= sw;
             start_next  <= 1'b0;
          end
          3'b010: begin
             shift_next <= left_shifted;
             start_next <= 1'b1;
          end
          3'b001: begin
             shift_next <= right_shifted;
             start_next <= 1'b1;
          end
		endcase // case ({btn_1, btn_0})
     end

endmodule

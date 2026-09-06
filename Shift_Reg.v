module Shift_Reg (
    input  wire       i_clk,       // 5 Hz clock from divider
    input  wire       i_rst_n,
    input  wire       i_hold,
    input  wire [1:0] i_state,     // Now has 4 states
    output reg  [9:0] o_Shift_Reg
);

  reg [9:0] internal_shift;
  reg       direction;
  reg       blink_toggle;  // Reverted to 1-bit for optimal hardware

  // SEQUENTIAL LOGIC: Handle the bouncing and blinking state
  always @(posedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
      internal_shift <= 10'b10_0000_0000;
      direction      <= 1'b0;
      blink_toggle   <= 1'b0;
    end else begin
      // This flips every 5Hz clock tick (creates a fast blink)
      blink_toggle <= ~blink_toggle;

      if (i_state == 2'b11) begin
        // START State: Lock it to the starting position
        internal_shift <= 10'b10_0000_0000;
        direction      <= 1'b0;
      end else if (i_state == 2'b00 && i_hold) begin
        // PLAY State (and button not pressed): Ping-Pong swap directions
        if (direction == 1'b0) begin
          if (internal_shift[1] == 1'b1) begin
            internal_shift <= 10'b00_0000_0001;
            direction      <= 1'b1;
          end else begin
            internal_shift <= {1'b0, internal_shift[9:1]};
          end
        end else begin
          if (internal_shift[8] == 1'b1) begin
            internal_shift <= 10'b10_0000_0000;
            direction      <= 1'b0;
          end else begin
            internal_shift <= {internal_shift[8:0], 1'b0};
          end
        end
      end
    end
  end

  // COMBINATIONAL LOGIC: Handle the visual effects
  always @(*) begin
    case (i_state)
      // WIN: Celebrate! If blink_toggle is 1, turn ALL LEDs on. Otherwise, turn them ALL off.
      2'b01:   o_Shift_Reg = blink_toggle ? 10'b11_1111_1111 : 10'b0;
      2'b10:   o_Shift_Reg = 10'b0;  // LOSE: Sad (All OFF)
      default: o_Shift_Reg = internal_shift;  // PLAY/START: Normal display
    endcase
  end

endmodule

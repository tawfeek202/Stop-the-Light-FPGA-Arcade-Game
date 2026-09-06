module Game_Controller (
    input  wire       i_clk,
    input  wire       i_rst_n,
    input  wire       i_start,  // NEW: Start button
    input  wire       i_hold,
    input  wire [9:0] i_leds,
    input  wire [9:0] i_sw,
    output reg  [1:0] o_state
);

  localparam PLAY = 2'b00, WIN = 2'b01, LOSE = 2'b10, START = 2'b11;

  always @(posedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
      o_state <= START;
    end else begin
      case (o_state)
        START: begin
          // Wait for the start button to drop to 0
          if (!i_start) o_state <= PLAY;
        end
        PLAY: begin
          if (!i_hold) begin
            if ((i_leds & i_sw) != 10'b0) o_state <= WIN;
            else o_state <= LOSE;
          end
        end
        // WIN and LOSE lock automatically until physical reset
      endcase
    end
  end
endmodule

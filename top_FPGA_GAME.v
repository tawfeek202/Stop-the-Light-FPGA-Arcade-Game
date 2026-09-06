module top_FPGA_GAME (
    input wire       i_rst_n,
    input wire       i_start,  // ADDED: New start button
    input wire       i_clk,
    input wire       i_hold,
    input wire [9:0] i_sw,

    output wire [9:0] o_leds,
    output wire [6:0] o_hex3,
    output wire [6:0] o_hex2,
    output wire [6:0] o_hex1,
    output wire [6:0] o_hex0
);

  wire Clk_divided;
  wire [1:0] state_from_cntrl;

  Clk_Div #(
      .INPUT_FREQ (50_000_000),
      .TARGET_FREQ(5)
  ) Clk_Div_D1 (
      .i_clk  (i_clk),
      .i_rst_n(i_rst_n),
      .o_clk  (Clk_divided)
  );

  Shift_Reg D2 (
      .i_clk(Clk_divided),
      .i_rst_n(i_rst_n),
      .i_hold(i_hold),
      .i_state(state_from_cntrl),
      .o_Shift_Reg(o_leds)
  );

  Game_Controller D3 (
      .i_clk  (i_clk),
      .i_rst_n(i_rst_n),
      .i_start(i_start),          // ROUTED: Connect start button
      .i_hold (i_hold),
      .i_leds (o_leds),
      .i_sw   (i_sw),
      .o_state(state_from_cntrl)
  );

  Seven_Seg_Decoder D4 (
      .i_state(state_from_cntrl),
      .o_hex3 (o_hex3),
      .o_hex2 (o_hex2),
      .o_hex1 (o_hex1),
      .o_hex0 (o_hex0)
  );

endmodule

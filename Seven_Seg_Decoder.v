module Seven_Seg_Decoder (
    input  wire [1:0] i_state,
    output reg  [6:0] o_hex3,
    output reg  [6:0] o_hex2,
    output reg  [6:0] o_hex1,
    output reg  [6:0] o_hex0
);

  localparam BLANK = 7'b111_1111;
  localparam L_B = 7'b000_0011;
  localparam L_O = 7'b100_0000;
  localparam L_S = 7'b001_0010;
  localparam L_L = 7'b100_0111;
  localparam L_E = 7'b000_0110;
  localparam L_t = 7'b000_0111;  // 't'
  localparam L_r = 7'b010_1111;  // 'r'

  always @(*) begin
    case (i_state)
      2'b11: begin  // START: "Strt"
        o_hex3 = L_S;
        o_hex2 = L_t;
        o_hex1 = L_r;
        o_hex0 = L_t;
      end
      2'b01: begin  // WIN: "BOSS"
        o_hex3 = L_B;
        o_hex2 = L_O;
        o_hex1 = L_S;
        o_hex0 = L_S;
      end
      2'b10: begin  // LOSE: "LOSE"
        o_hex3 = L_L;
        o_hex2 = L_O;
        o_hex1 = L_S;
        o_hex0 = L_E;
      end
      default: begin  // PLAY: Blank screens
        o_hex3 = BLANK;
        o_hex2 = BLANK;
        o_hex1 = BLANK;
        o_hex0 = BLANK;
      end
    endcase
  end
endmodule

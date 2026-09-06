# Clock
set_location_assignment PIN_AF14 -to i_clk

# Push Buttons (Active Low)
set_location_assignment PIN_AJ4 -to i_rst_n
set_location_assignment PIN_AK4 -to i_hold
set_location_assignment PIN_AA14 -to i_start

# Slide Switches (Target Zone Configuration)
set_location_assignment PIN_AB30 -to i_sw[0]
set_location_assignment PIN_Y27  -to i_sw[1]
set_location_assignment PIN_AB28 -to i_sw[2]
set_location_assignment PIN_AC30 -to i_sw[3]
set_location_assignment PIN_W25  -to i_sw[4]
set_location_assignment PIN_V25  -to i_sw[5]
set_location_assignment PIN_AC28 -to i_sw[6]
set_location_assignment PIN_AD30 -to i_sw[7]
set_location_assignment PIN_AC29 -to i_sw[8]
set_location_assignment PIN_AA30 -to i_sw[9]

# Red LEDs
set_location_assignment PIN_AA24 -to o_leds[0]
set_location_assignment PIN_AB23 -to o_leds[1]
set_location_assignment PIN_AC23 -to o_leds[2]
set_location_assignment PIN_AD24 -to o_leds[3]
set_location_assignment PIN_AG25 -to o_leds[4]
set_location_assignment PIN_AF25 -to o_leds[5]
set_location_assignment PIN_AE24 -to o_leds[6]
set_location_assignment PIN_AF24 -to o_leds[7]
set_location_assignment PIN_AB22 -to o_leds[8]
set_location_assignment PIN_AC22 -to o_leds[9]

# 7-Segment Display 0 (Rightmost - 'S' or 'E')
set_location_assignment PIN_W17 -to o_hex0[0]
set_location_assignment PIN_V18 -to o_hex0[1]
set_location_assignment PIN_AG17 -to o_hex0[2]
set_location_assignment PIN_AG16 -to o_hex0[3]
set_location_assignment PIN_AH17 -to o_hex0[4]
set_location_assignment PIN_AG18 -to o_hex0[5]
set_location_assignment PIN_AH18 -to o_hex0[6]

# 7-Segment Display 1 ('S')
set_location_assignment PIN_AF16 -to o_hex1[0]
set_location_assignment PIN_V16 -to o_hex1[1]
set_location_assignment PIN_AE16 -to o_hex1[2]
set_location_assignment PIN_AD17 -to o_hex1[3]
set_location_assignment PIN_AE18 -to o_hex1[4]
set_location_assignment PIN_AE17 -to o_hex1[5]
set_location_assignment PIN_V17 -to o_hex1[6]

# 7-Segment Display 2 ('O')
set_location_assignment PIN_AA21 -to o_hex2[0]
set_location_assignment PIN_AB17 -to o_hex2[1]
set_location_assignment PIN_AA18 -to o_hex2[2]
set_location_assignment PIN_Y17 -to o_hex2[3]
set_location_assignment PIN_Y18 -to o_hex2[4]
set_location_assignment PIN_AF18 -to o_hex2[5]
set_location_assignment PIN_W16 -to o_hex2[6]

# 7-Segment Display 3 ('B' or 'L')
set_location_assignment PIN_Y19 -to o_hex3[0]
set_location_assignment PIN_W19 -to o_hex3[1]
set_location_assignment PIN_AD19 -to o_hex3[2]
set_location_assignment PIN_AA20 -to o_hex3[3]
set_location_assignment PIN_AC20 -to o_hex3[4]
set_location_assignment PIN_AA19 -to o_hex3[5]
set_location_assignment PIN_AD20 -to o_hex3[6]

# Set 3.3V I/O Standard for all pins
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to i_clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to i_rst_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to i_hold
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to i_start
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to i_sw*
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to o_leds*
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to o_hex*
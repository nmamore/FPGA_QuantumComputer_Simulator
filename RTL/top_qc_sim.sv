/*
* @file topQCSim.sv 
* @brief Top level of quantum computer simulator
* @author Nicholas Amore namore7@gmail.com
* @date Creater 1/10/2026
*/

`timescale 1ns/1ps

module topMIPS (
  input        clk_i,
  input        rst_ni,
  
  output [7:0] hex_0_o,
  output [7:0] hex_1_o,
  output [7:0] hex_2_o,
  output [7:0] hex_3_o,
  output [7:0] hex_4_o,
  output [7:0] hex_5_o,
  
  input        sw_0_i,
  input        sw_1_i,
  input        sw_2_i,
  input        sw_3_i,
  input        sw_4_i,
  input        sw_5_i,
  input        sw_6_i,
  input        sw_7_i,
  input        sw_8_i,
  input        sw_9_i,
  
  output       led_r_0_o,
  output       led_r_1_o,
  output       led_r_2_o,
  output       led_r_3_o,
  output       led_r_4_o,
  output       led_r_5_o,
  output       led_r_6_o,
  output       led_r_7_o,
  output       led_r_8_o,
  output       led_r_9_o
);

//Signal Declarations

//General Signals


quantum_state_vector init_state_vector (
  .clk_i      (clk_i),
  .rst_ni     (rst_ni),
  .wr_en_i    (1'b0),
  
  .alpha_re_i ('h0),
  .alpha_im_i ('h0),
  .beta_re_i  ('h0),
  .beta_im_i  ('h0),
  
  .alpha_re_o (),
  .alpha_im_o (),
  .beta_re_o  (),
  .beta_im_o  ()
);

x_gate x (
  .alpha_re_i (),
  .alpha_im_i (),
  .beta_re_i  (),
  .beta_im_i  (),
  
  .alpha_re_o (),
  .alpha_im_o (),
  .beta_re_o  (),
  .beta_im_o  ()
);

sev_seg_display hex0 (
  .dat_i      (),
  .seven_seg_o(hex_0_o)
);

sev_seg_display hex1 (
  .dat_i      (),
  .seven_seg_o(hex_1_o)
);

sev_seg_display hex2 (
  .dat_i      (),
  .seven_seg_o(hex_2_o)
);

sev_seg_display hex3 (
  .dat_i      (),
  .seven_seg_o(hex_3_o)
);

sev_seg_display hex4 (
  .dat_i      (),
  .seven_seg_o(hex_4_o)
);

sev_seg_display hex5 (
  .dat_i      (),
  .seven_seg_o(hex_5_o)
);

sync sw_0_sync (
  .clk_i  (clk_i),
  .async_i(sw_0_i),
  .sync_o (sync_sw_0)
);

sync sw_1_sync (
  .clk_i  (clk_i),
  .async_i(sw_1_i),
  .sync_o ()
);

sync sw_2_sync (
  .clk_i  (clk_i),
  .async_i(sw_2_i),
  .sync_o ()
);

sync sw_3_sync (
  .clk_i  (clk_i),
  .async_i(sw_3_i),
  .sync_o ()
);

sync sw_4_sync (
  .clk_i  (clk_i),
  .async_i(sw_4_i),
  .sync_o ()
);

sync sw_5_sync (
  .clk_i  (clk_i),
  .async_i(sw_5_i),
  .sync_o ()
);

sync sw_6_sync (
  .clk_i  (clk_i),
  .async_i(sw_6_i),
  .sync_o ()
);

sync sw_7_sync (
  .clk_i  (clk_i),
  .async_i(sw_7_i),
  .sync_o ()
);

sync sw_8_sync (
  .clk_i  (clk_i),
  .async_i(sw_8_i),
  .sync_o ()
);

sync sw_9_sync (
  .clk_i  (clk_i),
  .async_i(sw_9_i),
  .sync_o ()
);

sync rst_sync (
  .clk_i  (clk_i),
  .async_i(rst_ni),
  .sync_o ()
);

endmodule
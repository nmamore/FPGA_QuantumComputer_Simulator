/*
* @file hadamard_gate.sv
* @brief Places state vector into superposition
* @author Nicholas Amore namore7@gmail.com
* @date Created 1/10/2026
*/

module z_gate (
  input logic  [17:0] alpha_re_i,
  input logic  [17:0] alpha_im_i,
  input logic  [17:0] beta_re_i,
  input logic  [17:0] beta_im_i,
  
  output logic [17:0] alpha_re_o,
  output logic [17:0] alpha_im_o,
  output logic [17:0] beta_re_o,
  output logic [17:0] beta_im_o
);

//Coefficients for the input vector remain the same in magnitude
//Beta flips in phase
assign alpha_re_o = alpha_re_i;
assign alpha_im_o = alpha_im_i;
assign beta_re_o  = ~beta_re_i + 1'b1;
assign beta_im_o  = ~beta_im_i + 1'b1;

endmodule
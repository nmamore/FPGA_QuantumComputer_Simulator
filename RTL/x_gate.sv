/*
* @file x_gate.sv
* @brief Inverts input state vector
* @author Nicholas Amore namore7@gmail.com
* @date Created 1/10/2026
*/

module x_gate (
  input logic  [17:0] alpha_re_i,
  input logic  [17:0] alpha_im_i,
  input logic  [17:0] beta_re_i,
  input logic  [17:0] beta_im_i,
  
  output logic [17:0] alpha_re_o,
  output logic [17:0] alpha_im_o,
  output logic [17:0] beta_re_o,
  output logic [17:0] beta_im_o
);

//Coefficients for the input vector are swapped
//Alpha maps to Beta and Beta maps to alpha
assign alpha_re_o = beta_re_i;
assign alpha_im_o = beta_im_i;
assign beta_re_o  = alpha_re_i;
assign beta_im_o  = alpha_im_i;

endmodule
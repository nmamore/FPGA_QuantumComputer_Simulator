/*
* @file quantum_state_vector.sv
* @brief Array used to store qubit state
* @author Nicholas Amore namore7@gmail.com
* @date Created 1/10/2026
*/

module quantum_state_vector (
  input logic         clk_i,
  input logic         rst_ni,
  input logic         wr_en_i,
  
  input logic  [17:0] alpha_re_i,
  input logic  [17:0] alpha_im_i,
  input logic  [17:0] beta_re_i,
  input logic  [17:0] beta_im_i,
  
  output logic [17:0] alpha_re_o,
  output logic [17:0] alpha_im_o,
  output logic [17:0] beta_re_o,
  output logic [17:0] beta_im_o
  
);

logic [17:0] alpha_re_q;
logic [17:0] alpha_im_q;
logic [17:0] beta_re_q;
logic [17:0] beta_im_q;

always_ff @(posedge clk_i or negedge rst_ni) begin
  if (!rst_ni) begin
    alpha_re_q <= 18'h10000;
    alpha_im_q <= 18'h00000;
    beta_re_q  <= 18'h00000;
    beta_im_q  <= 18'h00000;
  end else if (wr_en_i) begin
    alpha_re_q <= alpha_re_i;
    alpha_im_q <= alpha_im_i;
    beta_re_q  <= beta_re_i;
    beta_im_q  <= beta_im_i;
  end
end

assign alpha_re_o = alpha_re_q;
assign alpha_im_o = alpha_im_q;
assign beta_re_o =  beta_re_q;
assign beta_im_o =  beta_im_q;

endmodule
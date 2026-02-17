/*
* @file probability.sv
* @brief Generates probability for state vector
* @author Nicholas Amore namore7@gmail.com
* @date Created 2/15/2026
*/

module probability #(
  parameter QUBITS = 3
) (
  input logic         clk_i,
  input logic         rst_ni,
  input logic         wr_en_i,
  input logic signed [15:0] re_i [0:(2**QUBITS)-1],
  input logic signed [15:0] im_i [0:(2**QUBITS)-1],
  
  output logic signed [15:0] prob_o [0:(2**QUBITS)-1]
);

localparam STATES = 2**QUBITS;

logic signed [31:0] temp_reg [0:(2**QUBITS)-1];

for (genvar i = 0; i < STATES; i++) begin: prob_sv
  
  logic signed [15:0] prob_q;
  
  assign temp_reg[i] = ((re_i[i]*re_i[i]) + (im_i[i]*im_i[i])) >>> 14;
  
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      prob_q <= 'h0;
    end else if (wr_en_i) begin
      prob_q <= temp_reg[i];
    end
  end
  
  assign prob_o[i] = prob_q;
  
end

endmodule
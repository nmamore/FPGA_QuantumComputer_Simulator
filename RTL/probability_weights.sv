/*
* @file probability_weights.sv
* @brief Generates weights from probabilities
* @author Nicholas Amore namore7@gmail.com
* @date Created 2/15/2026
*/

module probability_weights #(
  parameter QUBITS = 3
) (
  input logic         clk_i,
  input logic         rst_ni,
  input logic         wr_en_i,
  input logic signed  [15:0] prob_i [0:(2**QUBITS)-1],
  
  output logic signed [15:0] prob_weight_o [0:(2**QUBITS)-1]
);

localparam STATES = 2**QUBITS;

logic signed [31:0] prob_windows [0:(2**QUBITS)-1];

assign prob_windows[0] = prob_i[0];

genvar i;

generate

for (i = 1; i < STATES; i++) begin: prob_window
  assign prob_windows[i] = prob_i[i] + prob_windows[i-1];
end

endgenerate

generate

for (i = 0; i < STATES; i++) begin: prob_weight_sv
  
  logic signed [15:0] prob_weight_q;
  
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      prob_weight_q <= 'h0;
    end else if (wr_en_i) begin
      prob_weight_q <= prob_windows[i][15:0];
    end
  end
  
  assign prob_weight_o[i] = prob_weight_q;
end

endgenerate
endmodule
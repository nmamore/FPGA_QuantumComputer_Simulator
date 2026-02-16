/*
* @file measure.sv
* @brief Generates measurement result based on probabilities
* @author Nicholas Amore namore7@gmail.com
* @date Created 2/15/2026
*/

module measure #(
  parameter QUBITS = 3
)(
  input logic clk_i,
  input logic rst_ni,
  input logic measure_i,
  
  input logic  [15:0] prob_windows_i [0:(2**QUBITS)-1],
  input logic  [15:0] pseudo_rng_i,
  
  output logic [QUBITS-1:0] cbits_o
);

localparam STATES = 2**QUBITS;

logic [QUBITS-1:0] cbits_temp;

always_comb begin
  for (int i = 0; i < STATES; i++) begin
    if (pseudo_rng_i < prob_windows_i[i]) begin
      cbits_temp = i;
    end else begin
      cbits_temp = STATES - 1;
    end
  end
end

always_ff @(posedge clk_i or negedge rst_ni) begin
  if (!rst_ni) begin
    cbits_o <= 'h0;
  end else if (measure_i) begin
    cbits_o <= cbits_temp;
  end
end

endmodule
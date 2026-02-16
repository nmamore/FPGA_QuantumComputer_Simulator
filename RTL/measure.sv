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

always_ff @(posedge clk_i or negedge rst_ni) begin
  if (!rst_ni) begin
    cbits_o <= 'h0;
  end else if (measure_i) begin
    if (pseudo_rng_i < prob_windows_i[0]) begin
      cbits_o <= 3'b000;
    end else if (pseudo_rng_i < prob_windows_i[1]) begin
      cbits_o <= 3'b001;
    end else if (pseudo_rng_i < prob_windows_i[2]) begin
      cbits_o <= 3'b010;
    end else if (pseudo_rng_i < prob_windows_i[3]) begin
      cbits_o <= 3'b011;
    end else if (pseudo_rng_i < prob_windows_i[4]) begin
      cbits_o <= 3'b100;
    end else if (pseudo_rng_i < prob_windows_i[5]) begin
      cbits_o <= 3'b101;
    end else if (pseudo_rng_i < prob_windows_i[6]) begin
      cbits_o <= 3'b110;
    end else begin
      cbits_o <= 3'b111;
    end
  end
end

endmodule
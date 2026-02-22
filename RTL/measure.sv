/*
* @file measure.sv
* @brief Generates measurement result based on probabilities
* @author Nicholas Amore namore7@gmail.com
* @date Created 2/15/2026
*/

module measure #(
  parameter QUBITS = 3 //Qubits determine vector size
)(
  input logic clk_i,
  input logic rst_ni,
  input logic measure_i,
  
  input logic signed  [15:0] prob_windows_i [0:(2**QUBITS)-1],
  input logic signed  [15:0] pseudo_rng_i,
  
  output logic signed [QUBITS-1:0] cbits_o
);

localparam STATES = 2**QUBITS; //Determines how many states there are

always_ff @(posedge clk_i or negedge rst_ni) begin
  if (!rst_ni) begin
    cbits_o <= 'h0;
  end else if (measure_i) begin //Waits until measure is asserted
    if (pseudo_rng_i < prob_windows_i[0]) begin //Checks random number against probability window
      cbits_o <= 3'b000; //Sets output to state if random number is in window
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
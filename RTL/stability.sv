/*
* @file stability.sv
* @brief Ensures combinational logic is settled
* @author Nicholas Amore namore7@gmail.com
* @date Created 4/15/2026
*/

`timescale 1ns/1ps

module stability #(
  parameter int QUBITS     = 3 //Qubits determine vector size
) (
  input logic                clk_i,
  input logic                rst_ni,
  
  output logic               stable_o,
  
  input  logic signed [15:0] prob_weight_i
  
);

localparam STATES = 2**QUBITS; //Determines how many states there are

logic signed [15:0] weight_q1;
logic signed [15:0] weight_q2;

assign stable_o = (prob_weight_i == weight_q1) && (weight_q1 == weight_q2); //Logic to check that all registers have the same value. No longer changing

always_ff @(posedge clk_i or negedge rst_ni) begin //Update registers with new data
  if (!rst_ni) begin
    weight_q1 <= 'h0;
    weight_q2 <= 'h0;
  end else begin
    weight_q1 <= prob_weight_i;
    weight_q2 <= weight_q1;
  end
end

endmodule
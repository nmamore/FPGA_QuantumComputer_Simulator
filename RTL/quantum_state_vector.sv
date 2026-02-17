/*
* @file quantum_state_vector.sv
* @brief Array used to store qubit state
* @author Nicholas Amore namore7@gmail.com
* @date Created 1/10/2026
*/

`timescale 1ns/1ps

module quantum_state_vector #(
  parameter QUBITS = 3
)(
  input logic         clk_i,
  input logic         rst_ni,
  input logic         wr_en_i,
  
  input logic signed [15:0] re_i [0:(2**QUBITS)-1],
  input logic signed [15:0] im_i [0:(2**QUBITS)-1],
  
  output logic signed [15:0] re_o [0:(2**QUBITS)-1],
  output logic signed [15:0] im_o [0:(2**QUBITS)-1]
  
);

localparam STATES = 2**QUBITS;

genvar i;

generate

for (i = 0; i < STATES; i++) begin: qsv_flip_flops

  logic signed [15:0] re_q;
  logic signed [15:0] im_q;

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      re_q <= 'h0;
      im_q <= 'h0;
    end else if (wr_en_i) begin
      re_q <= re_i[i];
      im_q <= im_i[i];
    end
  end

  assign re_o[i] = re_q;
  assign im_o[i] = im_q;

end

endgenerate

endmodule
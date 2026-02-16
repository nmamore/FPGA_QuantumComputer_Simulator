/*
* @file probability.sv
* @brief Generates probability for state vector
* @author Nicholas Amore namore7@gmail.com
* @date Created 2/15/2026
*/

module probability #(
  parameter QUBITS = 3
) (
  input logic  [15:0] re_i [0:(2**QUBITS)-1],
  input logic  [15:0] im_i [0:(2**QUBITS)-1],
  
  output logic [15:0] prob_o [0:(2**QUBITS)-1]
);

localparam STATES = 2**QUBITS;

logic [31:0] temp_reg [0:(2**QUBITS)-1];

for (genvar i = 0; i < STATES; i++) begin: prob_sv
  assign temp_reg[i] = ((re_i[i]*re_i[i]) + (im_i[i]*im_i[i])) >>> 14;
  assign prob_o[i] = temp_reg[i][15:0];
end

endmodule
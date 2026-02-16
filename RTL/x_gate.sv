/*
* @file x_gate.sv
* @brief Inverts input state vector
* @author Nicholas Amore namore7@gmail.com
* @date Created 1/10/2026
*/

module x_gate #(
  parameter QUBITS = 3
)(
  input logic  [QUBITS-1:0] bitmask_i,
  input logic  [15:0] re_i [0:(2**QUBITS)-1],
  input logic  [15:0] im_i [0:(2**QUBITS)-1],
  
  output logic [15:0] re_o [0:(2**QUBITS)-1],
  output logic [15:0] im_o [0:(2**QUBITS)-1]
);

localparam STATES = 2**QUBITS;

for (genvar i = 0; i < STATES; i++) begin
  assign re_o[i] = re_i[i^bitmask_i];
  assign im_o[i] = im_i[i^bitmask_i];
end

endmodule
/*
* @file probability_weights.sv
* @brief Generates weights from probabilities
* @author Nicholas Amore namore7@gmail.com
* @date Created 2/15/2026
*/

module probability_weights #(
  parameter QUBITS = 3 //Qubits determine vector size
) (
  input  logic signed [15:0] prob_i [0:(2**QUBITS)-1],
  
  output logic signed [15:0] prob_weight_o [0:(2**QUBITS)-1]
);

localparam STATES = 2**QUBITS;  //Determines how many states there are

assign prob_weight_o[0] = prob_i[0]; //First iteration will always just be equal to itself

genvar i; //Creates multiple iterations of the same circuit

generate

for (i = 1; i < STATES; i++) begin: window_func
  assign prob_weight_o[i] = prob_i[i] + prob_weight_o[i-1]; //Cumulative distribution function. Sums current index with previous
end

endgenerate

endmodule
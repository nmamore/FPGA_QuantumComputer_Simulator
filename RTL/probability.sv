/*
* @file probability.sv
* @brief Generates probability for state vector
* @author Nicholas Amore namore7@gmail.com
* @date Created 2/15/2026
*/

module probability #(
  parameter QUBITS = 3 //Qubits determine vector size
) (
  input logic signed [15:0] re_i [0:(2**QUBITS)-1],
  input logic signed [15:0] im_i [0:(2**QUBITS)-1],
  
  output logic signed [15:0] prob_o [0:(2**QUBITS)-1]
);

localparam STATES = 2**QUBITS; //Determines how many states there are

genvar i; //Creates multiple iterations of the same circuit

generate

  for (i = 0; i < STATES; i++) begin: prob_sv
    logic signed [31:0] temp_reg; //Temp register to avoid overflow from multiplication
    assign temp_reg = ((re_i[i]*re_i[i]) + (im_i[i]*im_i[i])) >>> 14; //Square real and imaginary parts and sum to get probability;
                                                                       //Right shift by 14 to scale back to Q1.14 fixed point multiplication
    assign prob_o[i] = temp_reg[15:0];
  end
endgenerate

endmodule
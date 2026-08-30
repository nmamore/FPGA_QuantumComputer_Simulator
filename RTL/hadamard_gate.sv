/*
* @file hadamard_gate.sv
* @brief Places state vector into superposition
* @author Nicholas Amore namore7@gmail.com
* @date Created 1/10/2026
*/

module hadamard_gate #(
  parameter int QUBITS = 3, //Qubits determine vector size
  parameter int TARGET = 0  //What qubit is H applied on
) (
  input logic signed [15:0] re_i [0:(2**QUBITS)-1],
  input logic signed [15:0] im_i [0:(2**QUBITS)-1],
  
  output logic signed [15:0] re_o [0:(2**QUBITS)-1],
  output logic signed [15:0] im_o [0:(2**QUBITS)-1]
);

localparam int STATES = 2**QUBITS;

localparam int POS = 1 << TARGET;

localparam logic signed [31:0] HALF_LSB = 32'h2000;

localparam logic signed [15:0] SQRT_2_N = 16'h2D41; //1/sqrt(2)

genvar i; //Creates multiple iterations of the same circuit

generate

for (i = 0; i < STATES; i++) begin: gen_hadamard

    if (TARGET < QUBITS) begin //Check to make sure use does not enter target greater than number of qubits
        if ((i & POS) == 0) begin //Finds phase bit
            assign re_o[i] = 16'(((32'(re_i[i] + re_i[i + POS]) * SQRT_2_N) + HALF_LSB) >>> 14);
            assign im_o[i] = 16'(((32'(im_i[i] + im_i[i + POS]) * SQRT_2_N) + HALF_LSB) >>> 14);
        end else begin
            assign re_o[i] = 16'(((32'(re_i[i - POS] - re_i[i]) * SQRT_2_N) + HALF_LSB) >>> 14);
            assign im_o[i] = 16'(((32'(im_i[i - POS] - im_i[i]) * SQRT_2_N) + HALF_LSB) >>> 14);
        end
    end else begin
        assign re_o[i] = re_i[i];
        assign im_o[i] = im_i[i];
    end
end

endgenerate

endmodule
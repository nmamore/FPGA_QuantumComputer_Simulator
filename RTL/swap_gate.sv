/*
* @file sawp_gate.sv
* @brief Flips selected qubits
* @author Nicholas Amore namore7@gmail.com
* @date Created 1/10/2026
*/

module swap_gate #(
  parameter QUBITS = 3, //Qubits determine vector size
  parameter SWAP  = 1 //Determines qubits to swap
)(
  input logic signed [15:0] re_i [0:(2**QUBITS)-1],
  input logic signed [15:0] im_i [0:(2**QUBITS)-1],
  
  output logic signed [15:0] re_o [0:(2**QUBITS)-1],
  output logic signed [15:0] im_o [0:(2**QUBITS)-1]
);

localparam STATES = 2**QUBITS;

always_comb begin
  if (SWAP == 0) begin //Swap q0 and q1 (q2q1q0 -> q2q0q1)
    re_o[0] = re_i[0];
    re_o[1] = re_i[2];
    re_o[2] = re_i[1];
    re_o[3] = re_i[3];
    re_o[4] = re_i[4];
    re_o[5] = re_i[6];
    re_o[6] = re_i[5];
    re_o[7] = re_i[7];
    
    im_o[0] = im_i[0];
    im_o[1] = im_i[2];
    im_o[2] = im_i[1];
    im_o[3] = im_i[3];
    im_o[4] = im_i[4];
    im_o[5] = im_i[6];
    im_o[6] = im_i[5];
    im_o[7] = im_i[7];
  end else if (SWAP == 1) begin //Swap q0 and q2 (q2q1q0 -> q0q1q2)
    re_o[0] = re_i[0];
    re_o[1] = re_i[4];
    re_o[2] = re_i[2];
    re_o[3] = re_i[6];
    re_o[4] = re_i[1];
    re_o[5] = re_i[5];
    re_o[6] = re_i[3];
    re_o[7] = re_i[7];
    
    im_o[0] = im_i[0];
    im_o[1] = im_i[4];
    im_o[2] = im_i[2];
    im_o[3] = im_i[6];
    im_o[4] = im_i[1];
    im_o[5] = im_i[5];
    im_o[6] = im_i[3];
    im_o[7] = im_i[7];
  end else if (SWAP == 2) begin //Swap q1 and q2 (q2q1q0 -> q1q2q0)
    re_o[0] = re_i[0];
    re_o[1] = re_i[1];
    re_o[2] = re_i[4];
    re_o[3] = re_i[5];
    re_o[4] = re_i[2];
    re_o[5] = re_i[3];
    re_o[6] = re_i[6];
    re_o[7] = re_i[7];
    
    im_o[0] = im_i[0];
    im_o[1] = im_i[1];
    im_o[2] = im_i[4];
    im_o[3] = im_i[5];
    im_o[4] = im_i[2];
    im_o[5] = im_i[3];
    im_o[6] = im_i[6];
    im_o[7] = im_i[7];
  end else begin
    for (int i = 0; i < STATES; i++) begin //No other swaps. Identity
      re_o[i] = re_i[i];
      im_o[i] = im_i[i];
    end
  end
end

endmodule
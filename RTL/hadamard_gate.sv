/*
* @file hadamard_gate.sv
* @brief Places state vector into superposition
* @author Nicholas Amore namore7@gmail.com
* @date Created 1/10/2026
*/

module hadamard_gate #(
  parameter int QUBITS = 3,
  parameter int BITMASK = 7
) (
  input logic signed [15:0] re_i [0:(2**QUBITS)-1],
  input logic signed [15:0] im_i [0:(2**QUBITS)-1],
  
  output logic signed [15:0] re_o [0:(2**QUBITS)-1],
  output logic signed [15:0] im_o [0:(2**QUBITS)-1]
);

localparam int STATES = 2**QUBITS;
localparam int GATES  = $countones(BITMASK);
localparam int COEFF  = $floor((1.0/(2.0**(GATES/2.0))) * (2**14));

logic signed [31:0] re_temp [0:(2**QUBITS)-1];
logic signed [31:0] im_temp [0:(2**QUBITS)-1];

logic signed [15:0] sqrt_2_n = COEFF;

always_comb begin
  if (BITMASK == 0) begin
    for (int i = 0; i < STATES; i++) begin
      re_temp[i] = re_i[i];
      im_temp[i] = im_i[i];
    end
  end else if (BITMASK == 1) begin
    re_temp[0] = ((re_i[0] + re_i[1]) * sqrt_2_n) >>> 14;
    re_temp[1] = ((re_i[0] - re_i[1]) * sqrt_2_n) >>> 14;
    re_temp[2] = ((re_i[2] + re_i[3]) * sqrt_2_n) >>> 14;
    re_temp[3] = ((re_i[2] - re_i[3]) * sqrt_2_n) >>> 14;
    re_temp[4] = ((re_i[4] + re_i[5]) * sqrt_2_n) >>> 14;
    re_temp[5] = ((re_i[4] - re_i[5]) * sqrt_2_n) >>> 14;
    re_temp[6] = ((re_i[6] + re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[7] = ((re_i[6] - re_i[7]) * sqrt_2_n) >>> 14;
    
    im_temp[0] = ((im_i[0] + im_i[1]) * sqrt_2_n) >>> 14;
    im_temp[1] = ((im_i[0] - im_i[1]) * sqrt_2_n) >>> 14;
    im_temp[2] = ((im_i[2] + im_i[3]) * sqrt_2_n) >>> 14;
    im_temp[3] = ((im_i[2] - im_i[3]) * sqrt_2_n) >>> 14;
    im_temp[4] = ((im_i[4] + im_i[5]) * sqrt_2_n) >>> 14;
    im_temp[5] = ((im_i[4] - im_i[5]) * sqrt_2_n) >>> 14;
    im_temp[6] = ((im_i[6] + im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[7] = ((im_i[6] - im_i[7]) * sqrt_2_n) >>> 14;
  end else if (BITMASK == 2) begin
    re_temp[0] = ((re_i[0] + re_i[2]) * sqrt_2_n) >>> 14;
    re_temp[1] = ((re_i[1] + re_i[3]) * sqrt_2_n) >>> 14;
    re_temp[2] = ((re_i[0] - re_i[2]) * sqrt_2_n) >>> 14;
    re_temp[3] = ((re_i[1] - re_i[3]) * sqrt_2_n) >>> 14;
    re_temp[4] = ((re_i[4] + re_i[6]) * sqrt_2_n) >>> 14;
    re_temp[5] = ((re_i[5] + re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[6] = ((re_i[4] - re_i[6]) * sqrt_2_n) >>> 14;
    re_temp[7] = ((re_i[5] - re_i[7]) * sqrt_2_n) >>> 14;
    
    im_temp[0] = ((im_i[0] + im_i[2]) * sqrt_2_n) >>> 14;
    im_temp[1] = ((im_i[1] + im_i[3]) * sqrt_2_n) >>> 14;
    im_temp[2] = ((im_i[0] - im_i[2]) * sqrt_2_n) >>> 14;
    im_temp[3] = ((im_i[1] - im_i[3]) * sqrt_2_n) >>> 14;
    im_temp[4] = ((im_i[4] + im_i[6]) * sqrt_2_n) >>> 14;
    im_temp[5] = ((im_i[5] + im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[6] = ((im_i[4] - im_i[6]) * sqrt_2_n) >>> 14;
    im_temp[7] = ((im_i[5] - im_i[7]) * sqrt_2_n) >>> 14;
  end else if (BITMASK == 3) begin
    re_temp[0] = ((re_i[0] + re_i[1] + re_i[2] + re_i[3]) * sqrt_2_n) >>> 14;
    re_temp[1] = ((re_i[0] - re_i[1] + re_i[2] - re_i[3]) * sqrt_2_n) >>> 14;
    re_temp[2] = ((re_i[0] + re_i[1] - re_i[2] - re_i[2]) * sqrt_2_n) >>> 14;
    re_temp[3] = ((re_i[0] - re_i[1] - re_i[2] + re_i[3]) * sqrt_2_n) >>> 14;
    re_temp[4] = ((re_i[4] + re_i[5] + re_i[6] + re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[5] = ((re_i[4] - re_i[5] + re_i[6] - re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[6] = ((re_i[4] + re_i[5] - re_i[6] - re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[7] = ((re_i[4] - re_i[5] - re_i[6] + re_i[7]) * sqrt_2_n) >>> 14;
    
    im_temp[0] = ((im_i[0] + im_i[1] + im_i[2] + im_i[3]) * sqrt_2_n) >>> 14;
    im_temp[1] = ((im_i[0] - im_i[1] + im_i[2] - im_i[3]) * sqrt_2_n) >>> 14;
    im_temp[2] = ((im_i[0] + im_i[1] - im_i[2] - im_i[2]) * sqrt_2_n) >>> 14;
    im_temp[3] = ((im_i[0] - im_i[1] - im_i[2] + im_i[3]) * sqrt_2_n) >>> 14;
    im_temp[4] = ((im_i[4] + im_i[5] + im_i[6] + im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[5] = ((im_i[4] - im_i[5] + im_i[6] - im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[6] = ((im_i[4] + im_i[5] - im_i[6] - im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[7] = ((im_i[4] - im_i[5] - im_i[6] + im_i[7]) * sqrt_2_n) >>> 14;
  end else if (BITMASK == 4) begin
    re_temp[0] = ((re_i[0] + re_i[4]) * sqrt_2_n) >>> 14;
    re_temp[1] = ((re_i[1] + re_i[5]) * sqrt_2_n) >>> 14;
    re_temp[2] = ((re_i[2] + re_i[6]) * sqrt_2_n) >>> 14;
    re_temp[3] = ((re_i[3] + re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[4] = ((re_i[0] - re_i[4]) * sqrt_2_n) >>> 14;
    re_temp[5] = ((re_i[1] - re_i[5]) * sqrt_2_n) >>> 14;
    re_temp[6] = ((re_i[2] - re_i[6]) * sqrt_2_n) >>> 14;
    re_temp[7] = ((re_i[3] - re_i[7]) * sqrt_2_n) >>> 14;
    
    im_temp[0] = ((im_i[0] + im_i[4]) * sqrt_2_n) >>> 14;
    im_temp[1] = ((im_i[1] + im_i[5]) * sqrt_2_n) >>> 14;
    im_temp[2] = ((im_i[2] + im_i[6]) * sqrt_2_n) >>> 14;
    im_temp[3] = ((im_i[3] + im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[4] = ((im_i[0] - im_i[4]) * sqrt_2_n) >>> 14;
    im_temp[5] = ((im_i[1] - im_i[5]) * sqrt_2_n) >>> 14;
    im_temp[6] = ((im_i[2] - im_i[6]) * sqrt_2_n) >>> 14;
    im_temp[7] = ((im_i[3] - im_i[7]) * sqrt_2_n) >>> 14;
  end else if (BITMASK == 5) begin
    re_temp[0] = ((re_i[0] + re_i[1] + re_i[4] + re_i[5]) * sqrt_2_n) >>> 14;
    re_temp[1] = ((re_i[0] - re_i[1] + re_i[4] - re_i[5]) * sqrt_2_n) >>> 14;
    re_temp[2] = ((re_i[2] + re_i[3] + re_i[6] + re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[3] = ((re_i[2] - re_i[3] + re_i[6] - re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[4] = ((re_i[0] + re_i[1] - re_i[4] - re_i[5]) * sqrt_2_n) >>> 14;
    re_temp[5] = ((re_i[0] - re_i[1] - re_i[4] + re_i[5]) * sqrt_2_n) >>> 14;
    re_temp[6] = ((re_i[2] + re_i[3] - re_i[6] - re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[7] = ((re_i[2] - re_i[3] - re_i[6] + re_i[7]) * sqrt_2_n) >>> 14;
    
    im_temp[0] = ((im_i[0] + im_i[1] + im_i[4] + im_i[5]) * sqrt_2_n) >>> 14;
    im_temp[1] = ((im_i[0] - im_i[1] + im_i[4] - im_i[5]) * sqrt_2_n) >>> 14;
    im_temp[2] = ((im_i[2] + im_i[3] + im_i[6] + im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[3] = ((im_i[2] - im_i[3] + im_i[6] - im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[4] = ((im_i[0] + im_i[1] - im_i[4] - im_i[5]) * sqrt_2_n) >>> 14;
    im_temp[5] = ((im_i[0] - im_i[1] - im_i[4] + im_i[5]) * sqrt_2_n) >>> 14;
    im_temp[6] = ((im_i[2] + im_i[3] - im_i[6] - im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[7] = ((im_i[2] - im_i[3] - im_i[6] + im_i[7]) * sqrt_2_n) >>> 14;
  end else if (BITMASK == 6) begin
    re_temp[0] = ((re_i[0] + re_i[2] + re_i[4] + re_i[6]) * sqrt_2_n) >>> 14;
    re_temp[1] = ((re_i[1] + re_i[3] + re_i[5] + re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[2] = ((re_i[0] - re_i[2] + re_i[4] - re_i[6]) * sqrt_2_n) >>> 14;
    re_temp[3] = ((re_i[1] - re_i[3] + re_i[5] - re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[4] = ((re_i[0] + re_i[2] - re_i[4] - re_i[6]) * sqrt_2_n) >>> 14;
    re_temp[5] = ((re_i[1] + re_i[3] - re_i[5] - re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[6] = ((re_i[0] - re_i[2] - re_i[4] + re_i[6]) * sqrt_2_n) >>> 14;
    re_temp[7] = ((re_i[1] - re_i[3] - re_i[5] + re_i[7]) * sqrt_2_n) >>> 14;
    
    im_temp[0] = ((im_i[0] + im_i[2] + im_i[4] + im_i[6]) * sqrt_2_n) >>> 14;
    im_temp[1] = ((im_i[1] + im_i[3] + im_i[5] + im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[2] = ((im_i[0] - im_i[2] + im_i[4] - im_i[6]) * sqrt_2_n) >>> 14;
    im_temp[3] = ((im_i[1] - im_i[3] + im_i[5] - im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[4] = ((im_i[0] + im_i[2] - im_i[4] - im_i[6]) * sqrt_2_n) >>> 14;
    im_temp[5] = ((im_i[1] + im_i[3] - im_i[5] - im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[6] = ((im_i[0] - im_i[2] - im_i[4] + im_i[6]) * sqrt_2_n) >>> 14;
    im_temp[7] = ((im_i[1] - im_i[3] - im_i[5] + im_i[7]) * sqrt_2_n) >>> 14;
  end else if (BITMASK == 7) begin
    re_temp[0] = ((re_i[0] + re_i[1] + re_i[2] + re_i[3] + re_i[4] + re_i[5] + re_i[6] + re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[1] = ((re_i[0] - re_i[1] + re_i[2] - re_i[3] + re_i[4] - re_i[5] + re_i[6] - re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[2] = ((re_i[0] + re_i[1] - re_i[2] - re_i[3] + re_i[4] + re_i[5] - re_i[6] - re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[3] = ((re_i[0] - re_i[1] - re_i[2] + re_i[3] + re_i[4] - re_i[5] - re_i[6] + re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[4] = ((re_i[0] + re_i[1] + re_i[2] + re_i[3] - re_i[4] - re_i[5] - re_i[6] - re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[5] = ((re_i[0] - re_i[1] + re_i[2] - re_i[3] - re_i[4] + re_i[5] - re_i[6] + re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[6] = ((re_i[0] + re_i[1] - re_i[2] - re_i[3] - re_i[4] - re_i[5] + re_i[6] + re_i[7]) * sqrt_2_n) >>> 14;
    re_temp[7] = ((re_i[0] - re_i[1] - re_i[2] + re_i[3] - re_i[4] + re_i[5] + re_i[6] - re_i[7]) * sqrt_2_n) >>> 14;
    
    im_temp[0] = ((im_i[0] + im_i[1] + im_i[2] + im_i[3] + im_i[4] + im_i[5] + im_i[6] + im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[1] = ((im_i[0] - im_i[1] + im_i[2] - im_i[3] + im_i[4] - im_i[5] + im_i[6] - im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[2] = ((im_i[0] + im_i[1] - im_i[2] - im_i[3] + im_i[4] + im_i[5] - im_i[6] - im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[3] = ((im_i[0] - im_i[1] - im_i[2] + im_i[3] + im_i[4] - im_i[5] - im_i[6] + im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[4] = ((im_i[0] + im_i[1] + im_i[2] + im_i[3] - im_i[4] - im_i[5] - im_i[6] - im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[5] = ((im_i[0] - im_i[1] + im_i[2] - im_i[3] - im_i[4] + im_i[5] - im_i[6] + im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[6] = ((im_i[0] + im_i[1] - im_i[2] - im_i[3] - im_i[4] - im_i[5] + im_i[6] + im_i[7]) * sqrt_2_n) >>> 14;
    im_temp[7] = ((im_i[0] - im_i[1] - im_i[2] + im_i[3] - im_i[4] + im_i[5] + im_i[6] - im_i[7]) * sqrt_2_n) >>> 14;
  end else begin
    for (int i = 0; i < STATES; i++) begin
      re_temp[i] = re_i[i];
      im_temp[i] = im_i[i];
    end
  end
end

for (genvar i = 0; i < STATES; i++) begin

  assign re_o[i] = re_temp[i][15:0];
  assign im_o[i] = im_temp[i][15:0];

end

endmodule
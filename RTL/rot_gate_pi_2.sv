/*
* @file rot_gate_pi_2.sv
* @brief Rotates input by pi/2
* @author Nicholas Amore namore7@gmail.com
* @date Created 2/16/2026
*/

module rot_gate_pi_2 #(
  parameter int QUBITS  =   3,
  parameter int CONTROL =  1,
  parameter int TARGET  =   0
)(
  input logic signed  [15:0] re_i [0:(2**QUBITS)-1],
  input logic signed  [15:0] im_i [0:(2**QUBITS)-1],
  
  output logic signed [15:0] re_o [0:(2**QUBITS)-1],
  output logic signed [15:0] im_o [0:(2**QUBITS)-1]
);

localparam int STATES = 2**QUBITS;

logic signed [31:0] re_temp [0:(2**QUBITS)-1];
logic signed [31:0] im_temp [0:(2**QUBITS)-1];

always_comb begin
  if ((CONTROL == 1) && (TARGET == 0)) begin
    for (int i = 0; i < STATES; i++) begin
      if (i == 3 || i == 7) begin
        re_temp[i] = -im_i[i];
        im_temp[i] = re_i[i];
      end else begin
        re_temp[i] = re_i[i];
        im_temp[i] = im_i[i];
      end
    end
  end else if ((CONTROL == 2) && (TARGET == 0)) begin
    for (int i = 0; i < STATES; i++) begin
      if (i == 5 || i == 7) begin
        re_temp[i] = -im_i[i];
        im_temp[i] = re_i[i];
      end else begin
        re_temp[i] = re_i[i];
        im_temp[i] = im_i[i];
      end
    end
  end else if ((CONTROL == 2) && (TARGET == 1)) begin
    for (int i = 0; i < STATES; i++) begin
      if (i == 6 || i == 7) begin
        re_temp[i] = -im_i[i];
        im_temp[i] = re_i[i];
      end else begin
        re_temp[i] = re_i[i];
        im_temp[i] = im_i[i];
      end
    end
  end else if ((CONTROL == 0) && (TARGET == 2)) begin
    for (int i = 0; i < STATES; i++) begin
      if (i == 6 || i == 7) begin
        re_temp[i] = -im_i[i];
        im_temp[i] = re_i[i];
      end else begin
        re_temp[i] = re_i[i];
        im_temp[i] = im_i[i];
      end
    end
  end else if ((CONTROL == 0) && (TARGET == 1)) begin
    for (int i = 0; i < STATES; i++) begin
      if (i == 6 || i == 7) begin
        re_temp[i] = -im_i[i];
        im_temp[i] = re_i[i];
      end else begin
        re_temp[i] = re_i[i];
        im_temp[i] = im_i[i];
      end
    end
  end else if ((CONTROL == 1) && (TARGET == 2)) begin
    for (int i = 0; i < STATES; i++) begin
      if (i == 6 || i == 7) begin
        re_temp[i] = -im_i[i];
        im_temp[i] = re_i[i];
      end else begin
        re_temp[i] = re_i[i];
        im_temp[i] = im_i[i];
      end
    end
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
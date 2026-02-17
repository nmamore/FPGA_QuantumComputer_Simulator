/*
* @file top_qc_sim.sv 
* @brief Top level of quantum computer simulator
* @author Nicholas Amore namore7@gmail.com
* @date Creater 1/10/2026
*/

`timescale 1ns/1ps

module top_qc_sim #(
  parameter QUBITS = 3
)(
  input clk_i,
  input rst_ni

);

localparam STATES = 2**QUBITS;

//Signal Declarations
logic signed [15:0] init_sv_re [0:STATES-1];
logic signed [15:0] init_sv_im [0:STATES-1];

logic signed [15:0] u0_re [0:STATES-1];
logic signed [15:0] u0_im [0:STATES-1];

logic signed [15:0] u0_sv_re [0:STATES-1];
logic signed [15:0] u0_sv_im [0:STATES-1];

logic signed [15:0] u1_re [0:STATES-1];
logic signed [15:0] u1_im [0:STATES-1];

logic signed [15:0] u1_sv_re [0:STATES-1];
logic signed [15:0] u1_sv_im [0:STATES-1];

logic signed [15:0] u2_re [0:STATES-1];
logic signed [15:0] u2_im [0:STATES-1];

logic signed [15:0] u2_sv_re [0:STATES-1];
logic signed [15:0] u2_sv_im [0:STATES-1];

logic signed [15:0] u3_re [0:STATES-1];
logic signed [15:0] u3_im [0:STATES-1];

logic signed [15:0] u3_sv_re [0:STATES-1];
logic signed [15:0] u3_sv_im [0:STATES-1];

logic signed [15:0] u4_re [0:STATES-1];
logic signed [15:0] u4_im [0:STATES-1];

logic signed [15:0] u4_sv_re [0:STATES-1];
logic signed [15:0] u4_sv_im [0:STATES-1];

logic signed [15:0] u5_re [0:STATES-1];
logic signed [15:0] u5_im [0:STATES-1];

logic signed [15:0] u5_sv_re [0:STATES-1];
logic signed [15:0] u5_sv_im [0:STATES-1];

logic signed [15:0] u6_re [0:STATES-1];
logic signed [15:0] u6_im [0:STATES-1];

logic signed [15:0] u6_sv_re [0:STATES-1];
logic signed [15:0] u6_sv_im [0:STATES-1];

//General Signals

logic signed [15:0] pseudo_rng;

logic signed [15:0] prob_reg [0:STATES-1];
logic signed [15:0] prob_weight_reg [0:STATES-1];

logic [QUBITS-1:0] cbits;

initial begin
  $readmemh("../TB/sv_re_init.hex", init_sv_re);
  $readmemh("../TB/sv_im_init.hex", init_sv_im);
end

hadamard_gate #(
  .QUBITS(3),
  .BITMASK(4)
) u0_h_q2 (
  .re_i(init_sv_re),
  .im_i(init_sv_im),
  
  .re_o(u0_re),
  .im_o(u0_im)
);

quantum_state_vector # (
  .QUBITS(3)
) u0_state_vector (
  .clk_i      (clk_i),
  .rst_ni     (rst_ni),
  .wr_en_i    (1'b1),
  
  .re_i (u0_re),
  .im_i (u0_im),
  .re_o (u0_sv_re),
  .im_o (u0_sv_im)
);

rot_gate_pi_2 #(
  .QUBITS(3),
  .CONTROL(1),
  .TARGET(2)
) u1_rpi2_q1q2 (
  .re_i(u0_sv_re),
  .im_i(u0_sv_im),
  .re_o(u1_re),
  .im_o(u1_im)
);

quantum_state_vector # (
  .QUBITS(3)
) u1_state_vector (
  .clk_i      (clk_i),
  .rst_ni     (rst_ni),
  .wr_en_i    (1'b1),
  
  .re_i (u1_re),
  .im_i (u1_im),
  .re_o (u1_sv_re),
  .im_o (u1_sv_im)
);

rot_gate_pi_4 #(
  .QUBITS(3),
  .CONTROL(0),
  .TARGET(2)
) u2_rpi4_q0q2 (
  .re_i(u1_sv_re),
  .im_i(u1_sv_im),
  .re_o(u2_re),
  .im_o(u2_im)
);

quantum_state_vector # (
  .QUBITS(3)
) u2_state_vector (
  .clk_i      (clk_i),
  .rst_ni     (rst_ni),
  .wr_en_i    (1'b1),
  
  .re_i (u2_re),
  .im_i (u2_im),
  .re_o (u2_sv_re),
  .im_o (u2_sv_im)
);

hadamard_gate #(
  .QUBITS(3),
  .BITMASK(2)
) u3_h_q1 (
  .re_i(u2_sv_re),
  .im_i(u2_sv_im),
  
  .re_o(u3_re),
  .im_o(u3_im)
);

quantum_state_vector # (
  .QUBITS(3)
) u3_state_vector (
  .clk_i      (clk_i),
  .rst_ni     (rst_ni),
  .wr_en_i    (1'b1),
  
  .re_i (u3_re),
  .im_i (u3_im),
  .re_o (u3_sv_re),
  .im_o (u3_sv_im)
);

rot_gate_pi_2 #(
  .QUBITS(3),
  .CONTROL(0),
  .TARGET(1)
) u4_rpi2_q0q1 (
  .re_i(u3_sv_re),
  .im_i(u3_sv_im),
  .re_o(u4_re),
  .im_o(u4_im)
);

quantum_state_vector # (
  .QUBITS(3)
) u4_state_vector (
  .clk_i      (clk_i),
  .rst_ni     (rst_ni),
  .wr_en_i    (1'b1),
  
  .re_i (u4_re),
  .im_i (u4_im),
  .re_o (u4_sv_re),
  .im_o (u4_sv_im)
);

hadamard_gate #(
  .QUBITS(3),
  .BITMASK(1)
) u5_h_q0 (
  .re_i(u4_sv_re),
  .im_i(u4_sv_im),
  
  .re_o(u5_re),
  .im_o(u5_im)
);

quantum_state_vector # (
  .QUBITS(3)
) u5_state_vector (
  .clk_i      (clk_i),
  .rst_ni     (rst_ni),
  .wr_en_i    (1'b1),
  
  .re_i (u5_re),
  .im_i (u5_im),
  .re_o (u5_sv_re),
  .im_o (u5_sv_im)
);

swap_gate #(
  .QUBITS(3),
  .SWAP(1)
) u6_swap_q2q0 (
  .re_i(u5_sv_re),
  .im_i(u5_sv_im),
  
  .re_o(u6_re),
  .im_o(u6_im)
);

quantum_state_vector # (
  .QUBITS(3)
) u6_state_vector (
  .clk_i      (clk_i),
  .rst_ni     (rst_ni),
  .wr_en_i    (1'b1),
  
  .re_i (u6_re),
  .im_i (u6_im),
  .re_o (u6_sv_re),
  .im_o (u6_sv_im)
);


probability #(
  .QUBITS(3)
) prob_sv (
  .clk_i(clk_i),
  .rst_ni(rst_ni),
  .wr_en_i(1'b1),
  .re_i(u6_sv_re),
  .im_i(u6_sv_im),
  .prob_o(prob_reg)
);

probability_weights #(
  .QUBITS(3)
) prob_weights_sv (
  .clk_i(clk_i),
  .rst_ni(rst_ni),
  .wr_en_i(1'b1),
  .prob_i(prob_reg),
  .prob_weight_o(prob_weight_reg)
);

lfsr rng_gen (
  .clk_i(clk_i),
  .rst_ni(rst_ni),
  .pseudo_rng_o(pseudo_rng)
);

measure #(
  .QUBITS(3)
) measure_sv (
  .clk_i(clk_i),
  .rst_ni(rst_ni),
  .measure_i(1'b1),
  .prob_windows_i(prob_weight_reg),
  .pseudo_rng_i({2'b00,pseudo_rng[13:0]}),
  .cbits_o(cbits)
);

endmodule
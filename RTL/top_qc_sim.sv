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
  input        clk_i,
  input        rst_ni

);

localparam STATES = 2**QUBITS;

//Signal Declarations
logic [15:0] init_sv_re [0:STATES-1];
logic [15:0] init_sv_im [0:STATES-1];

logic [15:0] u0_re [0:STATES-1];
logic [15:0] u0_im [0:STATES-1];

logic [15:0] u0_sv_re [0:STATES-1];
logic [15:0] u0_sv_im [0:STATES-1];

//General Signals

logic [15:0] pseudo_rng;

logic [15:0] prob_reg [0:STATES-1];

logic [QUBITS-1:0] cbits;

initial begin
  $readmemh("../TB/sv_re_init.hex", init_sv_re);
  $readmemh("../TB/sv_im_init.hex", init_sv_im);
end

x_gate #(
  .QUBITS(3)
) u0_x (
  .bitmask_i(3'b000),
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

lfsr rng_gen (
  .clk_i(clk_i),
  .rst_ni(rst_ni),
  .pseudo_rng_o(pseudo_rng)
);

probability #(
  .QUBITS(3)
) prob_sv (
  .re_i(u0_sv_re),
  .im_i(u0_sv_im),
  
  .prob_o(prob_reg)
);


measure #(
  .QUBITS(3)
) measure_sv (
  .clk_i(clk_i),
  .rst_ni(rst_ni),
  
  .prob_i(prob_reg),
  .pseudo_rng_i({1'b0,pseudo_rng[14:0]}),
  
  .measure_i(1'b1),
  
  .cbits_o(cbits)
);

endmodule
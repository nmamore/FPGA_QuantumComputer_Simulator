/*
* @file top_qc_sim.sv 
* @brief Top level of quantum computer simulator
* @author Nicholas Amore namore7@gmail.com
* @date Creater 1/10/2026
*/

`timescale 1ns/1ps

module top_qc_sim #(
  parameter QUBITS = 3 //Sets number of qubits
)(
  input clk_i,
  input rst_ni,
  input measure_ni,
  
  input uart_rx_i,
  output uart_tx_o,
  
  output [7:0] hex_0_o

);

localparam DATA_WIDTH = 32;
localparam ADDR_WIDTH = 32;

localparam STATES = 2**QUBITS;

//Signal routing between modules
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

logic sync_measure_n;
logic sync_rst_n;
logic rst_n;

logic signed [15:0] pseudo_rng;

logic signed [15:0] prob_reg [0:STATES-1];
logic signed [15:0] prob_weight_reg [0:STATES-1];

logic [QUBITS-1:0] cbits;

logic measure;

logic tx_start;
logic data_valid;
logic tx_busy;
logic [7:0] uart_rx_reg;
logic [7:0] uart_tx_reg;

logic [ADDR_WIDTH-1:0] araddr;
logic arvalid;
logic arready;

logic [DATA_WIDTH-1:0] rdata;
logic rvalid;
logic rready;

logic [ADDR_WIDTH-1:0] awaddr;
logic awvalid;
logic awready;

logic [DATA_WIDTH-1:0] wdata;
logic wready;
logic wvalid;

logic [DATA_WIDTH-1:0] control_reg;
logic [DATA_WIDTH-1:0] result_reg;

assign rst_n = sync_rst_n & !control_reg[0];
assign measure = !sync_measure_n | control_reg[1];
assign result_reg = {29'h0, cbits};

//Intializes state vectors with data to perform QFT
initial begin
  $readmemh("../TB/sv_re_init.hex", init_sv_re);
  $readmemh("../TB/sv_im_init.hex", init_sv_im);
end

uart #(
  .CLK_FREQ(50000000),
  .BAUD(1000000)
) pc_if (
  .clk_i(clk_i),
  .rst_ni(rst_n),
  .uart_rx_i(uart_rx_i),
  .uart_tx_o(uart_tx_o),

  .uart_tx_reg_i(uart_tx_reg),
  .uart_rx_reg_o(uart_rx_reg),

  .tx_start_i(tx_start),
  .tx_busy_o(tx_busy), //Transmit in progress
  .data_valid_o(data_valid) //Indicate data in RX register
);

axi_lite_uart_if #(
  .DATA_WIDTH(DATA_WIDTH),
  .ADDR_WIDTH(ADDR_WIDTH)
) axi_uart_if (
  
  .aclk_i(clk_i),
  .arst_ni(rst_n),
  
  .araddr_o(araddr),
  
  .arvalid_o(arvalid),
  .arready_i(arready),
  
  .rdata_i(rdata),
  
  .rvalid_i(rvalid),
  .rready_o(rready),
  
  .awaddr_o(awaddr),
  
  .awvalid_o(awvalid),
  .awready_i(awready),
  
  
  .wdata_o(wdata),
  
  .wready_i(wready),
  .wvalid_o(wvalid),

  .uart_tx_reg_o(uart_tx_reg),
  .uart_rx_reg_i(uart_rx_reg),
  
  .tx_start_o(tx_start),
  .tx_busy_i(tx_busy),
  .data_valid_i(data_valid)
);

axi_lite_register #(
  .DATA_WIDTH(DATA_WIDTH),
  .ADDR_WIDTH(ADDR_WIDTH)
) axi_reg_if (
  
  .aclk_i(clk_i),
  .arst_ni(rst_n),

  .araddr_i(araddr),

  .arvalid_i(arvalid),
  .arready_o(arready),

  .rdata_o(rdata),

  .rvalid_o(rvalid),
  .rready_i(rready),

  .awaddr_i(awaddr),

  .awvalid_i(awvalid),
  .awready_o(awready),

  .wdata_i(wdata),

  .wready_o(wready),
  .wvalid_i(wvalid),
  .control_reg_o(control_reg),
  .result_reg_i(result_reg)
);

//Hadamard on q2
hadamard_gate #(
  .QUBITS(3),
  .BITMASK(4),
  .GATES(1)
) u0_h_q2 (
  .re_i(init_sv_re),
  .im_i(init_sv_im),
  
  .re_o(u0_re),
  .im_o(u0_im)
);

//Intermediate storage
quantum_state_vector # (
  .QUBITS(3)
) u0_state_vector (
  .clk_i      (clk_i),
  .rst_ni     (rst_n),
  .wr_en_i    (1'b1),
  
  .re_i (u0_re),
  .im_i (u0_im),
  .re_o (u0_sv_re),
  .im_o (u0_sv_im)
);

//Q1 control rotation of pi/2 on q2
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

//Intermediate storage
quantum_state_vector # (
  .QUBITS(3)
) u1_state_vector (
  .clk_i      (clk_i),
  .rst_ni     (rst_n),
  .wr_en_i    (1'b1),
  
  .re_i (u1_re),
  .im_i (u1_im),
  .re_o (u1_sv_re),
  .im_o (u1_sv_im)
);

//Q0 control rotation of pi/4 on q2
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

//Intermediate storage
quantum_state_vector # (
  .QUBITS(3)
) u2_state_vector (
  .clk_i      (clk_i),
  .rst_ni     (rst_n),
  .wr_en_i    (1'b1),
  
  .re_i (u2_re),
  .im_i (u2_im),
  .re_o (u2_sv_re),
  .im_o (u2_sv_im)
);

//Hadamard on q1
hadamard_gate #(
  .QUBITS(3),
  .BITMASK(2),
  .GATES(1)
) u3_h_q1 (
  .re_i(u2_sv_re),
  .im_i(u2_sv_im),
  
  .re_o(u3_re),
  .im_o(u3_im)
);

//Intermediate storage
quantum_state_vector # (
  .QUBITS(3)
) u3_state_vector (
  .clk_i      (clk_i),
  .rst_ni     (rst_n),
  .wr_en_i    (1'b1),
  
  .re_i (u3_re),
  .im_i (u3_im),
  .re_o (u3_sv_re),
  .im_o (u3_sv_im)
);

//Q0 control rotation of pi/2 on q1
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

//Intermediate storage
quantum_state_vector # (
  .QUBITS(3)
) u4_state_vector (
  .clk_i      (clk_i),
  .rst_ni     (rst_n),
  .wr_en_i    (1'b1),
  
  .re_i (u4_re),
  .im_i (u4_im),
  .re_o (u4_sv_re),
  .im_o (u4_sv_im)
);

//Hadamard on q0
hadamard_gate #(
  .QUBITS(3),
  .BITMASK(1),
  .GATES(1)
) u5_h_q0 (
  .re_i(u4_sv_re),
  .im_i(u4_sv_im),
  
  .re_o(u5_re),
  .im_o(u5_im)
);

//Intermediate storage
quantum_state_vector # (
  .QUBITS(3)
) u5_state_vector (
  .clk_i      (clk_i),
  .rst_ni     (rst_n),
  .wr_en_i    (1'b1),
  
  .re_i (u5_re),
  .im_i (u5_im),
  .re_o (u5_sv_re),
  .im_o (u5_sv_im)
);

//Swap q2 and q0
swap_gate #(
  .QUBITS(3),
  .SWAP(1)
) u6_swap_q2q0 (
  .re_i(u5_sv_re),
  .im_i(u5_sv_im),
  
  .re_o(u6_re),
  .im_o(u6_im)
);

//Intermediate storage
quantum_state_vector # (
  .QUBITS(3)
) u6_state_vector (
  .clk_i      (clk_i),
  .rst_ni     (rst_n),
  .wr_en_i    (1'b1),
  
  .re_i (u6_re),
  .im_i (u6_im),
  .re_o (u6_sv_re),
  .im_o (u6_sv_im)
);

//Generate probabilities from SV amplitudes
probability #(
  .QUBITS(3)
) prob_sv (
  .clk_i(clk_i),
  .rst_ni(rst_n),
  .wr_en_i(1'b1),
  .re_i(u6_sv_re),
  .im_i(u6_sv_im),
  .prob_o(prob_reg)
);

//Create CDF from probabilites
probability_weights #(
  .QUBITS(3)
) prob_weights_sv (
  .clk_i(clk_i),
  .rst_ni(rst_n),
  .wr_en_i(1'b1),
  .prob_i(prob_reg),
  .prob_weight_o(prob_weight_reg)
);

//Generate random number
lfsr rng_gen (
  .clk_i(clk_i),
  .rst_ni(rst_n),
  .pseudo_rng_o(pseudo_rng)
);

//Measure state vector
//Keys off on button press
measure #(
  .QUBITS(3)
) measure_sv (
  .clk_i(clk_i),
  .rst_ni(rst_n),
  .measure_i(measure),
  .prob_windows_i(prob_weight_reg),
  .pseudo_rng_i({2'b00,pseudo_rng[13:0]}), //remove sign and integer bit to match format of probabilities
  .cbits_o(cbits)
);


//Synchronize async inputs
sync rst_sync (
  .clk_i  (clk_i),
  .async_i(rst_ni),
  .sync_o (sync_rst_n)
);

//Synchronize async inputs
sync clk_btn_sync (
  .clk_i  (clk_i),
  .async_i(measure_ni),
  .sync_o (sync_measure_n)
);

//Output result to sev seg display
sev_seg_display hex0 (
  .dat_i      ({1'b0, cbits}),
  .seven_seg_o(hex_0_o)
);

endmodule
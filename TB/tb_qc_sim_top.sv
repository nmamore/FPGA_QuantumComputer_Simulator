/*
* @file tb_qc_sim_top.sv 
* @brief Top level of Quantum Computer Simulator test bench
* @author Nicholas Amore namore7@gmail.com
* @date Creater 2/15/2026
*/

`timescale 1ns/1ps

module tb_qc_sim_top ();

localparam FPGA_CLK_SPEED = 20;

logic fpga_clk;
logic fpga_rst_n;
logic fpga_measure_n;
logic [7:0] hex_0;

top_qc_sim uut (
  .clk_i(fpga_clk),
  .rst_ni(fpga_rst_n),
  .measure_ni(fpga_measure_n),
  
  .hex_0_o(hex_0)
  
);

initial begin
  fpga_rst_n = 1'b0;
  fpga_measure_n = 1'b1;
  #200;
  fpga_rst_n = 1'b1;
end

initial begin
  forever begin
    fpga_clk = 1'b1;
    #FPGA_CLK_SPEED;
    fpga_clk = 1'b0;
    #FPGA_CLK_SPEED;
  end
end

initial begin
  #10200;
  fpga_measure_n = 1'b0;
  #1000;
  fpga_measure_n = 1'b1;
  #10200;
  $stop;
end

endmodule
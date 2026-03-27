/*
* @file tb_qc_sim_top.sv 
* @brief Top level of Quantum Computer Simulator test bench
* @author Nicholas Amore namore7@gmail.com
* @date Creater 2/15/2026
*/

`timescale 1ns/1ps

module tb_qc_sim_top ();

//50MHz clock
//20ns period, 10ns high, 10ns low
localparam FPGA_CLK_SPEED = 10;

//115200 Baud, 8.68us
localparam BAUD_RATE = 8680;

//General signals
logic fpga_clk;
logic fpga_rst_n;
logic fpga_measure_n;

logic pc_tx;
logic pc_rx;

logic [7:0] hex_0;

//Instatiate UUT
top_qc_sim uut (
  .clk_i(fpga_clk),
  .rst_ni(fpga_rst_n),
  .measure_ni(fpga_measure_n),
  
  .uart_rx_i(pc_tx),
  .uart_tx_o(pc_rx),
  
  .hex_0_o(hex_0)
  
);

//Reset device and don't measure
initial begin
  fpga_rst_n = 1'b0;
  fpga_measure_n = 1'b1;
  pc_tx = 1'b1;
  #200;
  fpga_rst_n = 1'b1;
end


//Clock 
initial begin
  forever begin
    fpga_clk = 1'b1;
    #FPGA_CLK_SPEED;
    fpga_clk = 1'b0;
    #FPGA_CLK_SPEED;
  end
end


initial begin
  #10200; //Wait enough time to allow outputs to be ready for measure
  fpga_measure_n = 1'b0;
  #1000; //Measure for a time
  fpga_measure_n = 1'b1;
  #10200; //Wait again
  
  pc_tx = 1'b0;
  #BAUD_RATE;
  pc_tx = 1'b1;
  #BAUD_RATE;
  pc_tx = 1'b0;
  #BAUD_RATE;
  pc_tx = 1'b0;
  #BAUD_RATE;
  pc_tx = 1'b1;
  #BAUD_RATE;
  pc_tx = 1'b0;
  #BAUD_RATE;
  pc_tx = 1'b1;
  #BAUD_RATE;
  pc_tx = 1'b1;
  #BAUD_RATE;
  pc_tx = 1'b0;
  #BAUD_RATE;
  pc_tx = 1'b1;
  #BAUD_RATE;
  
  #BAUD_RATE;
  #BAUD_RATE;
  #BAUD_RATE;
  #BAUD_RATE;
  #BAUD_RATE;
  #BAUD_RATE;
  #BAUD_RATE;
  #BAUD_RATE;
  #BAUD_RATE;
  #BAUD_RATE;
  
  $stop;
end

endmodule
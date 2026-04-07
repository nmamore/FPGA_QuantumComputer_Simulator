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

//1MBaud, 1us
localparam BAUD_RATE = 1000;

localparam int CMD_READ = 153;
localparam int CMD_WRITE = 102;

//General signals
logic fpga_clk;
logic fpga_rst_n;
logic fpga_measure_n;

logic pc_tx_uut_rx;
logic pc_rx_uut_tx;

logic [7:0] hex_0;

//Instatiate UUT
top_qc_sim uut (
  .clk_i(fpga_clk),
  .rst_ni(fpga_rst_n),
  .measure_ni(fpga_measure_n),
  
  .uart_rx_i(pc_tx_uut_rx),
  .uart_tx_o(pc_rx_uut_tx),
  
  .hex_0_o(hex_0)
  
);

//Reset device and don't measure
initial begin
  fpga_rst_n = 1'b0;
  fpga_measure_n = 1'b1;
  pc_tx_uut_rx = 1'b1;
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
  uart_read(32'h0000);
  #200000;
  $stop;
end

task uart_write (input [31:0] addr_reg, input [31:0] data_reg);
  uart_tx(CMD_WRITE);
  uart_tx(addr_reg[7:0]);
  uart_tx(addr_reg[15:8]);
  uart_tx(addr_reg[23:16]);
  uart_tx(addr_reg[31:24]);
  uart_tx(data_reg[7:0]);
  uart_tx(data_reg[15:8]);
  uart_tx(data_reg[23:16]);
  uart_tx(data_reg[31:24]);
endtask

task uart_read (input [31:0] addr_reg);
  uart_tx(CMD_READ);
  uart_tx(addr_reg[7:0]);
  uart_tx(addr_reg[15:8]);
  uart_tx(addr_reg[23:16]);
  uart_tx(addr_reg[31:24]);
endtask

task uart_tx (input [7:0] tx_reg);
  pc_tx_uut_rx = 1'b0;
  #BAUD_RATE;
  for (int i = 0; i < 8; i++) begin
    pc_tx_uut_rx = tx_reg[i];
    #BAUD_RATE;
  end
  pc_tx_uut_rx = 1'b1;
  #100;
endtask

endmodule
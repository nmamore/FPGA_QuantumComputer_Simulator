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
localparam int CMD_STREAM = 165;
localparam int CMD_STOP = 90;

//General signals
logic fpga_clk;
logic fpga_rst_n;
logic fpga_measure_n;

logic pc_tx_uut_rx;
logic pc_rx_uut_tx;

logic [7:0] temp_uart_rx_reg;
logic [31:0] data_uart_rx_reg;

logic start;
logic stable;

logic [7:0] hex_0;

//Instatiate UUT
top_qc_sim uut (
  .clk_i(fpga_clk),
  .rst_ni(fpga_rst_n),
  .measure_ni(fpga_measure_n),
  
  .uart_rx_i(pc_tx_uut_rx),
  .uart_tx_o(pc_rx_uut_tx),
  
  .start_o(start),
  .stable_o(stable),
  
  .hex_0_o(hex_0)
  
);

//Reset device and don't measure
initial begin
  fpga_rst_n = 1'b0;
  fpga_measure_n = 1'b1;
  pc_tx_uut_rx = 1'b1;
  temp_uart_rx_reg = 'h0;
  data_uart_rx_reg = 'h0;
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

//UART RX channel
initial begin
  forever begin
    //Loop for 4 bytes
    for (int i = 0; i < 4; i++) begin
      @(negedge pc_rx_uut_tx); //Wait for start
      #(BAUD_RATE/2); //Sample at center of baud
      for (int j = 0; j < 8; j++) begin //Grab data every bit clock
        #BAUD_RATE;
        temp_uart_rx_reg[j] = pc_rx_uut_tx;
      end
      #BAUD_RATE;
      data_uart_rx_reg[i*8 +: 8] = temp_uart_rx_reg; //Append to 32 bit data
    end
  end
end


initial begin
  #10200; //Wait enough time to allow outputs to be ready for measure
  fpga_measure_n = 1'b0;
  #1000; //Measure for a time
  fpga_measure_n = 1'b1;
  #10200; //Wait again
  uart_write(32'h00000008, 32'h00000004); //Load initial state vector
  #200000;
  uart_read(32'h00000000); //Read rev register
  #200000;
  uart_write(32'h00000000, 32'h43211234); //Write to rev register
  #200000;
  uart_read(32'h00000000); //Confirm register wasn't overwritten
  #200000;
  uart_read(32'h00000004); //Check reset status
  #200000;
  uart_write(32'h00000004, 32'hFFFFFFFE); //Clear reset status
  #200000;
  uart_read(32'h00000004); //Check reset status is cleared
  #200000;
  uart_write(32'h00000008, 32'h00000001); //Reset FPGA
  #200000;
  uart_read(32'h00000004); //Check reset status
  #200000;
  uart_write(32'h00000008, 32'h00000004); //Load initial state vector
  #200000;
  uart_write(32'h00000008, 32'h00000002); //Send measure command
  #200000;
  uart_read(32'h00000008); //Check values in control register
  #200000;
  uart_read(32'h0000000C); //Check result register
  #200000;
  uart_read(32'h0000000C);
  #200000;
  uart_read(32'h0000000C);
  #200000;
  uart_write(32'h00000008, 32'h00000000); //Stop measuring
  #200000;
  uart_read(32'h00000008); //Check control is off
  #200000;
  uart_stream(); //Begin streaming data
  #2000000;
  uart_stop(); //Stop streaming data
  #2000000;
  $stop;
end

//Implement PC reg write over UART
task uart_write (input [31:0] addr_reg, input [31:0] data_reg);
  uart_tx(CMD_WRITE); //Write command
  uart_tx(addr_reg[7:0]); //Output register and data starting with LSB
  uart_tx(addr_reg[15:8]);
  uart_tx(addr_reg[23:16]);
  uart_tx(addr_reg[31:24]);
  uart_tx(data_reg[7:0]);
  uart_tx(data_reg[15:8]);
  uart_tx(data_reg[23:16]);
  uart_tx(data_reg[31:24]);
endtask

//Implement PC reg read over UART
task uart_read (input [31:0] addr_reg);
  uart_tx(CMD_READ); //Read command
  uart_tx(addr_reg[7:0]); //Output register starting with LSB
  uart_tx(addr_reg[15:8]);
  uart_tx(addr_reg[23:16]);
  uart_tx(addr_reg[31:24]);
endtask

//Stream data to PC over UART
task uart_stream ();
  uart_tx(CMD_STREAM); //Send stream command
endtask

//Stop stream data
task uart_stop ();
  uart_tx(CMD_STOP); //Stop streaming data
endtask

//Transmit logic for UART
task uart_tx (input [7:0] tx_reg);
  pc_tx_uut_rx = 1'b0; //Start bit
  for (int i = 0; i < 8; i++) begin
    #BAUD_RATE;
    pc_tx_uut_rx = tx_reg[i]; //Send shifted logic
  end
  #BAUD_RATE;
  pc_tx_uut_rx = 1'b1; //Stop bit
  #100;
endtask

endmodule
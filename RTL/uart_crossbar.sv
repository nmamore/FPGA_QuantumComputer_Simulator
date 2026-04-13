/*
* @file uart_crossbar.sv
* @brief Switches UART between AXI-Lite and data stream
* @author Nicholas Amore namore7@gmail.com
* @date Created 4/12/2026
*/


module uart_crossbar #(
  parameter int DATA_WIDTH = 32,
  parameter int ADDR_WIDTH = 32

) (
  
  //General signals
  input logic clk_i,
  input logic rst_ni,
  
  //UART Registers
  output logic [DATA_WIDTH-1:0] uart_tx_reg_o,
  
  input logic [7:0]            uart_rx_cmd_i,
  input logic [ADDR_WIDTH-1:0] uart_rx_reg_i,
  input logic [DATA_WIDTH-1:0] uart_rx_data_i,
  
  input logic  reg_ready_i,
  output logic tx_ready_o,
  input logic  tx_done_i,
  
  
  //AXI Lite Signals
  input logic [DATA_WIDTH-1:0]  lite_uart_tx_reg_i,
  
  output logic [7:0]            lite_uart_rx_cmd_o,
  output logic [ADDR_WIDTH-1:0] lite_uart_rx_reg_o,
  output logic [DATA_WIDTH-1:0] lite_uart_rx_data_o, 
  
  output lite_reg_ready_o,
  input  lite_tx_ready_i,
  output lite_tx_done_o,
  
  //Stream Signals
  input logic [DATA_WIDTH-1:0]  stream_uart_tx_reg_i,
  
  output logic [7:0]            stream_uart_rx_cmd_o,
  
  input  stream_tx_ready_i,
  output stream_tx_done_o
);

localparam int ADDR_BYTE  = ADDR_WIDTH/8;
localparam int ADDR_COUNT_BIT = $clog2(ADDR_BYTE);

localparam int DATA_BYTE  = DATA_WIDTH/8;
localparam int DATA_COUNT_BIT = $clog2(DATA_BYTE);


localparam int CMD_READ = 153;
localparam int CMD_WRITE = 102;
localparam int CMD_STREAM = 165;
localparam int CMD_STOP = 90;

always_comb begin
  //Clear signals not used
  stream_uart_rx_cmd_o = 'h0;
  
  stream_tx_busy_o  = 1'b0;
  
  lite_uart_rx_cmd_o = 'h0;
  lite_uart_rx_reg_o = 'h0;
  lite_uart_rx_data_o = 'h0;
  
  lite_reg_ready_o = 1'b0;
  lite_tx_busy_o  = 1'b0;

  unique case (uart_rx_cmd_i)
    //Connect stream signals to data port
    CMD_STREAM: begin
      uart_tx_reg_o = stream_uart_tx_reg_i;
      
      stream_uart_rx_cmd_o = uart_rx_cmd_i;
      
      tx_ready_o = stream_tx_ready_i;
      stream_tx_busy_o = tx_busy_i;
    end
    //Connect lite signals to data port
    CMD_STOP: begin
      uart_tx_reg_o = lite_uart_tx_reg_i;
      
      lite_uart_rx_cmd_o = uart_rx_cmd_i;
      lite_uart_rx_reg_o = uart_rx_reg_i;
      lite_uart_rx_data_o = uart_rx_data_i;
      
      lite_reg_ready_o = reg_ready_i;
      tx_ready_o = lite_tx_ready_i;
      lite_tx_busy_o = tx_busy_i;
    end
    //Set any other command to lite signals
    default: begin
      uart_tx_reg_o = lite_uart_tx_reg_i;
      
      lite_uart_rx_cmd_o = uart_rx_cmd_i;
      lite_uart_rx_reg_o = uart_rx_reg_i;
      lite_uart_rx_data_o = uart_rx_data_i;
      
      lite_reg_ready_o = reg_ready_i;
      tx_ready_o = lite_tx_ready_i;
      lite_tx_busy_o = tx_busy_i;
    end
  endcase
end


endmodule
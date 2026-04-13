/*
* @file uart_if.sv
* @brief Wrapper for UART module to package bytes recieved and transmitted
* @author Nicholas Amore namore7@gmail.com
* @date Created 3/28/2026
*/


module uart_if #(
  parameter int DATA_WIDTH = 32,
  parameter int ADDR_WIDTH = 32,
  parameter int CLK_FREQ = 50000000,
  parameter int BAUD = 1000000
  

) (
  
  //General signals
  input logic clk_i,
  input logic rst_ni,
  
  //Register signals
  input logic  [DATA_WIDTH-1:0] uart_tx_reg_i,
  
  output logic [7:0]            uart_rx_cmd_o,
  output logic [ADDR_WIDTH-1:0] uart_rx_reg_o,
  output logic [DATA_WIDTH-1:0] uart_rx_data_o,
  
  //UART signals
  input logic  uart_rx_i,
  output logic uart_tx_o,
  
  //Flag signals
  output logic reg_ready_o,
  
  input  tx_ready_i,
  output tx_done_o,
);

logic [7:0] uart_tx_reg;
logic [7:0] uart_rx_reg;

uart #(
  .CLK_FREQ(CLK_FREQ), //System clock frequency
  .BAUD(BAUD)       //UART Bit Rate

) pc_uart (
  .clk_i(clk_i),
  .rst_ni(rst_ni),
  
  .uart_rx_i(uart_rx_i), //Serial UART
  .uart_tx_o(uart_tx_o),
  
  .uart_tx_reg_i(uart_tx_reg), //Registers for shift UART data
  .uart_rx_reg_o(uart_rx_reg),
  
  .tx_start_i(tx_start), //Initiate data transmit
  .tx_busy_o(tx_busy), //Transmit in progress
  .data_valid_o(data_valid) //Indicate data in RX register
  
);

localparam int ADDR_BYTE  = ADDR_WIDTH/8;
localparam int ADDR_COUNT_BIT = $clog2(ADDR_BYTE);

localparam int DATA_BYTE  = DATA_WIDTH/8;
localparam int DATA_COUNT_BIT = $clog2(DATA_BYTE);


localparam int CMD_READ = 153;
localparam int CMD_WRITE = 102;
localparam int CMD_STREAM = 165;
localparam int CMD_STOP = 90;

//UART signals

logic [7:0] uart_rx_reg;
logic [7:0] uart_tx_reg;

logic [DATA_WIDTH-1:0] uart_tx_reg_d;
logic [DATA_WIDTH-1:0] uart_tx_reg_q;

logic [7:0] uart_rx_cmd_q;

logic [ADDR_WIDTH-1:0] uart_rx_reg_q;

logic [DATA_WIDTH-1:0] uart_rx_data_q;

logic [ADDR_COUNT_BIT-1:0] addr_byte_cnt_d;
logic [ADDR_COUNT_BIT-1:0] addr_byte_cnt_q;

logic [DATA_COUNT_BIT:0] rx_data_byte_cnt_d;
logic [DATA_COUNT_BIT:0] rx_data_byte_cnt_q;

logic [DATA_COUNT_BIT:0] tx_data_byte_cnt_d;
logic [DATA_COUNT_BIT:0] tx_data_byte_cnt_q;

logic tx_start;
logic tx_busy;
logic data_valid;

//Assignments

assign tx_busy_o = tx_busy;

// Define the states
typedef enum {
  StRxIdle, StRxRegAddress, StRxData
} uartrxaxi_state_e;

uartrx_state_e uartrx_state_d, uartrx_state_q;

// Define the states
typedef enum {
  StTxIdle, StTxUart
} uarttx_state_e;

uarttx_state_e uarttx_state_d, uarttx_state_q;

// Combinational decode of the state
always_comb begin
  uartrx_state_d = uartrx_state_q;
  
  uart_rx_cmd_o = uart_rx_cmd_q;
  uart_rx_reg_o = uart_rx_reg_q;
  uart_rx_data_o = uart_rx_data_q;
  
  addr_byte_cnt_d = addr_byte_cnt_q;
  rx_data_byte_cnt_d = rx_data_byte_cnt_q;
  
  reg_ready_o = 1'b0;
  unique case (uartrx_state_q)
    // StRxIdle: Wait for UART transaction
    StRxIdle: begin
      if (data_valid) begin //Wait for data valid
        uartrx_state_d = StRxRegAddress;
        uart_rx_cmd_o = uart_rx_reg; //Output command register immediately
        reg_ready_o = 1'b1; //Flag reg is ready
      end
    end
    //StRxRegAddress: Recieve register address
    StRxRegAddress: begin
      //If command is stream or stop, no further bytes to be recieved
      if ((uart_rx_cmd_q == CMD_STREAM) || (uart_rx_cmd_q == CMD_STOP)) begin
        uartrx_state_d = StRxIdle;
        reg_ready_o = 1'b0;
      //Collect register bytes
      end else if (data_valid) begin
        uart_rx_reg_o[addr_byte_cnt_q*8 +: 8] = uart_rx_reg; //Store bytes
        addr_byte_cnt_d = addr_byte_cnt_q + 1'b1; //Increment byte counter
        if (addr_byte_cnt_q == (ADDR_BYTE-1)) begin //Move to next state after all bytes recieved
          uartrx_state_d = StRxData;
          addr_byte_cnt_d = 'h0;
          reg_ready_o = 1'b1;
        end else begin
          reg_ready_o = 1'b0;
        end
      end
    end
    //StRxData: Collect data bytes
    StRxData: begin
      //If command is read, no further bytes to be recieved
      if (cmd_reg_q == CMD_READ)
        uartrx_state_d = StRxIdle;
        reg_ready_o = 1'b0;
      //Collect data bytes
      end else if (data_valid) begin
        uart_rx_data_o[data_byte_cnt_q*8 +: 8] = uart_rx_reg; //Stores bytes
        rx_data_byte_cnt_d = rx_data_byte_cnt_q + 1'b1; //Increment byte counter
        if (addr_byte_cnt_q == (DATA_BYTE-1)) begin //Go back to idle after all bytes recieved
          uartrx_state_d = StRxIdle;
          data_byte_cnt_d = 'h0;
          reg_ready_o = 1'b1;
        end else begin
          reg_ready_o = 1'b0;
        end
      end
    end
    default: uart_rx_data_d = StRxIdle;
  endcase
end

// Register the state and clock in updated signals
always_ff @(posedge clk_i or negedge rst_ni) begin
  if (!rst_ni) begin
    uartrx_state_q <= StRxIdle;
    
    uart_rx_cmd_q <= 'h0;
    uart_rx_data_q <= 'h0;
    uart_rx_data_d <= 'h0;
    
    addr_byte_cnt_q <= 'h0;
    rx_data_byte_cnt_q <= 'h0;
  end else begin
    uartrx_state_q <= uartrx_state_d;
    
    uart_rx_cmd_q <= uart_rx_cmd_o;
    uart_rx_reg_q <= uart_rx_reg_o;
    uart_rx_data_q <= uart_rx_data_o;
    
    addr_byte_cnt_q <= addr_byte_cnt_d;
    rx_data_byte_cnt_q <= rx_data_byte_cnt_d;
  end
end

always_comb begin
  uarttx_state_d = uarttx_state_q;
  uart_tx_reg_d = uart_tx_reg_q;
  tx_data_byte_cnt_d = tx_data_byte_cnt_q;
  tx_done_o = 1'b0;
  tx_start = 1'b0;
  unique case (uarttx_state_q)
    //StTxIdle: Wait until data is ready to be transmit
    StTxIdle: begin
      //Grab transmit data when ready
      if (tx_ready_i) begin
        uarttx_state_d = StTxUart;
        uart_tx_reg_d = uart_tx_reg_i;
      end
    end
    //StTxUart: Partition bytes for data transfer
    StTxUart: begin
      //Wait until TX is done to transmit data
      if (!tx_busy) begin
        uart_tx_reg = uart_tx_reg_d[tx_data_byte_cnt_q*8 +: 8]; //Send bytes out
        tx_data_byte_cnt_d = tx_data_byte_cnt_q + 1'b1; //Increment counter
        if (tx_data_byte_cnt_q == (DATA_BYTE-1)) begin
          uarttx_state_d = StTxIdle;
          tx_done_o = 1'b1;
          tx_start = 1'b0;
          tx_data_byte_cnt_d = 'h0;
        end else begin
          tx_start = 1'b1; //Start transmit
        end
      end
    end
    //Used to catch parasitic states
    default: uarttx_state_d = StTxIdle;
  endcase
end

// Register the state and clock in updated signals
always_ff @(posedge aclk_i or negedge arst_ni) begin
  if (!arst_ni) begin
    uarttx_state_d <= StTxIdle;
    
    uart_tx_reg_q <= 'h0;
    tx_data_byte_cnt_q <= 'h0;

  end else begin
    uartaxi_state_q <= uartaxi_state_d;
    
    uart_tx_reg_q <= uart_tx_reg_d;
    tx_data_byte_cnt_q <= tx_data_byte_cnt_d;
  end
end


endmodule
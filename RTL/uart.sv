/*
* @file uart.sv
* @brief Interfaces with external UART
* @author Nicholas Amore namore7@gmail.com
* @date Created 3/22/2026
*/

module uart #(
  parameter int  CLK_FREQ  = 50000000, //System clock frequency
  parameter int  BAUD      = 1000000    //UART Bit Rate

) (
  input logic  clk_i,
  input logic  rst_ni,
  
  input logic  uart_rx_i, //Serial UART
  output logic uart_tx_o,
  
  input logic  [7:0] uart_tx_reg_i, //Registers for shift UART data
  output logic [7:0] uart_rx_reg_o,
  
  input logic tx_start_i, //Initiate data transmit
  output logic tx_busy_o, //Transmit in progress
  output logic data_valid_o //Indicate data in RX register
  
);

localparam int CLK_RATE  = CLK_FREQ/BAUD;
localparam int COUNT_BIT = $clog2(CLK_RATE);

logic [2:0] rx_buf;

logic [COUNT_BIT-1:0] rx_tick_d;
logic [COUNT_BIT-1:0] rx_tick_q;

logic [2:0] rx_bit_cnt_d;
logic [2:0] rx_bit_cnt_q;

logic [7:0] rx_shift_d;
logic [7:0] rx_shift_q;

logic [COUNT_BIT-1:0] tx_tick_d;
logic [COUNT_BIT-1:0] tx_tick_q;

logic [2:0] tx_bit_cnt_d;
logic [2:0] tx_bit_cnt_q;

logic [7:0] tx_shift_d;
logic [7:0] tx_shift_q;

assign uart_rx_reg_o = rx_shift_q;

// Define the states
typedef enum {
  StRxIdle, StRxStart, StRxShift, StRxStop
} uartrx_state_e;

uartrx_state_e uartrx_state_d, uartrx_state_q;

// Define the states
typedef enum {
  StTxIdle, StTxStart, StTxShift, StTxStop
} uarttx_state_e;

uarttx_state_e uarttx_state_d, uarttx_state_q;


//Clock asynchronous data in
always_ff @(posedge clk_i or negedge rst_ni) begin
  if (!rst_ni) begin
    rx_buf <= 'h0;
  end else begin
    rx_buf <= {rx_buf[1:0], uart_rx_i};
  end
end

// Combinational decode of the state
always_comb begin
  uartrx_state_d = uartrx_state_q;
  rx_tick_d  = rx_tick_q;
  rx_bit_cnt_d  = rx_bit_cnt_q;
  rx_shift_d = rx_shift_q;
  data_valid_o = 1'b0;
  unique case (uartrx_state_q)
    // StIdle: Wait for start bit
    StRxIdle: begin
      rx_shift_d = 'h0;
      if (!rx_buf[2]) begin //Start bit recieved
        uartrx_state_d = StRxStart;
      end else begin
        uartrx_state_d = StRxIdle;
      end
    end
    //Check start bit
    StRxStart: begin
      if (rx_tick_q == (CLK_RATE-1)/2) begin //Wait for half the time to center sampling
        if (!rx_buf[2]) begin //Confirm bit is still low
          uartrx_state_d = StRxShift;
          rx_tick_d = 'h0; //Set tick counter
        end else begin
          uartrx_state_d = StRxIdle; //False start bit, set back to idle
          rx_tick_d = 'h0;
        end
      end else begin
        uartrx_state_d = StRxStart;
        rx_tick_d = rx_tick_q + 1'b1; //Count clock cycles until set bit rate is reached
      end
    end
    //Shift next serial bit in
    StRxShift: begin
      if (rx_tick_q == CLK_RATE-1) begin //Wait until bit clock trips
        rx_tick_d = 'h0; //Reset bit clock
        rx_shift_d = {rx_buf[2], rx_shift_q[7:1]}; //Shift in new LSB data
        if (rx_bit_cnt_q == 3'b111) begin //Wait until 8 bits are received
          uartrx_state_d = StRxStop;
          rx_bit_cnt_d = 1'b0; //Reset bit counter
        end else begin
          rx_bit_cnt_d = rx_bit_cnt_q + 1'b1; //Increment bit counter
        end
      end else begin
        uartrx_state_d = StRxShift;
        rx_shift_d = rx_shift_q;
        rx_bit_cnt_d = rx_bit_cnt_q;
        rx_tick_d = rx_tick_q + 1'b1; //Count clock cycles until set bit rate is reached
      end
    end
    //Wait for stop bit and set data valid
    StRxStop: begin
      if (rx_tick_q == (CLK_RATE-1)/2) begin //Wait for half the time to readjust stop
        if (rx_buf[2]) begin
          uartrx_state_d = StRxIdle; //Stop bit, go back to idle
          rx_tick_d = 'h0; //Reset counter
          data_valid_o = 1'b1; //Set data valid
        end else begin
          uartrx_state_d = StRxStop;
        end
      end else begin
        uartrx_state_d = StRxStop;
        rx_tick_d = rx_tick_q + 1'b1;
      end
    end
    //Used to catch parasitic states
    default: uartrx_state_d = StRxIdle;
  endcase
end

// Register the state and clock in updated signals
always_ff @(posedge clk_i or negedge rst_ni) begin
  if (!rst_ni) begin
    uartrx_state_q <= StRxIdle;
    rx_tick_q <= 'h0;
    rx_shift_q <= 'h0;
    rx_bit_cnt_q <= 'h0;
  end else begin
    uartrx_state_q <= uartrx_state_d;
    rx_tick_q <= rx_tick_d;
    rx_shift_q <= rx_shift_d;
    rx_bit_cnt_q <= rx_bit_cnt_d;
  end
end

always_comb begin
  uarttx_state_d = uarttx_state_q;
  tx_tick_d = tx_tick_q;
  tx_bit_cnt_d = tx_bit_cnt_q;
  tx_shift_d  = tx_shift_q;
  tx_busy_o = 1'b1;
  unique case (uarttx_state_q)
    StTxIdle: begin
      tx_busy_o = 1'b0;
      if (tx_start_i) begin
        uarttx_state_d = StTxStart;
        tx_shift_d = uart_tx_reg_i;
        uart_tx_o = 1'b0;
      end else begin
        tx_shift_d = 'h0;
        uart_tx_o = 1'b1;
      end
    end
    StTxStart: begin
      uart_tx_o = 1'b0;
      tx_busy_o = 1'b1;
      if (tx_tick_q == CLK_RATE - 1) begin
        uarttx_state_d = StTxShift;
        tx_tick_d = 'h0;
      end else begin
        tx_tick_d = tx_tick_q + 1'b1;
      end
    end
    StTxShift: begin
      uart_tx_o = tx_shift_q[0];
      if (tx_tick_q == CLK_RATE - 1) begin
        tx_tick_d = 'h0;
        tx_shift_d = {1'b0, tx_shift_q[7:1]};
        if (tx_bit_cnt_q == 3'b111) begin
          uarttx_state_d = StTxStop;
          tx_bit_cnt_d = 'h0;
        end else begin
          tx_bit_cnt_d = tx_bit_cnt_q + 1'b1;
        end
      end else begin
        tx_tick_d = tx_tick_q + 1'b1;
        tx_shift_d = tx_shift_q;
        tx_bit_cnt_d = tx_bit_cnt_q;
      end
    end
    StTxStop: begin
      uart_tx_o = 1'b1;
      if (tx_tick_q == CLK_RATE-1) begin
        uarttx_state_d = StTxIdle;
        tx_tick_d = 'h0;
      end else begin
        tx_tick_d = tx_tick_q + 1'b1;
      end
    end
    default: uarttx_state_d = StTxIdle;
  endcase
end

// Register the state and clock in updated signals
always_ff @(posedge clk_i or negedge rst_ni) begin
  if (!rst_ni) begin
    uarttx_state_q <= StTxIdle;
    tx_tick_q <= 'h0;
    tx_shift_q <= 'h0;
    tx_bit_cnt_q <= 'h0;
  end else begin
    uarttx_state_q <= uarttx_state_d;
    tx_tick_q <= tx_tick_d;
    tx_shift_q <= tx_shift_d;
    tx_bit_cnt_q <= tx_bit_cnt_d;
  end
end

endmodule
/*
* @file uart.sv
* @brief Interfaces with external UART
* @author Nicholas Amore namore7@gmail.com
* @date Created 3/22/2026
*/

module uart #(
  parameter int  CLK_FREQ  = 50000000, //System clock frequency
  parameter int  BAUD      = 115200,    //UART Bit Rate
  localparam int CLK_RATE  = CLK_FREQ/BAUD,
  localparam int COUNT_BIT = $clog2(CLK_RATE)

) (
  input logic  clk_i,
  input logic  rst_ni,
  
  input logic  uart_rx_i,
  output logic uart_tx_o
);

logic [2:0] rx_buf;
logic [3:0] bit_count;

logic [7:0] uart_rx_reg;

logic [COUNT_BIT-1:0] count;

logic start;

// Define the states
typedef enum {
  StRxIdle, StRxBitCount, StRxShift, StRxStop
} uartrx_state_e;

uartrx_state_e uartrx_state_d, uartrx_state_q;

// Combinational decode of the state
always_comb begin
  uartrx_state_d = uartrx_state_q;
  uart_rx_reg = 'h0;
  unique case (uartrx_state_q)
    // StIdle: Wait for start bit
    StRxIdle: begin
      if (rx_buf = 'h0) begin
        uartrx_state_d = StRxBitCount;
        start = 1'b1;
      end else begin
        uartrx_state_d = StRxIdle;
        start = 1'b0;
      end
    end
    // StRxBitCount: Reset accumulators
    StRxBitCount: begin
      if (next_bit = 1'b1) begin
        uartrx_state_d = StRxShift;
      end else begin
        uartrx_state_d = StRxBitCount;
      end
    end
    StRxShift: begin
      if (rx_buf = 3'b000 || rx_buf = 3'b111) begin
        uartrx_state_d = StRxBitCount;
        if (bit_count = 4'b0111) begin
          uartrx_state_d = StRxStop
        end
      end else begin
        uartrx_state_d = StRxShift;
      end
    end
    StRxStop: begin
      if (next_bit = 1'b1 && rx_buf = 3'b111) begin
        uartrx_state_d = StRxIdle;
      end else begin
        uartrx_state_d = StRxStop;
      end
    end
    //Used to catch parasitic states
    default: uartrx_state_d = StRxIdle;
  endcase
end

// Register the state
always_ff @(posedge clk or negedge rst_n) begin
  if (!rst_n) begin
    uartrx_state_q <= StRxIdle;
  end else begin
    uartrx_state_q <= uartrx_state_d;
  end
end

//Clock asynchronous data in
always_ff @(posedge clk or negedge rst_n) begin
  if (!rst_n) begin
    rx_buf <= 'h0;
  end else begin
    rx_buf <= {rx_buf[2:1], uart_rx_i};
  end
end

//Bit clock counter
always_ff @(posedge clk or negedge rst_n) begin
  if (!rst_n) begin
    clk_count <= 'h0;
    bit_count <= 'h0;
  end else if (start) begin
    if (count >= CLK_RATE) begin
      clk_count <= 'h0
      next_bit  <= 1'b1;
      bit_count <= bit_count + 1'b1;
      if (bit_count = 4'b1000) begin
        bit_count <= 'h0;
      end
    end else begin
      clk_count <= count + 1'b1;
      next_bit <= 1'b0;
    end
  end
end


endmodule
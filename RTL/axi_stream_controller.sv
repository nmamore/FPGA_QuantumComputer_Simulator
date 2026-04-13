/*
* @file axi_lite_uart_if.sv
* @brief Interface between internal AXI bus and external UART
* @author Nicholas Amore namore7@gmail.com
* @date Created 3/28/2026
*/


module axi_stream_controller #(
  parameter int DATA_WIDTH = 32,
  parameter int ADDR_WIDTH = 32

) (
  
  //General signals
  input logic  clk_i,
  input logic  rst_ni,
  
  input logic [DATA_WIDTH-1:0] result_reg_i,
  
  output logic [DATA_WIDTH-1:0]  stream_uart_tx_reg_o,
  
  input  logic [7:0]            stream_uart_rx_cmd_i,
  
  output stream_tx_ready_o,
  input  stream_tx_busy_i,
  
  output logic measure_o
);

localparam int ADDR_BYTE  = ADDR_WIDTH/8;
localparam int ADDR_COUNT_BIT = $clog2(ADDR_BYTE);

localparam int DATA_BYTE  = DATA_WIDTH/8;
localparam int DATA_COUNT_BIT = $clog2(DATA_BYTE);


localparam int CMD_READ = 153;
localparam int CMD_WRITE = 102;
localparam int CMD_STREAM = 165;
localparam int CMD_STOP = 90;

// Define the states
typedef enum {
  StIdle, StData
} stream_state_e;

stream_state_e stream_state_d, stream_state_q;

assign stream_uart_tx_reg_o = result_reg_i;

// Combinational decode of the state
always_comb begin
  stream_state_d = stream_state_q;
  measure_o = 1'b0;
  unique case (stream_state_q)
    //StIdle: Wait for stream to be initiated
    StIdle: begin
      if (stream_uart_rx_cmd_i == CMD_STREAM) begin
        stream_state_d = StData;
        stream_tx_ready_o = 1'bl; //Alert 
        measure_o = 1'b1;
      end else begin
        stream_tx_ready_o = 1'b0;
      end
    end
    StData: begin
      if (stream_tx_busy_i)
        stream_state_d = StIdle;
        stream_tx_ready_o = 1'b0;
      end else begin
        stream_tx_ready_o = 1'b1;
      end
    end
    //Used to catch parasitic states
    default: stream_state_d = StIdle;
  endcase
end

// Register the state and clock in updated signals
always_ff @(posedge clk_i or negedge rst_ni) begin
  if (!rst_ni) begin
    stream_state_q <= StIdle;
  end else begin
    stream_state_q <= stream_state_d;
  end
end


endmodule
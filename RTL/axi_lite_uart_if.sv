/*
* @file axi_lite_uart_if.sv
* @brief Interface between internal AXI bus and external UART
* @author Nicholas Amore namore7@gmail.com
* @date Created 3/28/2026
*/


module axi_lite_register #(
  parameter int DATA_WIDTH = 32,
  parameter int ADDR_WIDTH = 32

) (
  
  //General signals
  input logic  aclk_i,
  input logic  arst_ni,
  
  //Read Address Channel
  output logic [ADDR_WIDTH-1:0] araddr_o,
  
  output logic arvalid_o,
  input  logic arready_i,
  
  //Read Data Channel
  input logic [DATA_WIDTH-1:0] rdata_i,
  
  input  logic rvalid_i,
  output logic rready_o,
  
  //Write Address Channel
  output logic [ADDR_WIDTH-1:0] awaddr_o,
  
  output logic awvalid_o,
  input  logic awready_i,
  
  
  //Write Data Channel
  output logic [DATA_WIDTH-1:0] wdata_o,
  
  input  logic wready_i,
  output logic wvalid_o,
  
  //UART signals
  output logic [7:0] uart_tx_reg_o,
  input  logic [7:0] uart_rx_reg_i,
  
  output tx_start_o,
  input  tx_busy_i,
  input  data_valid_i
);

localparam int ADDR_BYTE  = ADDR_WIDTH/8;
localparam int ADDR_COUNT_BIT = $clog2(ADDR_BYTE);

localparam int DATA_BYTE  = DATA_WIDTH/8;
localparam int DATA_COUNT_BIT = $clog2(DATA_BYTE);


localparam int CMD_READ = 153;
localparam int CMD_WRITE = 102;

//Read Signals
logic arvalid_d;
logic arvalid_q;

logic [ADDR_WIDTH-1:0] raddr_d;
logic [ADDR_WIDTH-1:0] raddr_q;

logic [DATA_WIDTH-1:0] rdata_d;
logic [DATA_WIDTH-1:0] rdata_q;

logic rready_d;
logic rready_q;

//Write Signals
logic awready_d;
logic awready_q;

logic [ADDR_WIDTH-1:0] awaddr_d;
logic [ADDR_WIDTH-1:0] awaddr_q;

logic wready_d;
logic wready_q;

//UART signals
logic [7:0] cmd_reg_d;
logic [7:0] cmd_reg_q;

logic [ADDR_WIDTH-1:0] addr_reg_d;
logic [ADDR_WIDTH-1:0] addr_reg_q;

logic [ADDR_COUNT_BIT-1:0] addr_byte_cnt_d;
logic [ADDR_COUNT_BIT-1:0] addr_byte_cnt_q;

logic [DATA_COUNT_BIT-1:0] data_byte_cnt_d;
logic [DATA_COUNT_BIT-1:0] data_byte_cnt_q;

// Define the states
typedef enum {
  StIdle, StRegAddress, StAxiRead, StAxiReadData, StWriteData
} uartaxi_state_e;

uartaxi_state_e uartaxi_state_d, uartaxi_state_q;

// Combinational decode of the state
always_comb begin
  uartaxi_state_d = uartaxi_state_q;
  cmd_reg_d = cmd_reg_q;
  addr_reg_d = addr_reg_q;
  addr_byte_cnt_d = addr_byte_cnt_q;
  raddr_d = raddr_q;
  rready_d = rready_q;
  rdata_d = rdata_q;
  data_byte_cnt_d = data_byte_cnt_q;

  unique case (uartaxi_state_q)
    // StIdle: Wait for UART transaction
    StIdle: begin
      if (data_valid_i) begin
        uartaxi_state_d = StRegAddress;
        cmd_reg_d = uart_rx_reg_i;
      end else begin
        uartaxi_state_d = StIdle;
      end
    end
    //StRegAddress: Recieve register address
    StRegAddress: begin
      if (data_valid_i) begin
        if (addr_byte_cnt_q < ADDR_BYTE) begin
          addr_byte_cnt_d = addr_byte_cnt_q + 1'b1;
          addr_reg_d[addr_byte_cnt_q*8 +: 8] = uart_rx_reg_i;
        end else begin
          addr_byte_cnt_d = 'h0;
          if (cmd_reg_q == CMD_READ) begin
            uartaxi_state_d = StAxiRead;
            raddr_d = addr_reg_q;
            arvalid_d = 1'b1;
          end else if (cmd_reg_q == CMD_WRITE) begin
            uartaxi_state_d = StWriteData;
          end else begin
            cmd_reg_d = 'h0;
            addr_reg_d = 'h0;
            uartaxi_state_d = StIdle
          end
        end
      end else begin
        uartaxi_state_d = StRegAddress;
      end
    end
    StAxiReadAddr: begin
      if (arready_i) begin
        arvalid_d = 1'b0;
        rready_d = 1'b1;
        uartaxi_state_d = StAxiReadData;
      end else begin
        uartaxi_state_d = StAxiRead;
      end
    end
    StAxiReadData: begin
      if (rvalid_i) begin
        uartaxi_state_d = StUartTx;
        rready_d = 1'b0;
        rdata_d = rdata_i;
      end else begin
        uartaxi_state_d = StAxiReadData;
      end
    end
    StUartTx: begin
      if (!tx_busy_i) begin
        if (data_byte_cnt_d < DATA_BYTE) begin
          tx_start_d = 1'b1;
          data_byte_cnt_d = data_byte_cnt_q + 1'b1;
          uart_tx_reg_d = rdata_q[data_byte_cnt_q*8 +: 8];
        end else begin
          data_byte_cnt_d = 'h0;
          uartaxi_state_d = StIdle;
        end
      end else begin
        uartaxi_state_d = StUartTx;
        tx_start_d = 1'b0;
      end
    end
    //Used to catch parasitic states
    default: uartaxi_state_d = StIdle;
  endcase
end

// Register the state and clock in updated signals
always_ff @(posedge aclk_i or negedge arst_ni) begin
  if (!arst_ni) begin
    uartaxi_state_q <= StIdle;
    cmd_reg_q <= 'h0;
    addr_reg_q <= 'h0;
    addr_byte_cnt_q <= 'h0;
    raddr_q <= 'h0'
    arvalid_q <= 1'b0;
    rready_q <= 1'b0;
    rdata_q <= 'h0;
    data_byte_cnt_q <= 'h0;
  end else begin
    uartaxi_state_q <= uartaxi_state_d;
    cmd_reg_q <= cmd_reg_d;
    addr_reg_q <= addr_reg_d;
    addr_byte_cnt_q <= addr_byte_cnt_d;
    raddr_q <= raddr_d;
    arvalid_q <= arvalid_d;
    rready_q <= rready_d;
    rdata_q <= rdata_d;
    data_byte_cnt_q <= data_byte_cnt_d;
  end
end

endmodule
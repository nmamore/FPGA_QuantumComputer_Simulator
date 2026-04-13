/*
* @file axi_lite_uart_if.sv
* @brief Interface between internal AXI bus and external UART
* @author Nicholas Amore namore7@gmail.com
* @date Created 3/28/2026
*/


module axi_lite_uart_if #(
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

logic [ADDR_WIDTH-1:0] araddr_d;
logic [ADDR_WIDTH-1:0] araddr_q;

logic [DATA_WIDTH-1:0] rdata_d;
logic [DATA_WIDTH-1:0] rdata_q;

logic rready_d;
logic rready_q;

//Write Signals
logic awvalid_d;
logic awvalid_q;

logic [ADDR_WIDTH-1:0] awaddr_d;
logic [ADDR_WIDTH-1:0] awaddr_q;

logic [DATA_WIDTH-1:0] wdata_d;
logic [DATA_WIDTH-1:0] wdata_q;

logic wvalid_d;
logic wvalid_q;

//UART signals
logic [7:0] cmd_reg_d;
logic [7:0] cmd_reg_q;

logic [7:0] uart_tx_reg_d;
logic [7:0] uart_tx_reg_q;

logic [ADDR_WIDTH-1:0] addr_reg_d;
logic [ADDR_WIDTH-1:0] addr_reg_q;

logic [ADDR_COUNT_BIT-1:0] addr_byte_cnt_d;
logic [ADDR_COUNT_BIT-1:0] addr_byte_cnt_q;

logic [DATA_COUNT_BIT:0] data_byte_cnt_d;
logic [DATA_COUNT_BIT:0] data_byte_cnt_q;

logic [DATA_COUNT_BIT-1:0] reg_data_byte_cnt_d;
logic [DATA_COUNT_BIT-1:0] reg_data_byte_cnt_q;

logic tx_start_d;
logic tx_start_q;

//Assignments

assign araddr_o = araddr_q;
assign arvalid_o = arvalid_q;

assign rready_o = rready_q;

assign awaddr_o = awaddr_q;
assign awvalid_o = awvalid_q;

assign wdata_o = wdata_q;
assign wvalid_o = wvalid_q;

assign uart_tx_reg_o = uart_tx_reg_q;
assign tx_start_o = tx_start_q;

// Define the states
typedef enum {
  StIdle, StRegAddress, StAxiReadData, StAxiReadAddr, StRegData, StAxiWriteAddr, StAxiWriteData, StUartTx
} uartaxi_state_e;

uartaxi_state_e uartaxi_state_d, uartaxi_state_q;

// Combinational decode of the state
always_comb begin
  uartaxi_state_d = uartaxi_state_q;
  cmd_reg_d = cmd_reg_q;
  addr_reg_d = addr_reg_q;
  addr_byte_cnt_d = addr_byte_cnt_q;
  araddr_d = araddr_q;
  rready_d = rready_q;
  arvalid_d = arvalid_q;
  rdata_d = rdata_q;
  data_byte_cnt_d = data_byte_cnt_q;
  awaddr_d = awaddr_q;
  reg_data_byte_cnt_d = reg_data_byte_cnt_q;
  wdata_d = wdata_q;
  wvalid_d = wvalid_q;
  awvalid_d = awvalid_q;
  tx_start_d = tx_start_q;
  uart_tx_reg_d = uart_tx_reg_q;
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
        if (addr_byte_cnt_q < (ADDR_BYTE-1)) begin
          addr_byte_cnt_d = addr_byte_cnt_q + 1'b1;
          addr_reg_d[addr_byte_cnt_q*8 +: 8] = uart_rx_reg_i;
        end else begin
          addr_byte_cnt_d = 'h0;
          if (cmd_reg_q == CMD_READ) begin
            uartaxi_state_d = StAxiReadAddr;
            araddr_d = {uart_rx_reg_i, addr_reg_q[23:0]};
            arvalid_d = 1'b1;
          end else if (cmd_reg_q == CMD_WRITE) begin
            uartaxi_state_d = StAxiWriteAddr;
            awaddr_d = {uart_rx_reg_i, addr_reg_q[23:0]};
            awvalid_d = 1'b1;
          end else begin
            cmd_reg_d = 'h0;
            addr_reg_d = 'h0;
            uartaxi_state_d = StIdle;
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
        uartaxi_state_d = StAxiReadAddr;
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
        if (data_byte_cnt_d < (DATA_BYTE)) begin
          tx_start_d = 1'b1;
          data_byte_cnt_d = data_byte_cnt_q + 1'b1;
          uart_tx_reg_d = rdata_q[data_byte_cnt_q*8 +: 8];
        end else begin
          data_byte_cnt_d = 'h0;
          tx_start_d = 1'b0;
          rdata_d = 'h0;
          uartaxi_state_d = StIdle;
        end
      end else begin
        uartaxi_state_d = StUartTx;
        tx_start_d = 1'b0;
      end
    end
    StAxiWriteAddr: begin
      if (awready_i) begin
        uartaxi_state_d = StRegData;
        awvalid_d = 1'b0;
        awaddr_d = 'h0;
      end
    end
    StRegData: begin
      if (data_valid_i) begin
        if (reg_data_byte_cnt_q < (DATA_BYTE-1)) begin
          reg_data_byte_cnt_d = reg_data_byte_cnt_q + 1'b1;
          wdata_d[reg_data_byte_cnt_q*8 +: 8] = uart_rx_reg_i;
        end else begin
          reg_data_byte_cnt_d = 'h0;
          wdata_d[31:24] = uart_rx_reg_i;
          wvalid_d = 1'b1;
          uartaxi_state_d = StAxiWriteData;
        end
      end else begin
        uartaxi_state_d = StRegData;
      end
    end
    StAxiWriteData: begin
      if (wready_i) begin
        uartaxi_state_d = StIdle;
        wdata_d = 'h0;
        wvalid_d = 1'b0;
      end else begin
        uartaxi_state_d = StAxiWriteData;
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
    araddr_q <= 'h0;
    arvalid_q <= 1'b0;
    rready_q <= 1'b0;
    rdata_q <= 'h0;
    data_byte_cnt_q <= 'h0;
    reg_data_byte_cnt_q <= 'h0;
    wdata_q <= 'h0;
    wvalid_q <= 1'b0;
    tx_start_q <= 1'b0;
    uart_tx_reg_q <= 'h0;
    awaddr_q <= 'h0;
    awvalid_q <= 1'b0;
  end else begin
    uartaxi_state_q <= uartaxi_state_d;
    cmd_reg_q <= cmd_reg_d;
    addr_reg_q <= addr_reg_d;
    addr_byte_cnt_q <= addr_byte_cnt_d;
    araddr_q <= araddr_d;
    arvalid_q <= arvalid_d;
    rready_q <= rready_d;
    rdata_q <= rdata_d;
    data_byte_cnt_q <= data_byte_cnt_d;
    reg_data_byte_cnt_q <= reg_data_byte_cnt_d;
    wdata_q <= wdata_d;
    wvalid_q <= wvalid_d;
    tx_start_q <= tx_start_d;
    uart_tx_reg_q <= uart_tx_reg_d;
    awaddr_q <= awaddr_d;
    awvalid_q <= awvalid_d;
  end
end


endmodule
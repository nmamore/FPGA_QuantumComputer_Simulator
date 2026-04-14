/*
* @file axi_lite_controller.sv
* @brief Controller for AXI-Lite
* @author Nicholas Amore namore7@gmail.com
* @date Created 3/28/2026
*/


module axi_lite_controller #(
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
  output logic [DATA_WIDTH-1:0] uart_tx_reg_o,
  input logic  [DATA_WIDTH-1:0] uart_rx_cmd_i,
  input logic  [DATA_WIDTH-1:0] uart_rx_reg_i,
  input logic  [DATA_WIDTH-1:0] uart_rx_data_i,
  
  input logic  reg_ready_i,
  input logic  tx_done_i,
  output logic tx_ready_o
);

localparam int CMD_READ = 153;
localparam int CMD_WRITE = 102;
localparam int CMD_STREAM = 165;
localparam int CMD_STOP = 90;

// Define the states
typedef enum {
  StIdle, StReadAddr, StReadData, StWriteAddr, StWriteData
} uartaxi_state_e;

uartaxi_state_e uartaxi_state_d, uartaxi_state_q;

// Combinational decode of the state
always_comb begin
  uartaxi_state_d = uartaxi_state_q;
  araddr_o = 'h0;
  arvalid_o = 1'b0;
  tx_ready_o = 1'b0;
  rready_o = 1'b0;
  
  awaddr_o = 'h0;
  awvalid_o = 1'b0;
  wdata_o = 'h0;
  wvalid_o = 1'b0;  
  unique case (uartaxi_state_q)
    // StIdle: Wait until command is issued
    StIdle: begin
      if (reg_ready_i) begin
        //Chose path depending on recieved command
        unique case (uart_rx_cmd_i)
          CMD_READ: begin //Kick off read loop
            uartaxi_state_d = StReadAddr;
          end
          CMD_WRITE: begin //Kick off write loop
            uartaxi_state_d = StWriteAddr;
          end
          CMD_STREAM: begin //Do nothing
            uartaxi_state_d = StIdle;
          end
          CMD_STOP: begin
            uartaxi_state_d = StIdle;
          end
          default: uartaxi_state_d = StIdle;
        endcase
      end
    end
    //StRegAddr: Recieve read address and wait for reg file ack
    StReadAddr: begin
      if (reg_ready_i) begin //Wait for UART register
       araddr_o = uart_rx_reg_i; //Provide address and flag valid
       arvalid_o = 1'b1;
        if (arready_i) begin //Wait for reg file to ack address
          uartaxi_state_d = StReadData;
        end
      end
    end
    //StReadData: Recieve read data from reg file and send to UART
    StReadData: begin
      if (rvalid_i) begin //Hold for valid data
        uart_tx_reg_o = rdata_i; //Provide data to output
        tx_ready_o = 1'b1; //Flag data ready
        rready_o = 1'b1;
      end
      if (tx_done_i) begin
        uartaxi_state_d = StIdle;
      end
    end
    //StWriteAddr: Recieve write address and wait for reg file ack
    StWriteAddr: begin
      if (reg_ready_i) begin //Wait for UART register
        awaddr_o = uart_rx_reg_i; //Provide address and flag valid
        awvalid_o = 1'b1;
        if (awready_i) begin //Wait for reg file to ack address
          uartaxi_state_d = StWriteData;
        end
      end
    end
    //StWriteData: Recieve write data and wait for reg file ack
    StWriteData: begin
      if (reg_ready_i) begin //Wait for UART register
        wdata_o = uart_rx_data_i; //Provide address and flag valid
        wvalid_o = 1'b1;
        if (wready_i) begin //Wait for reg file to ack address
          uartaxi_state_d = StIdle;
        end
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
  end else begin
    uartaxi_state_q <= uartaxi_state_d;
  end
end

endmodule
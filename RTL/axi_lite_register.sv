/*
* @file axi_lite_register.sv
* @brief Peripheral for AXI4-Lite
* @author Nicholas Amore namore7@gmail.com
* @date Created 3/28/2026
*/


module axi_lite_register #(
  parameter int AXI_DATA_WIDTH = 16,
  parameter int AXI_ADDR_WIDTH = 8

) (
  
  //General signals
  input logic  axi_aclk_i,
  input logic  axi_arst_ni,
  
  //Read Address Channel
  input logic [AXI_ADDR_WIDTH-1:0] axi_araddr_i,
  
  input logic  arvalid_i,
  output logic arready_o,
  
  //Read Data Channel
  output logic [AXI_DATA_WIDTH-1:0] axi_rdata_o,
  
  output logic rvalid_o,
  input  logic rready_i,
  
  //Write Address Channel
  input logic [AXI_ADDR_WIDTH-1:0] axi_awaddr_i,
  
  input logic  awvalid_i,
  output logic awready_o,
  
  
  //Write Data Channel
  output logic [AXI_DATA_WIDTH-1:0] axi_wdata_i,
  
  output logic bvalid_o,
  input  logic bready_i,
  
);

`include "register_list.svh"

assign axi_reg_data = REV_REG_ADDR ? rev_reg:
                      REV_REG_ADDR ? rev_reg:
                      REV_REG_ADDR ? rev_reg:
                      REV_REG_ADDR ? rev_reg:
                      REV_REG_ADDR ? rev_reg:
                      REV_REG_ADDR ? rev_reg:
                      REV_REG_ADDR ? rev_reg:
                      REV_REG_ADDR ? rev_reg:
                      REV_REG_ADDR ? rev_reg:
                      REV_REG_ADDR ? rev_reg:
                      REV_REG_ADDR ? rev_reg:

// Define the states
typedef enum {
  StAxiReadIdle, StAxiReadData, StRxShift, StRxStop
} axiread_state_e;

axiread_state_e axiread_state_d, axiread_state_q;

// Combinational decode of the state
always_comb begin
  axiread_state_d = axiread_state_q;
  arready_d = arready_q;
  axi_araddr_d = axi_araddr_q;
  axi_rdata_d = axi_rdata_q;
  unique case (axiread_state_q)
    // StAxiReadIdle: Wait for read to be initiated and capture address
    StAxiReadIdle: begin
      if (arvalid_i) begin
        axiread_state_d = StAxiReadData;
        arready_d = 1'b1;
        axi_araddr_d = axi_araddr_i;
      end else begin
        axiread_state_d = StAxiReadIdle;
      end
    end
    //Capture read address
    StAxiReadData: begin
      if (rready_i) begin
        axi_rdata_d = axi_reg_data[axi_araddr_q];
      end else begin
        axiread_state_d = StAxiReadData;
      end

    end
    //Used to catch parasitic states
    default: uartrx_state_d = StRxIdle;
  endcase
end

// Register the state and clock in updated signals
always_ff @(posedge axi_aclk_i or negedge axi_arst_ni) begin
  if (!axi_arst_ni) begin
    axiread_state_q <= StAxiReadIdle;
    arready_q <= 1'b0;
    axi_araddr_q <= 'h0;
    axi_rdata_q <= 'h0;
  end else begin
    axiread_state_q <= axiread_state_d;
    arready_q <= arready_d;
    axi_araddr_q <= axi_araddr_d;
    axi_rdata_q <= axi_rdata_d;
  end
end


endmodule
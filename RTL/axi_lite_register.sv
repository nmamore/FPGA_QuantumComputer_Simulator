/*
* @file axi_lite_register.sv
* @brief Peripheral for AXI4-Lite
* @author Nicholas Amore namore7@gmail.com
* @date Created 3/28/2026
*/


module axi_lite_register #(
  parameter int AXI_DATA_WIDTH = 32,
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

localparam int ADDR_DEPTH  = 2**AXI_ADDR_WIDTH;

logic [AXI_DATA_WIDTH-1:0] axi_reg_array [0:ADDR_DEPTH-1]

logic arready_d;
logic arready_q;

logic axi_araddr_d;
logic axi_araddr_q;

logic [AXI_DATA_WIDTH-1:0] axi_rdata_d;
logic [AXI_DATA_WIDTH-1:0] axi_rdata_q;

logic axi_rvalid_d;
logic axi_rvalid_q;

// Define the states
typedef enum {
  StAxiReadIdle, StAxiReadData
} axiread_state_e;

axiread_state_e axiread_state_d, axiread_state_q;

// Combinational decode of the state
always_comb begin
  axiread_state_d = axiread_state_q;
  arready_d = arready_q;
  axi_araddr_d = axi_araddr_q;
  axi_rdata_d = axi_rdata_q;
  axi_rvalid_d = axi_rvalid_q;
  unique case (axiread_state_q)
    // StAxiReadIdle: Wait for read to be initiated and capture address
    StAxiReadIdle: begin
      if (arvalid_i) begin
        axiread_state_d = StAxiReadData;
        arready_d = 1'b1;
        axi_araddr_d = axi_araddr_i;
      end else begin
        axiread_state_d = StAxiReadIdle;
        arready_d = 1'b0;
        axi_rvalid_d = 1'b0;
      end
    end
    //Capture read address
    StAxiReadData: begin
      if (rready_i) begin
        axi_rdata_d = axi_reg_data[axi_araddr_q];
        axi_rvalid_d = 1'b1;
        axiread_state_d = StAxiReadIdle;
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
    axi_rvalid_q <= 1'b0;
    
    //Register reset
    axi_reg_data[REV_REG_ADDR]       <= REV_REG_INIT;
    axi_reg_data[STATUS_REG_ADDR]    <= STATUS_REG_INIT;
    axi_reg_data[CONTROL_REG_ADDR]   <= CONTROL_REG_INIT;
    axi_reg_data[RESULT_REG_ADDR]    <= RESULT_REG_INIT;
    axi_reg_data[SV_000_RE_REG_ADDR] <= SV_000_RE_REG_INIT;
    axi_reg_data[SV_000_IM_REG_ADDR] <= SV_000_IM_REG_INIT;
    axi_reg_data[SV_001_RE_REG_ADDR] <= SV_001_RE_REG_INIT;
    axi_reg_data[SV_001_IM_REG_ADDR] <= SV_001_IM_REG_INIT;
    axi_reg_data[SV_010_RE_REG_ADDR] <= SV_010_RE_REG_INIT;
    axi_reg_data[SV_010_IM_REG_ADDR] <= SV_010_IM_REG_INIT;
    axi_reg_data[SV_011_RE_REG_ADDR] <= SV_011_RE_REG_INIT;
    axi_reg_data[SV_011_IM_REG_ADDR] <= SV_011_IM_REG_INIT;
    axi_reg_data[SV_100_RE_REG_ADDR] <= SV_100_RE_REG_INIT;
    axi_reg_data[SV_100_IM_REG_ADDR] <= SV_100_IM_REG_INIT;
    axi_reg_data[SV_101_RE_REG_ADDR] <= SV_101_RE_REG_INIT;
    axi_reg_data[SV_101_IM_REG_ADDR] <= SV_101_IM_REG_INIT;
    axi_reg_data[SV_110_RE_REG_ADDR] <= SV_110_RE_REG_INIT;
    axi_reg_data[SV_110_IM_REG_ADDR] <= SV_110_IM_REG_INIT;
    axi_reg_data[SV_111_RE_REG_ADDR] <= SV_111_RE_REG_INIT;
    axi_reg_data[SV_111_IM_REG_ADDR] <= SV_111_IM_REG_INIT;
  end else begin
    axiread_state_q <= axiread_state_d;
    arready_q <= arready_d;
    axi_araddr_q <= axi_araddr_d;
    axi_rdata_q <= axi_rdata_d;
    axi_rvalid_q <= axi_rvalid_d;
  end
end


endmodule
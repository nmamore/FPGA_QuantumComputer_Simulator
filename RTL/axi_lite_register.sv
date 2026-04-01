/*
* @file axi_lite_register.sv
* @brief Peripheral for AXI4-Lite
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
  input logic [ADDR_WIDTH-1:0] araddr_i,
  
  input logic  arvalid_i,
  output logic arready_o,
  
  //Read Data Channel
  output logic [DATA_WIDTH-1:0] rdata_o,
  
  output logic rvalid_o,
  input  logic rready_i,
  
  //Write Address Channel
  input logic [ADDR_WIDTH-1:0] awaddr_i,
  
  input logic  awvalid_i,
  output logic awready_o,
  
  
  //Write Data Channel
  input logic [DATA_WIDTH-1:0] wdata_i,
  
  output logic  wready_o,
  input  logic  wvalid_i
);

`include "register_list.svh"

localparam int ADDR_DEPTH  = 2**(ADDR_WIDTH/4);

//Internal AXI Register
logic [DATA_WIDTH-1:0] reg_array_d [0:ADDR_DEPTH-1];
logic [DATA_WIDTH-1:0] reg_array_q [0:ADDR_DEPTH-1];

//Read Signals
logic arready_d;
logic arready_q;

logic [DATA_WIDTH-1:0] rdata_d;
logic [DATA_WIDTH-1:0] rdata_q;

logic rvalid_d;
logic rvalid_q;

//Write Signals
logic awready_d;
logic awready_q;

logic [ADDR_WIDTH-1:0] awaddr_d;
logic [ADDR_WIDTH-1:0] awaddr_q;

logic wready_d;
logic wready_q;

//AXI Read Assignments

assign arready_o = arready_q;
assign rdata_o = rdata_q;
assign rvalid_o = rvalid_q;

//AXI Write Assignments

assign awready_o = awready_q;
assign wready_o = wready_q;

// Define the states
typedef enum {
  StReadIdle, StReadValid
} read_state_e;

read_state_e read_state_d, read_state_q;

// Define the states
typedef enum {
  StWriteIdle, StWriteData
} write_state_e;

write_state_e write_state_d, write_state_q;

// Combinational decode of the state
always_comb begin
  read_state_d = read_state_q;
  arready_d = 1'b0;
  rdata_d = 'h0;
  rvalid_d = 1'b0;
  unique case (read_state_q)
    // StReadIdle: Wait for read to be initiated and capture address
    StReadIdle: begin
      if (arvalid_i) begin
        read_state_d = StReadValid;
        arready_d = 1'b1;
        rdata_d = reg_array_q[{araddr_i[ADDR_WIDTH-1:2],2'b00}];
      end else begin
        read_state_d = StReadIdle;
      end
    end
    //Capture read address
    StReadValid: begin
      rvalid_d = 1'b1;
      if (rready_i) begin
        read_state_d = StReadIdle;
      end else begin
        read_state_d = StReadValid;
      end
    end
    //Used to catch parasitic states
    default: read_state_d = StReadIdle;
  endcase
end

// Register the state and clock in updated signals
always_ff @(posedge aclk_i or negedge arst_ni) begin
  if (!arst_ni) begin
    read_state_q <= StReadIdle;
    arready_q <= 1'b0;
    rdata_q <= 'h0;
    rvalid_q <= 1'b0;
  end else begin
    read_state_q <= read_state_d;
    arready_q <= arready_d;
    rdata_q <= rdata_d;
    rvalid_q <= rvalid_d;
  end
end

// Combinational decode of the state
always_comb begin
  write_state_d = write_state_q;
  awready_d = 1'b0;
  awaddr_d = 'h0;
  reg_array_d = reg_array_q;
  wready_d = 1'b0;
  unique case (write_state_q)
    // StWriteIdle: Wait for write to be initiated and capture address
    StWriteIdle: begin
      if (awvalid_i) begin
        write_state_d = StWriteData;
        awready_d = 1'b1;
        awaddr_d = {awaddr_i[ADDR_WIDTH-1:2],2'b00};
      end else begin
        write_state_d = StWriteIdle;
      end
    end
    StWriteData: begin
      if (wvalid_i) begin
        write_state_d = StWriteIdle;
        reg_array_d[awaddr_q] = wdata_i;
        wready_d = 1'b1;
      end else begin
        write_state_d = StWriteData;
      end
    end
    //Used to catch parasitic states
    default: write_state_d = StWriteIdle;
  endcase
end

// Register the state and clock in updated signals
always_ff @(posedge aclk_i or negedge arst_ni) begin
  if (!arst_ni) begin
    write_state_q <= StWriteIdle;
    awready_q <= 1'b0;
    awaddr_q <= 1'b0;
    wready_q <= 1'b0;
    //Register reset
    reg_array_q                     <= '{default: '0};
    reg_array_q[REV_REG_ADDR]       <= REV_REG_INIT;
    reg_array_q[STATUS_REG_ADDR]    <= STATUS_REG_INIT;
    reg_array_q[CONTROL_REG_ADDR]   <= CONTROL_REG_INIT;
    reg_array_q[RESULT_REG_ADDR]    <= RESULT_REG_INIT;
    reg_array_q[SV_000_RE_REG_ADDR] <= SV_000_RE_REG_INIT;
    reg_array_q[SV_000_IM_REG_ADDR] <= SV_000_IM_REG_INIT;
    reg_array_q[SV_001_RE_REG_ADDR] <= SV_001_RE_REG_INIT;
    reg_array_q[SV_001_IM_REG_ADDR] <= SV_001_IM_REG_INIT;
    reg_array_q[SV_010_RE_REG_ADDR] <= SV_010_RE_REG_INIT;
    reg_array_q[SV_010_IM_REG_ADDR] <= SV_010_IM_REG_INIT;
    reg_array_q[SV_011_RE_REG_ADDR] <= SV_011_RE_REG_INIT;
    reg_array_q[SV_011_IM_REG_ADDR] <= SV_011_IM_REG_INIT;
    reg_array_q[SV_100_RE_REG_ADDR] <= SV_100_RE_REG_INIT;
    reg_array_q[SV_100_IM_REG_ADDR] <= SV_100_IM_REG_INIT;
    reg_array_q[SV_101_RE_REG_ADDR] <= SV_101_RE_REG_INIT;
    reg_array_q[SV_101_IM_REG_ADDR] <= SV_101_IM_REG_INIT;
    reg_array_q[SV_110_RE_REG_ADDR] <= SV_110_RE_REG_INIT;
    reg_array_q[SV_110_IM_REG_ADDR] <= SV_110_IM_REG_INIT;
    reg_array_q[SV_111_RE_REG_ADDR] <= SV_111_RE_REG_INIT;
    reg_array_q[SV_111_IM_REG_ADDR] <= SV_111_IM_REG_INIT;
  end else begin
    write_state_q <= write_state_d;
    awready_q <= awready_d;
    awaddr_q <= awaddr_d;
    wready_q <= wready_d;
    reg_array_q <= reg_array_d;
  end
end


endmodule
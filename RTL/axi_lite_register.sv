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
  input  logic  wvalid_i,
  
  output logic [DATA_WIDTH-1:0] control_reg_o,
  input logic  [DATA_WIDTH-1:0] result_reg_i,
  input logic stable_i,
  
  output logic signed [15:0] sv_re_o [0:7],
  output logic signed [15:0] sv_im_o [0:7]
);

`include "register_list.svh"

localparam int ADDR_DEPTH  = 2**(ADDR_WIDTH/4);

//Internal AXI Register
logic [DATA_WIDTH-1:0] reg_array_d [0:ADDR_DEPTH-1];
logic [DATA_WIDTH-1:0] reg_array_q [0:ADDR_DEPTH-1];

//Read Signals
logic [ADDR_WIDTH-1:0] araddr_d;
logic [ADDR_WIDTH-1:0] araddr_q;

//Write Signals
logic [ADDR_WIDTH-1:0] awaddr_d;
logic [ADDR_WIDTH-1:0] awaddr_q;

//Register Assignments

assign control_reg_o = reg_array_q[CONTROL_REG_ADDR];

assign sv_re_o[0] = reg_array_q[SV_000_RE_REG_ADDR][15:0];
assign sv_re_o[1] = reg_array_q[SV_001_RE_REG_ADDR][15:0];
assign sv_re_o[2] = reg_array_q[SV_010_RE_REG_ADDR][15:0];
assign sv_re_o[3] = reg_array_q[SV_011_RE_REG_ADDR][15:0];
assign sv_re_o[4] = reg_array_q[SV_100_RE_REG_ADDR][15:0];
assign sv_re_o[5] = reg_array_q[SV_101_RE_REG_ADDR][15:0];
assign sv_re_o[6] = reg_array_q[SV_110_RE_REG_ADDR][15:0];
assign sv_re_o[7] = reg_array_q[SV_111_RE_REG_ADDR][15:0];

assign sv_im_o[0] = reg_array_q[SV_000_IM_REG_ADDR][15:0];
assign sv_im_o[1] = reg_array_q[SV_001_IM_REG_ADDR][15:0];
assign sv_im_o[2] = reg_array_q[SV_010_IM_REG_ADDR][15:0];
assign sv_im_o[3] = reg_array_q[SV_011_IM_REG_ADDR][15:0];
assign sv_im_o[4] = reg_array_q[SV_100_IM_REG_ADDR][15:0];
assign sv_im_o[5] = reg_array_q[SV_101_IM_REG_ADDR][15:0];
assign sv_im_o[6] = reg_array_q[SV_110_IM_REG_ADDR][15:0];
assign sv_im_o[7] = reg_array_q[SV_111_IM_REG_ADDR][15:0];


// Define the states
typedef enum {
  StReadIdle, StReadAddrAck, StReadValid
} read_state_e;

read_state_e read_state_d, read_state_q;

// Define the states
typedef enum {
  StWriteIdle, StWriteAddrAck, StWriteData, StWriteDataAck
} write_state_e;

write_state_e write_state_d, write_state_q;

// Combinational decode of the state
always_comb begin
  read_state_d = read_state_q;
  
  arready_o = 1'b0;
  araddr_d = araddr_q;
  rdata_o = 'h0;
  rvalid_o = 1'b0;
  unique case (read_state_q)
    // StReadIdle: Wait for read to be initiated and capture address
    StReadIdle: begin
      if (arvalid_i) begin
        read_state_d = StReadAddrAck;
        araddr_d = {araddr_i[ADDR_WIDTH-1:2],2'b00};
      end else begin
        read_state_d = StReadIdle;
      end
    end
    //StReadAddrAck: Acknowledge read address
    StReadAddrAck: begin
      read_state_d = StReadValid;
      arready_o = 1'b1;
    end
    //Capture read address
    StReadValid: begin
      rvalid_o = 1'b1;
      rdata_o = reg_array_q[araddr_d];
      if (rready_i) begin
        read_state_d = StReadIdle;
        araddr_d = 'h0;
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
    araddr_q <= 'h0;
  end else begin
    read_state_q <= read_state_d;
    araddr_q <= araddr_d;
  end
end

// Combinational decode of the state
always_comb begin
  write_state_d = write_state_q;
  
  awready_o = 1'b0;
  awaddr_d = awaddr_q;
  wready_o = 1'b0;
  
  reg_array_d = reg_array_q;
  reg_array_d[RESULT_REG_ADDR] = result_reg_i;
  reg_array_d[STATUS_REG_ADDR][1] = stable_i;
  unique case (write_state_q)
    // StWriteIdle: Wait for write to be initiated and capture address
    StWriteIdle: begin
      if (awvalid_i) begin
        write_state_d = StWriteAddrAck;
        awaddr_d = {awaddr_i[ADDR_WIDTH-1:2],2'b00};
      end
    end
    //StWriteAddrAck: Confirm address was recieved
    StWriteAddrAck: begin
      write_state_d = StWriteData;
      awready_o = 1'b1;
    end
    //StWriteData: Write data to register
    StWriteData: begin
      if (wvalid_i) begin //Wait until data is valid
        write_state_d = StWriteDataAck;
        if ((awaddr_q != REV_REG_ADDR) && (awaddr_q != STATUS_REG_ADDR) && (awaddr_q != RESULT_REG_ADDR)) begin
          reg_array_d[awaddr_q] = wdata_i; //Update register as long as it is not a RO
        end else if (awaddr_q == STATUS_REG_ADDR) begin //Clear bit one of the status register if bit 0 is a 1. Maintain state of register otherwise
          reg_array_d[awaddr_q][DATA_WIDTH-1:1] = reg_array_q[awaddr_q][DATA_WIDTH-1:1];
          reg_array_d[awaddr_q][0] = reg_array_q[awaddr_q][0] & wdata_i[0];
        end else begin
          reg_array_d[awaddr_q] = reg_array_q[awaddr_q]; //Keep old state
        end
      end
    end
    //StWriteDataAck: Confirm data was recieved
    StWriteDataAck: begin
      wready_o = 1'b1;
      write_state_d = StWriteIdle;
    end
    //Used to catch parasitic states
    default: write_state_d = StWriteIdle;
  endcase
end

// Register the state and clock in updated signals
always_ff @(posedge aclk_i or negedge arst_ni) begin
  if (!arst_ni) begin
    write_state_q <= StWriteIdle;
    awaddr_q <= 'h0;
    //Register reset
    reg_array_q                     <= '{default: '0};
    reg_array_q[REV_REG_ADDR]       <= REV_REG_INIT;
    reg_array_q[STATUS_REG_ADDR]    <= STATUS_REG_INIT;
    reg_array_q[CONTROL_REG_ADDR]   <= CONTROL_REG_INIT;
    reg_array_q[RESULT_REG_ADDR]    <= RESULT_REG_INIT;
    reg_array_q[SCRATCH_REG_ADDR]   <= SCRATCH_REG_INIT;
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
    awaddr_q <= awaddr_d;
    reg_array_q <= reg_array_d;
  end
end


endmodule
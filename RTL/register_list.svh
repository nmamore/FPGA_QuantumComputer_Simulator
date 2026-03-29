/*
* @file register_list.svh
* @brief Register addresses and inits for AXI4-Lite
* @author Nicholas Amore namore7@gmail.com
* @date Created 3/28/2026
*/

//Revision of FPGA
localparam REV_REG_ADDR = 8'h00;
localparam REV_REG_INIT = 16'h0110; //[15:12] N/A; [11:8] Major; [7:4] Minor; [3:0] Bug Fix

//Status Info on FPGA
localparam STATUS_ADDR = 8'h04;
localparam STATUS_INIT = 16'h0001;

//Control register for FPGA
localparam CONTROL_ADDR = 8'h08;
localparam CONTROL_INIT = 16'h0000;

//Real and Imaginary parts for initial state vector
localparam SV_000_RE_ADDR = 8'h0C;
localparam SV_000_RE_INIT = 16'h0000;
localparam SV_000_IM_ADDR = 8'h10;
localparam SV_000_IM_INIT = 16'h0000;

localparam SV_001_RE_ADDR = 8'h14;
localparam SV_001_RE_INIT = 16'h0000;
localparam SV_001_RE_ADDR = 8'h18;
localparam SV_001_RE_INIT = 16'h0000;

localparam SV_010_RE_ADDR = 8'h1C;
localparam SV_010_RE_INIT = 16'h0000;
localparam SV_010_RE_ADDR = 8'h20;
localparam SV_010_RE_INIT = 16'h0000;

localparam SV_011_RE_ADDR = 8'h24;
localparam SV_011_RE_INIT = 16'h0000;
localparam SV_011_RE_ADDR = 8'h28;
localparam SV_011_RE_INIT = 16'h0000;

localparam SV_100_RE_ADDR = 8'h2C;
localparam SV_100_RE_INIT = 16'h0000;
localparam SV_100_RE_ADDR = 8'h30;
localparam SV_100_RE_INIT = 16'h0000;

localparam SV_101_RE_ADDR = 8'h34;
localparam SV_101_RE_INIT = 16'h0000;
localparam SV_101_RE_ADDR = 8'h38;
localparam SV_101_RE_INIT = 16'h0000;

localparam SV_110_RE_ADDR = 8'h3C;
localparam SV_110_RE_INIT = 16'h0000;
localparam SV_110_RE_ADDR = 8'h40;
localparam SV_110_RE_INIT = 16'h0000;

localparam SV_111_RE_ADDR = 8'h44;
localparam SV_111_RE_INIT = 16'h0000;
localparam SV_111_RE_ADDR = 8'h48;
localparam SV_111_RE_INIT = 16'h0000;
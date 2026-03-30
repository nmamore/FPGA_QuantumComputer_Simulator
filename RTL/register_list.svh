/*
* @file register_list.svh
* @brief Register addresses and inits for AXI4-Lite
* @author Nicholas Amore namore7@gmail.com
* @date Created 3/28/2026
*/

//Revision of FPGA
localparam REV_REG_ADDR   = 32'h00000000;
localparam REV_REG_INIT   = 32'h00000110; //[15:12] N/A; [11:8] Major; [7:4] Minor; [3:0] Bug Fix

//Status Info on FPGA
localparam STATUS_ADDR    = 32'h00000004;
localparam STATUS_INIT    = 32'h00000001;

//Control register for FPGA
localparam CONTROL_ADDR   = 32'h00000008;
localparam CONTROL_INIT   = 32'h00000000;

//Real and Imaginary parts for initial state vector
localparam SV_000_RE_ADDR = 32'h0000000C;
localparam SV_000_RE_INIT = 32'h00000000;
localparam SV_000_IM_ADDR = 32'h00000010;
localparam SV_000_IM_INIT = 32'h00000000;

localparam SV_001_RE_ADDR = 32'h00000014;
localparam SV_001_RE_INIT = 32'h00000000;
localparam SV_001_IM_ADDR = 32'h00000018;
localparam SV_001_IM_INIT = 32'h00000000;

localparam SV_010_RE_ADDR = 32'h0000001C;
localparam SV_010_RE_INIT = 32'h00000000;
localparam SV_010_IM_ADDR = 32'h00000020;
localparam SV_010_IM_INIT = 32'h00000000;

localparam SV_011_RE_ADDR = 32'h00000024;
localparam SV_011_RE_INIT = 32'h00000000;
localparam SV_011_IM_ADDR = 32'h00000028;
localparam SV_011_IM_INIT = 32'h00000000;

localparam SV_100_RE_ADDR = 32'h0000002C;
localparam SV_100_RE_INIT = 32'h00000000;
localparam SV_100_IM_ADDR = 32'h00000030;
localparam SV_100_IM_INIT = 32'h00000000;

localparam SV_101_RE_ADDR = 32'h00000034;
localparam SV_101_RE_INIT = 32'h00000000;
localparam SV_101_IM_ADDR = 32'h00000038;
localparam SV_101_IM_INIT = 32'h00000000;

localparam SV_110_RE_ADDR = 32'h0000003C;
localparam SV_110_RE_INIT = 32'h00000000;
localparam SV_110_IM_ADDR = 32'h00000040;
localparam SV_110_IM_INIT = 32'h00000000;

localparam SV_111_RE_ADDR = 32'h00000044;
localparam SV_111_RE_INIT = 32'h00000000;
localparam SV_111_IM_ADDR = 32'h00000048;
localparam SV_111_IM_INIT = 32'h00000000;
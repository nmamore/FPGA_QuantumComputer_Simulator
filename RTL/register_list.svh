/*
* @file register_list.svh
* @brief Register addresses and inits for AXI4-Lite
* @author Nicholas Amore namore7@gmail.com
* @date Created 3/28/2026
*/

//Revision of FPGA
localparam REV_REG_ADDR   = 32'h00000000;
localparam REV_REG_INIT   = 32'h00010100; //[31:24] N/A; [23:16] Major; [15:7] Minor; [7:0] Bug Fix

//Status Info on FPGA
localparam STATUS_REG_ADDR    = 32'h00000004;
localparam STATUS_REG_INIT    = 32'h00000001;

//Control register for FPGA
localparam CONTROL_REG_ADDR   = 32'h00000008;
localparam CONTROL_REG_INIT   = 32'h00000000;

//Control register for FPGA
localparam RESULT_REG_ADDR   = 32'h0000000C;
localparam RESULT_REG_INIT   = 32'h00000000;

//Spare register
localparam SCRATCH_REG_ADDR   = 32'h00000010;
localparam SCRATCH_REG_INIT   = 32'h00000000;

//Real and Imaginary parts for initial state vector
localparam SV_000_RE_REG_ADDR = 32'h00000014;
localparam SV_000_RE_REG_INIT = 32'h00001666;
localparam SV_000_IM_REG_ADDR = 32'h00000018;
localparam SV_000_IM_REG_INIT = 32'h00000147;

localparam SV_001_RE_REG_ADDR = 32'h0000001C;
localparam SV_001_RE_REG_INIT = 32'h0000EB85;
localparam SV_001_IM_REG_ADDR = 32'h00000020;
localparam SV_001_IM_REG_INIT = 32'h00000000;

localparam SV_010_RE_REG_ADDR = 32'h00000024;
localparam SV_010_RE_REG_INIT = 32'h000017AE;
localparam SV_010_IM_REG_ADDR = 32'h00000028;
localparam SV_010_IM_REG_INIT = 32'h0000FEB8;

localparam SV_011_RE_REG_ADDR = 32'h0000002C;
localparam SV_011_RE_REG_INIT = 32'h0000E999;
localparam SV_011_IM_REG_ADDR = 32'h00000030;
localparam SV_011_IM_REG_INIT = 32'h0000028F;

localparam SV_100_RE_REG_ADDR = 32'h00000034;
localparam SV_100_RE_REG_INIT = 32'h00001333;
localparam SV_100_IM_REG_ADDR = 32'h00000038;
localparam SV_100_IM_REG_INIT = 32'h0000FEB8;

localparam SV_101_RE_REG_ADDR = 32'h0000003C;
localparam SV_101_RE_REG_INIT = 32'h0000EA3D;
localparam SV_101_IM_REG_ADDR = 32'h00000040;
localparam SV_101_IM_REG_INIT = 32'h00000000;

localparam SV_110_RE_REG_ADDR = 32'h00000044;
localparam SV_110_RE_REG_INIT = 32'h000017AE;
localparam SV_110_IM_REG_ADDR = 32'h00000048;
localparam SV_110_IM_REG_INIT = 32'h0000FD70;

localparam SV_111_RE_REG_ADDR = 32'h0000004C;
localparam SV_111_RE_REG_INIT = 32'h0000E5C2;
localparam SV_111_IM_REG_ADDR = 32'h00000050;
localparam SV_111_IM_REG_INIT = 32'h00000000;
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group UUT /tb_qc_sim_top/uut/QUBITS
add wave -noupdate -group UUT /tb_qc_sim_top/uut/DATA_WIDTH
add wave -noupdate -group UUT /tb_qc_sim_top/uut/ADDR_WIDTH
add wave -noupdate -group UUT /tb_qc_sim_top/uut/CLK_FREQ
add wave -noupdate -group UUT /tb_qc_sim_top/uut/BAUD
add wave -noupdate -group UUT /tb_qc_sim_top/uut/STATES
add wave -noupdate -group UUT /tb_qc_sim_top/uut/clk_i
add wave -noupdate -group UUT /tb_qc_sim_top/uut/rst_ni
add wave -noupdate -group UUT /tb_qc_sim_top/uut/measure_ni
add wave -noupdate -group UUT /tb_qc_sim_top/uut/uart_rx_i
add wave -noupdate -group UUT /tb_qc_sim_top/uut/uart_tx_o
add wave -noupdate -group UUT /tb_qc_sim_top/uut/hex_0_o
add wave -noupdate -group UUT /tb_qc_sim_top/uut/init_sv_re
add wave -noupdate -group UUT /tb_qc_sim_top/uut/init_sv_im
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u0_re
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u0_im
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u0_sv_re
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u0_sv_im
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u1_re
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u1_im
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u1_sv_re
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u1_sv_im
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u2_re
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u2_im
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u2_sv_re
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u2_sv_im
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u3_re
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u3_im
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u3_sv_re
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u3_sv_im
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u4_re
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u4_im
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u4_sv_re
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u4_sv_im
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u5_re
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u5_im
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u5_sv_re
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u5_sv_im
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u6_re
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u6_im
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u6_sv_re
add wave -noupdate -group UUT /tb_qc_sim_top/uut/u6_sv_im
add wave -noupdate -group UUT /tb_qc_sim_top/uut/sync_measure_n
add wave -noupdate -group UUT /tb_qc_sim_top/uut/sync_rst_n
add wave -noupdate -group UUT /tb_qc_sim_top/uut/rst_n
add wave -noupdate -group UUT /tb_qc_sim_top/uut/pseudo_rng
add wave -noupdate -group UUT /tb_qc_sim_top/uut/prob_reg
add wave -noupdate -group UUT /tb_qc_sim_top/uut/prob_weight_reg
add wave -noupdate -group UUT /tb_qc_sim_top/uut/cbits
add wave -noupdate -group UUT /tb_qc_sim_top/uut/measure
add wave -noupdate -group UUT /tb_qc_sim_top/uut/stream_measure
add wave -noupdate -group UUT /tb_qc_sim_top/uut/reg_ready
add wave -noupdate -group UUT /tb_qc_sim_top/uut/tx_ready
add wave -noupdate -group UUT /tb_qc_sim_top/uut/tx_done
add wave -noupdate -group UUT /tb_qc_sim_top/uut/uart_tx_reg
add wave -noupdate -group UUT /tb_qc_sim_top/uut/uart_rx_cmd
add wave -noupdate -group UUT /tb_qc_sim_top/uut/uart_rx_reg
add wave -noupdate -group UUT /tb_qc_sim_top/uut/uart_rx_data
add wave -noupdate -group UUT /tb_qc_sim_top/uut/lite_reg_ready
add wave -noupdate -group UUT /tb_qc_sim_top/uut/lite_tx_ready
add wave -noupdate -group UUT /tb_qc_sim_top/uut/lite_tx_done
add wave -noupdate -group UUT /tb_qc_sim_top/uut/lite_uart_tx_reg
add wave -noupdate -group UUT /tb_qc_sim_top/uut/lite_uart_rx_cmd
add wave -noupdate -group UUT /tb_qc_sim_top/uut/lite_uart_rx_reg
add wave -noupdate -group UUT /tb_qc_sim_top/uut/lite_uart_rx_data
add wave -noupdate -group UUT /tb_qc_sim_top/uut/stream_tx_ready
add wave -noupdate -group UUT /tb_qc_sim_top/uut/stream_tx_done
add wave -noupdate -group UUT /tb_qc_sim_top/uut/stream_uart_tx_reg
add wave -noupdate -group UUT /tb_qc_sim_top/uut/stream_uart_rx_cmd
add wave -noupdate -group UUT /tb_qc_sim_top/uut/araddr
add wave -noupdate -group UUT /tb_qc_sim_top/uut/arvalid
add wave -noupdate -group UUT /tb_qc_sim_top/uut/arready
add wave -noupdate -group UUT /tb_qc_sim_top/uut/rdata
add wave -noupdate -group UUT /tb_qc_sim_top/uut/rvalid
add wave -noupdate -group UUT /tb_qc_sim_top/uut/rready
add wave -noupdate -group UUT /tb_qc_sim_top/uut/awaddr
add wave -noupdate -group UUT /tb_qc_sim_top/uut/awvalid
add wave -noupdate -group UUT /tb_qc_sim_top/uut/awready
add wave -noupdate -group UUT /tb_qc_sim_top/uut/wdata
add wave -noupdate -group UUT /tb_qc_sim_top/uut/wready
add wave -noupdate -group UUT /tb_qc_sim_top/uut/wvalid
add wave -noupdate -group UUT /tb_qc_sim_top/uut/control_reg
add wave -noupdate -group UUT /tb_qc_sim_top/uut/result_reg
add wave -noupdate -group TB /tb_qc_sim_top/FPGA_CLK_SPEED
add wave -noupdate -group TB /tb_qc_sim_top/BAUD_RATE
add wave -noupdate -group TB /tb_qc_sim_top/CMD_READ
add wave -noupdate -group TB /tb_qc_sim_top/CMD_WRITE
add wave -noupdate -group TB /tb_qc_sim_top/fpga_clk
add wave -noupdate -group TB /tb_qc_sim_top/fpga_rst_n
add wave -noupdate -group TB /tb_qc_sim_top/fpga_measure_n
add wave -noupdate -group TB /tb_qc_sim_top/pc_tx_uut_rx
add wave -noupdate -group TB /tb_qc_sim_top/pc_rx_uut_tx
add wave -noupdate -group TB /tb_qc_sim_top/temp_uart_rx_reg
add wave -noupdate -group TB /tb_qc_sim_top/data_uart_rx_reg
add wave -noupdate -group TB /tb_qc_sim_top/hex_0
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/CLK_FREQ
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/BAUD
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/CLK_RATE
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/COUNT_BIT
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/clk_i
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/rst_ni
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/uart_rx_i
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/uart_tx_o
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/uart_tx_reg_i
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/uart_rx_reg_o
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/tx_start_i
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/tx_busy_o
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/data_valid_o
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/rx_buf
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/rx_tick_d
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/rx_tick_q
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/rx_bit_cnt_d
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/rx_bit_cnt_q
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/rx_shift_d
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/rx_shift_q
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/tx_tick_d
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/tx_tick_q
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/tx_bit_cnt_d
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/tx_bit_cnt_q
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/tx_shift_d
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/tx_shift_q
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/uartrx_state_d
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/uartrx_state_q
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/uarttx_state_d
add wave -noupdate -group UART /tb_qc_sim_top/uut/uart_if/pc_uart/uarttx_state_q
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/DATA_WIDTH
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/ADDR_WIDTH
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/CLK_FREQ
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/BAUD
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/ADDR_BYTE
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/ADDR_COUNT_BIT
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/DATA_BYTE
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/DATA_COUNT_BIT
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/CMD_READ
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/CMD_WRITE
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/CMD_STREAM
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/CMD_STOP
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/clk_i
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/rst_ni
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/uart_tx_reg_i
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/uart_rx_cmd_o
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/uart_rx_reg_o
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/uart_rx_data_o
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/uart_rx_i
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/uart_tx_o
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/reg_ready_o
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/tx_ready_i
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/tx_done_o
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/uart_tx_reg
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/uart_rx_reg
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/tx_start
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/tx_busy
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/data_valid
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/uart_tx_reg_d
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/uart_tx_reg_q
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/uart_rx_cmd_q
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/uart_rx_reg_q
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/uart_rx_data_q
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/addr_byte_cnt_d
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/addr_byte_cnt_q
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/rx_data_byte_cnt_d
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/rx_data_byte_cnt_q
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/tx_data_byte_cnt_d
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/tx_data_byte_cnt_q
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/uartrx_state_d
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/uartrx_state_q
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/uarttx_state_d
add wave -noupdate -group {UART Control} /tb_qc_sim_top/uut/uart_if/uarttx_state_q
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/DATA_WIDTH
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/ADDR_WIDTH
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/ADDR_BYTE
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/ADDR_COUNT_BIT
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/DATA_BYTE
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/DATA_COUNT_BIT
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/CMD_READ
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/CMD_WRITE
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/CMD_STREAM
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/CMD_STOP
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/clk_i
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/rst_ni
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/uart_tx_reg_o
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/uart_rx_cmd_i
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/uart_rx_reg_i
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/uart_rx_data_i
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/reg_ready_i
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/tx_ready_o
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/tx_done_i
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/lite_uart_tx_reg_i
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/lite_uart_rx_cmd_o
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/lite_uart_rx_reg_o
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/lite_uart_rx_data_o
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/lite_reg_ready_o
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/lite_tx_ready_i
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/lite_tx_done_o
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/stream_uart_tx_reg_i
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/stream_uart_rx_cmd_o
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/stream_tx_ready_i
add wave -noupdate -group Crossbar /tb_qc_sim_top/uut/crossbar/stream_tx_done_o
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/DATA_WIDTH
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/ADDR_WIDTH
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/CMD_READ
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/CMD_WRITE
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/CMD_STREAM
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/CMD_STOP
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/aclk_i
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/arst_ni
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/araddr_o
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/arvalid_o
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/arready_i
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/rdata_i
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/rvalid_i
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/rready_o
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/awaddr_o
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/awvalid_o
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/awready_i
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/wdata_o
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/wready_i
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/wvalid_o
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/uart_tx_reg_o
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/uart_rx_cmd_i
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/uart_rx_reg_i
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/uart_rx_data_i
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/reg_ready_i
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/tx_done_i
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/tx_ready_o
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/uartaxi_state_d
add wave -noupdate -group {AXI Control} /tb_qc_sim_top/uut/axi_lite_controller/uartaxi_state_q
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/DATA_WIDTH
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/ADDR_WIDTH
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/ADDR_BYTE
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/ADDR_COUNT_BIT
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/DATA_BYTE
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/DATA_COUNT_BIT
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/CMD_READ
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/CMD_WRITE
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/CMD_STREAM
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/CMD_STOP
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/clk_i
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/rst_ni
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/result_reg_i
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/stream_uart_tx_reg_o
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/stream_uart_rx_cmd_i
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/stream_tx_ready_o
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/stream_tx_done_i
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/measure_o
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/stream_state_d
add wave -noupdate -group Stream /tb_qc_sim_top/uut/stream_controller/stream_state_q
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/aclk_i
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/arst_ni
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/araddr_i
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/arvalid_i
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/arready_o
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/rdata_o
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/rvalid_o
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/rready_i
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/awaddr_i
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/awvalid_i
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/awready_o
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/wdata_i
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/wready_o
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/wvalid_i
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/control_reg_o
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/result_reg_i
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/araddr_d
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/araddr_q
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/awaddr_d
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/awaddr_q
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/read_state_d
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/read_state_q
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/write_state_d
add wave -noupdate -group {AXI REG} /tb_qc_sim_top/uut/axi_reg_if/write_state_q
add wave -noupdate -group U0_H /tb_qc_sim_top/uut/u0_h_q2/QUBITS
add wave -noupdate -group U0_H /tb_qc_sim_top/uut/u0_h_q2/BITMASK
add wave -noupdate -group U0_H /tb_qc_sim_top/uut/u0_h_q2/STATES
add wave -noupdate -group U0_H /tb_qc_sim_top/uut/u0_h_q2/GATES
add wave -noupdate -group U0_H /tb_qc_sim_top/uut/u0_h_q2/re_i
add wave -noupdate -group U0_H /tb_qc_sim_top/uut/u0_h_q2/im_i
add wave -noupdate -group U0_H /tb_qc_sim_top/uut/u0_h_q2/re_o
add wave -noupdate -group U0_H /tb_qc_sim_top/uut/u0_h_q2/im_o
add wave -noupdate -group U0_H /tb_qc_sim_top/uut/u0_h_q2/re_temp
add wave -noupdate -group U0_H /tb_qc_sim_top/uut/u0_h_q2/im_temp
add wave -noupdate -group U0_H /tb_qc_sim_top/uut/u0_h_q2/sqrt_2_n
add wave -noupdate -group U0_SV /tb_qc_sim_top/uut/u0_state_vector/QUBITS
add wave -noupdate -group U0_SV /tb_qc_sim_top/uut/u0_state_vector/STATES
add wave -noupdate -group U0_SV /tb_qc_sim_top/uut/u0_state_vector/clk_i
add wave -noupdate -group U0_SV /tb_qc_sim_top/uut/u0_state_vector/rst_ni
add wave -noupdate -group U0_SV /tb_qc_sim_top/uut/u0_state_vector/wr_en_i
add wave -noupdate -group U0_SV -radix sfixed /tb_qc_sim_top/uut/u0_state_vector/re_i
add wave -noupdate -group U0_SV -radix sfixed /tb_qc_sim_top/uut/u0_state_vector/im_i
add wave -noupdate -group U0_SV -radix sfixed -childformat {{{/tb_qc_sim_top/uut/u0_state_vector/re_o[0]} -radix sfixed} {{/tb_qc_sim_top/uut/u0_state_vector/re_o[1]} -radix sfixed} {{/tb_qc_sim_top/uut/u0_state_vector/re_o[2]} -radix sfixed} {{/tb_qc_sim_top/uut/u0_state_vector/re_o[3]} -radix sfixed} {{/tb_qc_sim_top/uut/u0_state_vector/re_o[4]} -radix sfixed} {{/tb_qc_sim_top/uut/u0_state_vector/re_o[5]} -radix sfixed} {{/tb_qc_sim_top/uut/u0_state_vector/re_o[6]} -radix sfixed} {{/tb_qc_sim_top/uut/u0_state_vector/re_o[7]} -radix sfixed}} -expand -subitemconfig {{/tb_qc_sim_top/uut/u0_state_vector/re_o[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u0_state_vector/re_o[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u0_state_vector/re_o[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u0_state_vector/re_o[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u0_state_vector/re_o[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u0_state_vector/re_o[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u0_state_vector/re_o[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u0_state_vector/re_o[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/u0_state_vector/re_o
add wave -noupdate -group U0_SV -radix sfixed -childformat {{{/tb_qc_sim_top/uut/u0_state_vector/im_o[0]} -radix sfixed} {{/tb_qc_sim_top/uut/u0_state_vector/im_o[1]} -radix sfixed} {{/tb_qc_sim_top/uut/u0_state_vector/im_o[2]} -radix sfixed} {{/tb_qc_sim_top/uut/u0_state_vector/im_o[3]} -radix sfixed} {{/tb_qc_sim_top/uut/u0_state_vector/im_o[4]} -radix sfixed} {{/tb_qc_sim_top/uut/u0_state_vector/im_o[5]} -radix sfixed} {{/tb_qc_sim_top/uut/u0_state_vector/im_o[6]} -radix sfixed} {{/tb_qc_sim_top/uut/u0_state_vector/im_o[7]} -radix sfixed}} -expand -subitemconfig {{/tb_qc_sim_top/uut/u0_state_vector/im_o[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u0_state_vector/im_o[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u0_state_vector/im_o[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u0_state_vector/im_o[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u0_state_vector/im_o[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u0_state_vector/im_o[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u0_state_vector/im_o[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u0_state_vector/im_o[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/u0_state_vector/im_o
add wave -noupdate -group U1_Rpi2 /tb_qc_sim_top/uut/u1_rpi2_q1q2/QUBITS
add wave -noupdate -group U1_Rpi2 /tb_qc_sim_top/uut/u1_rpi2_q1q2/CONTROL
add wave -noupdate -group U1_Rpi2 /tb_qc_sim_top/uut/u1_rpi2_q1q2/TARGET
add wave -noupdate -group U1_Rpi2 /tb_qc_sim_top/uut/u1_rpi2_q1q2/STATES
add wave -noupdate -group U1_Rpi2 /tb_qc_sim_top/uut/u1_rpi2_q1q2/re_i
add wave -noupdate -group U1_Rpi2 /tb_qc_sim_top/uut/u1_rpi2_q1q2/im_i
add wave -noupdate -group U1_Rpi2 /tb_qc_sim_top/uut/u1_rpi2_q1q2/re_o
add wave -noupdate -group U1_Rpi2 /tb_qc_sim_top/uut/u1_rpi2_q1q2/im_o
add wave -noupdate -group U1_Rpi2 /tb_qc_sim_top/uut/u1_rpi2_q1q2/re_temp
add wave -noupdate -group U1_Rpi2 /tb_qc_sim_top/uut/u1_rpi2_q1q2/im_temp
add wave -noupdate -group U1_SV /tb_qc_sim_top/uut/u1_state_vector/QUBITS
add wave -noupdate -group U1_SV /tb_qc_sim_top/uut/u1_state_vector/STATES
add wave -noupdate -group U1_SV /tb_qc_sim_top/uut/u1_state_vector/clk_i
add wave -noupdate -group U1_SV /tb_qc_sim_top/uut/u1_state_vector/rst_ni
add wave -noupdate -group U1_SV /tb_qc_sim_top/uut/u1_state_vector/wr_en_i
add wave -noupdate -group U1_SV -radix sfixed /tb_qc_sim_top/uut/u1_state_vector/re_i
add wave -noupdate -group U1_SV -radix sfixed /tb_qc_sim_top/uut/u1_state_vector/im_i
add wave -noupdate -group U1_SV -radix sfixed -childformat {{{/tb_qc_sim_top/uut/u1_state_vector/re_o[0]} -radix sfixed} {{/tb_qc_sim_top/uut/u1_state_vector/re_o[1]} -radix sfixed} {{/tb_qc_sim_top/uut/u1_state_vector/re_o[2]} -radix sfixed} {{/tb_qc_sim_top/uut/u1_state_vector/re_o[3]} -radix sfixed} {{/tb_qc_sim_top/uut/u1_state_vector/re_o[4]} -radix sfixed} {{/tb_qc_sim_top/uut/u1_state_vector/re_o[5]} -radix sfixed} {{/tb_qc_sim_top/uut/u1_state_vector/re_o[6]} -radix sfixed} {{/tb_qc_sim_top/uut/u1_state_vector/re_o[7]} -radix sfixed}} -expand -subitemconfig {{/tb_qc_sim_top/uut/u1_state_vector/re_o[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u1_state_vector/re_o[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u1_state_vector/re_o[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u1_state_vector/re_o[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u1_state_vector/re_o[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u1_state_vector/re_o[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u1_state_vector/re_o[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u1_state_vector/re_o[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/u1_state_vector/re_o
add wave -noupdate -group U1_SV -radix sfixed -childformat {{{/tb_qc_sim_top/uut/u1_state_vector/im_o[0]} -radix sfixed} {{/tb_qc_sim_top/uut/u1_state_vector/im_o[1]} -radix sfixed} {{/tb_qc_sim_top/uut/u1_state_vector/im_o[2]} -radix sfixed} {{/tb_qc_sim_top/uut/u1_state_vector/im_o[3]} -radix sfixed} {{/tb_qc_sim_top/uut/u1_state_vector/im_o[4]} -radix sfixed} {{/tb_qc_sim_top/uut/u1_state_vector/im_o[5]} -radix sfixed} {{/tb_qc_sim_top/uut/u1_state_vector/im_o[6]} -radix sfixed} {{/tb_qc_sim_top/uut/u1_state_vector/im_o[7]} -radix sfixed}} -expand -subitemconfig {{/tb_qc_sim_top/uut/u1_state_vector/im_o[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u1_state_vector/im_o[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u1_state_vector/im_o[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u1_state_vector/im_o[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u1_state_vector/im_o[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u1_state_vector/im_o[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u1_state_vector/im_o[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u1_state_vector/im_o[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/u1_state_vector/im_o
add wave -noupdate -group U2_Rpi4 /tb_qc_sim_top/uut/u2_rpi4_q0q2/QUBITS
add wave -noupdate -group U2_Rpi4 /tb_qc_sim_top/uut/u2_rpi4_q0q2/CONTROL
add wave -noupdate -group U2_Rpi4 /tb_qc_sim_top/uut/u2_rpi4_q0q2/TARGET
add wave -noupdate -group U2_Rpi4 /tb_qc_sim_top/uut/u2_rpi4_q0q2/STATES
add wave -noupdate -group U2_Rpi4 /tb_qc_sim_top/uut/u2_rpi4_q0q2/re_i
add wave -noupdate -group U2_Rpi4 /tb_qc_sim_top/uut/u2_rpi4_q0q2/im_i
add wave -noupdate -group U2_Rpi4 /tb_qc_sim_top/uut/u2_rpi4_q0q2/re_o
add wave -noupdate -group U2_Rpi4 /tb_qc_sim_top/uut/u2_rpi4_q0q2/im_o
add wave -noupdate -group U2_Rpi4 /tb_qc_sim_top/uut/u2_rpi4_q0q2/SQRT2_2
add wave -noupdate -group U2_Rpi4 /tb_qc_sim_top/uut/u2_rpi4_q0q2/re_temp
add wave -noupdate -group U2_Rpi4 /tb_qc_sim_top/uut/u2_rpi4_q0q2/im_temp
add wave -noupdate -group U2_SV /tb_qc_sim_top/uut/u2_state_vector/QUBITS
add wave -noupdate -group U2_SV /tb_qc_sim_top/uut/u2_state_vector/STATES
add wave -noupdate -group U2_SV /tb_qc_sim_top/uut/u2_state_vector/clk_i
add wave -noupdate -group U2_SV /tb_qc_sim_top/uut/u2_state_vector/rst_ni
add wave -noupdate -group U2_SV /tb_qc_sim_top/uut/u2_state_vector/wr_en_i
add wave -noupdate -group U2_SV -radix sfixed -childformat {{{/tb_qc_sim_top/uut/u2_state_vector/re_i[0]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/re_i[1]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/re_i[2]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/re_i[3]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/re_i[4]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/re_i[5]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/re_i[6]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/re_i[7]} -radix sfixed}} -expand -subitemconfig {{/tb_qc_sim_top/uut/u2_state_vector/re_i[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/re_i[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/re_i[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/re_i[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/re_i[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/re_i[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/re_i[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/re_i[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/u2_state_vector/re_i
add wave -noupdate -group U2_SV -radix sfixed /tb_qc_sim_top/uut/u2_state_vector/im_i
add wave -noupdate -group U2_SV -radix sfixed -childformat {{{/tb_qc_sim_top/uut/u2_state_vector/re_o[0]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/re_o[1]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/re_o[2]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/re_o[3]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/re_o[4]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/re_o[5]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/re_o[6]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/re_o[7]} -radix sfixed}} -expand -subitemconfig {{/tb_qc_sim_top/uut/u2_state_vector/re_o[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/re_o[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/re_o[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/re_o[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/re_o[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/re_o[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/re_o[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/re_o[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/u2_state_vector/re_o
add wave -noupdate -group U2_SV -radix sfixed -childformat {{{/tb_qc_sim_top/uut/u2_state_vector/im_o[0]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/im_o[1]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/im_o[2]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/im_o[3]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/im_o[4]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/im_o[5]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/im_o[6]} -radix sfixed} {{/tb_qc_sim_top/uut/u2_state_vector/im_o[7]} -radix sfixed}} -expand -subitemconfig {{/tb_qc_sim_top/uut/u2_state_vector/im_o[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/im_o[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/im_o[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/im_o[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/im_o[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/im_o[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/im_o[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u2_state_vector/im_o[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/u2_state_vector/im_o
add wave -noupdate -group U3_H /tb_qc_sim_top/uut/u3_h_q1/QUBITS
add wave -noupdate -group U3_H /tb_qc_sim_top/uut/u3_h_q1/BITMASK
add wave -noupdate -group U3_H /tb_qc_sim_top/uut/u3_h_q1/STATES
add wave -noupdate -group U3_H /tb_qc_sim_top/uut/u3_h_q1/GATES
add wave -noupdate -group U3_H -radix sfixed /tb_qc_sim_top/uut/u3_h_q1/re_i
add wave -noupdate -group U3_H -radix sfixed /tb_qc_sim_top/uut/u3_h_q1/im_i
add wave -noupdate -group U3_H -radix sfixed -childformat {{{/tb_qc_sim_top/uut/u3_h_q1/re_o[0]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_h_q1/re_o[1]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_h_q1/re_o[2]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_h_q1/re_o[3]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_h_q1/re_o[4]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_h_q1/re_o[5]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_h_q1/re_o[6]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_h_q1/re_o[7]} -radix sfixed}} -expand -subitemconfig {{/tb_qc_sim_top/uut/u3_h_q1/re_o[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_h_q1/re_o[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_h_q1/re_o[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_h_q1/re_o[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_h_q1/re_o[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_h_q1/re_o[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_h_q1/re_o[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_h_q1/re_o[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/u3_h_q1/re_o
add wave -noupdate -group U3_H -radix sfixed -childformat {{{/tb_qc_sim_top/uut/u3_h_q1/im_o[0]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_h_q1/im_o[1]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_h_q1/im_o[2]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_h_q1/im_o[3]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_h_q1/im_o[4]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_h_q1/im_o[5]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_h_q1/im_o[6]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_h_q1/im_o[7]} -radix sfixed}} -expand -subitemconfig {{/tb_qc_sim_top/uut/u3_h_q1/im_o[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_h_q1/im_o[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_h_q1/im_o[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_h_q1/im_o[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_h_q1/im_o[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_h_q1/im_o[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_h_q1/im_o[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_h_q1/im_o[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/u3_h_q1/im_o
add wave -noupdate -group U3_H -radix sfixed /tb_qc_sim_top/uut/u3_h_q1/re_temp
add wave -noupdate -group U3_H -radix sfixed /tb_qc_sim_top/uut/u3_h_q1/im_temp
add wave -noupdate -group U3_H -radix sfixed /tb_qc_sim_top/uut/u3_h_q1/sqrt_2_n
add wave -noupdate -group U3_SV /tb_qc_sim_top/uut/u3_state_vector/QUBITS
add wave -noupdate -group U3_SV /tb_qc_sim_top/uut/u3_state_vector/STATES
add wave -noupdate -group U3_SV /tb_qc_sim_top/uut/u3_state_vector/clk_i
add wave -noupdate -group U3_SV /tb_qc_sim_top/uut/u3_state_vector/rst_ni
add wave -noupdate -group U3_SV /tb_qc_sim_top/uut/u3_state_vector/wr_en_i
add wave -noupdate -group U3_SV -radix sfixed /tb_qc_sim_top/uut/u3_state_vector/re_i
add wave -noupdate -group U3_SV -radix sfixed /tb_qc_sim_top/uut/u3_state_vector/im_i
add wave -noupdate -group U3_SV -radix sfixed -childformat {{{/tb_qc_sim_top/uut/u3_state_vector/re_o[0]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_state_vector/re_o[1]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_state_vector/re_o[2]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_state_vector/re_o[3]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_state_vector/re_o[4]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_state_vector/re_o[5]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_state_vector/re_o[6]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_state_vector/re_o[7]} -radix sfixed}} -expand -subitemconfig {{/tb_qc_sim_top/uut/u3_state_vector/re_o[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_state_vector/re_o[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_state_vector/re_o[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_state_vector/re_o[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_state_vector/re_o[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_state_vector/re_o[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_state_vector/re_o[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_state_vector/re_o[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/u3_state_vector/re_o
add wave -noupdate -group U3_SV -radix sfixed -childformat {{{/tb_qc_sim_top/uut/u3_state_vector/im_o[0]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_state_vector/im_o[1]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_state_vector/im_o[2]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_state_vector/im_o[3]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_state_vector/im_o[4]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_state_vector/im_o[5]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_state_vector/im_o[6]} -radix sfixed} {{/tb_qc_sim_top/uut/u3_state_vector/im_o[7]} -radix sfixed}} -expand -subitemconfig {{/tb_qc_sim_top/uut/u3_state_vector/im_o[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_state_vector/im_o[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_state_vector/im_o[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_state_vector/im_o[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_state_vector/im_o[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_state_vector/im_o[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_state_vector/im_o[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u3_state_vector/im_o[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/u3_state_vector/im_o
add wave -noupdate -group U4_Rpi2 /tb_qc_sim_top/uut/u4_rpi2_q0q1/QUBITS
add wave -noupdate -group U4_Rpi2 /tb_qc_sim_top/uut/u4_rpi2_q0q1/CONTROL
add wave -noupdate -group U4_Rpi2 /tb_qc_sim_top/uut/u4_rpi2_q0q1/TARGET
add wave -noupdate -group U4_Rpi2 /tb_qc_sim_top/uut/u4_rpi2_q0q1/STATES
add wave -noupdate -group U4_Rpi2 /tb_qc_sim_top/uut/u4_rpi2_q0q1/re_i
add wave -noupdate -group U4_Rpi2 /tb_qc_sim_top/uut/u4_rpi2_q0q1/im_i
add wave -noupdate -group U4_Rpi2 /tb_qc_sim_top/uut/u4_rpi2_q0q1/re_o
add wave -noupdate -group U4_Rpi2 /tb_qc_sim_top/uut/u4_rpi2_q0q1/im_o
add wave -noupdate -group U4_Rpi2 /tb_qc_sim_top/uut/u4_rpi2_q0q1/re_temp
add wave -noupdate -group U4_Rpi2 /tb_qc_sim_top/uut/u4_rpi2_q0q1/im_temp
add wave -noupdate -group U4_SV /tb_qc_sim_top/uut/u4_state_vector/QUBITS
add wave -noupdate -group U4_SV /tb_qc_sim_top/uut/u4_state_vector/STATES
add wave -noupdate -group U4_SV /tb_qc_sim_top/uut/u4_state_vector/clk_i
add wave -noupdate -group U4_SV /tb_qc_sim_top/uut/u4_state_vector/rst_ni
add wave -noupdate -group U4_SV /tb_qc_sim_top/uut/u4_state_vector/wr_en_i
add wave -noupdate -group U4_SV -radix sfixed /tb_qc_sim_top/uut/u4_state_vector/re_i
add wave -noupdate -group U4_SV -radix sfixed /tb_qc_sim_top/uut/u4_state_vector/im_i
add wave -noupdate -group U4_SV -radix sfixed -childformat {{{/tb_qc_sim_top/uut/u4_state_vector/re_o[0]} -radix sfixed} {{/tb_qc_sim_top/uut/u4_state_vector/re_o[1]} -radix sfixed} {{/tb_qc_sim_top/uut/u4_state_vector/re_o[2]} -radix sfixed} {{/tb_qc_sim_top/uut/u4_state_vector/re_o[3]} -radix sfixed} {{/tb_qc_sim_top/uut/u4_state_vector/re_o[4]} -radix sfixed} {{/tb_qc_sim_top/uut/u4_state_vector/re_o[5]} -radix sfixed} {{/tb_qc_sim_top/uut/u4_state_vector/re_o[6]} -radix sfixed} {{/tb_qc_sim_top/uut/u4_state_vector/re_o[7]} -radix sfixed}} -expand -subitemconfig {{/tb_qc_sim_top/uut/u4_state_vector/re_o[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u4_state_vector/re_o[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u4_state_vector/re_o[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u4_state_vector/re_o[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u4_state_vector/re_o[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u4_state_vector/re_o[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u4_state_vector/re_o[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u4_state_vector/re_o[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/u4_state_vector/re_o
add wave -noupdate -group U4_SV -radix sfixed -childformat {{{/tb_qc_sim_top/uut/u4_state_vector/im_o[0]} -radix sfixed} {{/tb_qc_sim_top/uut/u4_state_vector/im_o[1]} -radix sfixed} {{/tb_qc_sim_top/uut/u4_state_vector/im_o[2]} -radix sfixed} {{/tb_qc_sim_top/uut/u4_state_vector/im_o[3]} -radix sfixed} {{/tb_qc_sim_top/uut/u4_state_vector/im_o[4]} -radix sfixed} {{/tb_qc_sim_top/uut/u4_state_vector/im_o[5]} -radix sfixed} {{/tb_qc_sim_top/uut/u4_state_vector/im_o[6]} -radix sfixed} {{/tb_qc_sim_top/uut/u4_state_vector/im_o[7]} -radix sfixed}} -expand -subitemconfig {{/tb_qc_sim_top/uut/u4_state_vector/im_o[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u4_state_vector/im_o[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u4_state_vector/im_o[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u4_state_vector/im_o[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u4_state_vector/im_o[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u4_state_vector/im_o[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u4_state_vector/im_o[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u4_state_vector/im_o[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/u4_state_vector/im_o
add wave -noupdate -group U5_H /tb_qc_sim_top/uut/u5_h_q0/QUBITS
add wave -noupdate -group U5_H /tb_qc_sim_top/uut/u5_h_q0/BITMASK
add wave -noupdate -group U5_H /tb_qc_sim_top/uut/u5_h_q0/STATES
add wave -noupdate -group U5_H /tb_qc_sim_top/uut/u5_h_q0/GATES
add wave -noupdate -group U5_H /tb_qc_sim_top/uut/u5_h_q0/re_i
add wave -noupdate -group U5_H /tb_qc_sim_top/uut/u5_h_q0/im_i
add wave -noupdate -group U5_H /tb_qc_sim_top/uut/u5_h_q0/re_o
add wave -noupdate -group U5_H /tb_qc_sim_top/uut/u5_h_q0/im_o
add wave -noupdate -group U5_H /tb_qc_sim_top/uut/u5_h_q0/re_temp
add wave -noupdate -group U5_H /tb_qc_sim_top/uut/u5_h_q0/im_temp
add wave -noupdate -group U5_H /tb_qc_sim_top/uut/u5_h_q0/sqrt_2_n
add wave -noupdate -group U5_SV /tb_qc_sim_top/uut/u5_state_vector/QUBITS
add wave -noupdate -group U5_SV /tb_qc_sim_top/uut/u5_state_vector/STATES
add wave -noupdate -group U5_SV /tb_qc_sim_top/uut/u5_state_vector/clk_i
add wave -noupdate -group U5_SV /tb_qc_sim_top/uut/u5_state_vector/rst_ni
add wave -noupdate -group U5_SV /tb_qc_sim_top/uut/u5_state_vector/wr_en_i
add wave -noupdate -group U5_SV -radix sfixed -childformat {{{/tb_qc_sim_top/uut/u5_state_vector/re_i[0]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/re_i[1]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/re_i[2]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/re_i[3]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/re_i[4]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/re_i[5]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/re_i[6]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/re_i[7]} -radix sfixed}} -subitemconfig {{/tb_qc_sim_top/uut/u5_state_vector/re_i[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/re_i[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/re_i[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/re_i[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/re_i[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/re_i[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/re_i[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/re_i[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/u5_state_vector/re_i
add wave -noupdate -group U5_SV -radix sfixed -childformat {{{/tb_qc_sim_top/uut/u5_state_vector/im_i[0]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/im_i[1]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/im_i[2]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/im_i[3]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/im_i[4]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/im_i[5]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/im_i[6]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/im_i[7]} -radix sfixed}} -subitemconfig {{/tb_qc_sim_top/uut/u5_state_vector/im_i[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/im_i[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/im_i[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/im_i[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/im_i[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/im_i[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/im_i[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/im_i[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/u5_state_vector/im_i
add wave -noupdate -group U5_SV -radix sfixed -childformat {{{/tb_qc_sim_top/uut/u5_state_vector/re_o[0]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/re_o[1]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/re_o[2]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/re_o[3]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/re_o[4]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/re_o[5]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/re_o[6]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/re_o[7]} -radix sfixed}} -expand -subitemconfig {{/tb_qc_sim_top/uut/u5_state_vector/re_o[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/re_o[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/re_o[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/re_o[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/re_o[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/re_o[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/re_o[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/re_o[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/u5_state_vector/re_o
add wave -noupdate -group U5_SV -radix sfixed -childformat {{{/tb_qc_sim_top/uut/u5_state_vector/im_o[0]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/im_o[1]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/im_o[2]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/im_o[3]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/im_o[4]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/im_o[5]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/im_o[6]} -radix sfixed} {{/tb_qc_sim_top/uut/u5_state_vector/im_o[7]} -radix sfixed}} -expand -subitemconfig {{/tb_qc_sim_top/uut/u5_state_vector/im_o[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/im_o[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/im_o[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/im_o[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/im_o[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/im_o[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/im_o[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/u5_state_vector/im_o[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/u5_state_vector/im_o
add wave -noupdate -group U6_Swap /tb_qc_sim_top/uut/u6_swap_q2q0/QUBITS
add wave -noupdate -group U6_Swap /tb_qc_sim_top/uut/u6_swap_q2q0/SWAP
add wave -noupdate -group U6_Swap /tb_qc_sim_top/uut/u6_swap_q2q0/STATES
add wave -noupdate -group U6_Swap /tb_qc_sim_top/uut/u6_swap_q2q0/re_i
add wave -noupdate -group U6_Swap /tb_qc_sim_top/uut/u6_swap_q2q0/im_i
add wave -noupdate -group U6_Swap /tb_qc_sim_top/uut/u6_swap_q2q0/re_o
add wave -noupdate -group U6_Swap /tb_qc_sim_top/uut/u6_swap_q2q0/im_o
add wave -noupdate -group U6_SV /tb_qc_sim_top/uut/u6_state_vector/QUBITS
add wave -noupdate -group U6_SV /tb_qc_sim_top/uut/u6_state_vector/STATES
add wave -noupdate -group U6_SV /tb_qc_sim_top/uut/u6_state_vector/clk_i
add wave -noupdate -group U6_SV /tb_qc_sim_top/uut/u6_state_vector/rst_ni
add wave -noupdate -group U6_SV /tb_qc_sim_top/uut/u6_state_vector/wr_en_i
add wave -noupdate -group U6_SV /tb_qc_sim_top/uut/u6_state_vector/re_i
add wave -noupdate -group U6_SV /tb_qc_sim_top/uut/u6_state_vector/im_i
add wave -noupdate -group U6_SV /tb_qc_sim_top/uut/u6_state_vector/re_o
add wave -noupdate -group U6_SV /tb_qc_sim_top/uut/u6_state_vector/im_o
add wave -noupdate -group RNG /tb_qc_sim_top/uut/rng_gen/rst_ni
add wave -noupdate -group RNG -radix sfixed /tb_qc_sim_top/uut/rng_gen/pseudo_rng_q
add wave -noupdate -group RNG -radix sfixed /tb_qc_sim_top/uut/rng_gen/pseudo_rng_o
add wave -noupdate -group RNG /tb_qc_sim_top/uut/rng_gen/parity
add wave -noupdate -group RNG /tb_qc_sim_top/uut/rng_gen/clk_i
add wave -noupdate -group Probability -radix sfixed /tb_qc_sim_top/uut/prob_sv/re_i
add wave -noupdate -group Probability -radix sfixed /tb_qc_sim_top/uut/prob_sv/im_i
add wave -noupdate -group Probability -radix sfixed /tb_qc_sim_top/uut/prob_sv/temp_reg
add wave -noupdate -group Probability -radix sfixed -childformat {{{/tb_qc_sim_top/uut/prob_sv/prob_o[0]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_sv/prob_o[1]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_sv/prob_o[2]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_sv/prob_o[3]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_sv/prob_o[4]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_sv/prob_o[5]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_sv/prob_o[6]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_sv/prob_o[7]} -radix sfixed}} -expand -subitemconfig {{/tb_qc_sim_top/uut/prob_sv/prob_o[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_sv/prob_o[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_sv/prob_o[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_sv/prob_o[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_sv/prob_o[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_sv/prob_o[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_sv/prob_o[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_sv/prob_o[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/prob_sv/prob_o
add wave -noupdate -group {Probability Weight} /tb_qc_sim_top/uut/prob_weights_sv/wr_en_i
add wave -noupdate -group {Probability Weight} -radix sfixed /tb_qc_sim_top/uut/prob_weights_sv/prob_i
add wave -noupdate -group {Probability Weight} -radix sfixed -childformat {{{/tb_qc_sim_top/uut/prob_weights_sv/prob_weight_o[0]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_weights_sv/prob_weight_o[1]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_weights_sv/prob_weight_o[2]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_weights_sv/prob_weight_o[3]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_weights_sv/prob_weight_o[4]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_weights_sv/prob_weight_o[5]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_weights_sv/prob_weight_o[6]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_weights_sv/prob_weight_o[7]} -radix sfixed}} -subitemconfig {{/tb_qc_sim_top/uut/prob_weights_sv/prob_weight_o[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_weights_sv/prob_weight_o[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_weights_sv/prob_weight_o[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_weights_sv/prob_weight_o[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_weights_sv/prob_weight_o[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_weights_sv/prob_weight_o[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_weights_sv/prob_weight_o[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_weights_sv/prob_weight_o[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/prob_weights_sv/prob_weight_o
add wave -noupdate -group {Probability Weight} -radix sfixed /tb_qc_sim_top/uut/prob_weights_sv/prob_windows
add wave -noupdate -group Measure /tb_qc_sim_top/uut/measure_sv/measure_i
add wave -noupdate -group Measure -radix sfixed /tb_qc_sim_top/uut/measure_sv/pseudo_rng_i
add wave -noupdate -group Measure -radix sfixed -childformat {{{/tb_qc_sim_top/uut/measure_sv/prob_windows_i[0]} -radix sfixed} {{/tb_qc_sim_top/uut/measure_sv/prob_windows_i[1]} -radix sfixed} {{/tb_qc_sim_top/uut/measure_sv/prob_windows_i[2]} -radix sfixed} {{/tb_qc_sim_top/uut/measure_sv/prob_windows_i[3]} -radix sfixed} {{/tb_qc_sim_top/uut/measure_sv/prob_windows_i[4]} -radix sfixed} {{/tb_qc_sim_top/uut/measure_sv/prob_windows_i[5]} -radix sfixed} {{/tb_qc_sim_top/uut/measure_sv/prob_windows_i[6]} -radix sfixed} {{/tb_qc_sim_top/uut/measure_sv/prob_windows_i[7]} -radix sfixed}} -subitemconfig {{/tb_qc_sim_top/uut/measure_sv/prob_windows_i[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/measure_sv/prob_windows_i[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/measure_sv/prob_windows_i[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/measure_sv/prob_windows_i[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/measure_sv/prob_windows_i[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/measure_sv/prob_windows_i[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/measure_sv/prob_windows_i[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/measure_sv/prob_windows_i[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/measure_sv/prob_windows_i
add wave -noupdate -group Measure -radix hexadecimal /tb_qc_sim_top/uut/measure_sv/cbits_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {976470776 ps} 0} {{Cursor 2} {682716310 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 150
configure wave -valuecolwidth 236
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {284499500 ps} {1376289500 ps}

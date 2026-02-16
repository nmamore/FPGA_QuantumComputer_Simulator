onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_qc_sim_top/fpga_rst_n
add wave -noupdate /tb_qc_sim_top/fpga_clk
add wave -noupdate -expand -group UUT -radix sfixed /tb_qc_sim_top/uut/init_sv_re
add wave -noupdate -expand -group UUT -radix sfixed /tb_qc_sim_top/uut/init_sv_im
add wave -noupdate -expand -group UUT -radix sfixed /tb_qc_sim_top/uut/u0_re
add wave -noupdate -expand -group UUT -radix sfixed /tb_qc_sim_top/uut/u0_im
add wave -noupdate -expand -group UUT -radix sfixed /tb_qc_sim_top/uut/u0_sv_re
add wave -noupdate -expand -group UUT -radix sfixed /tb_qc_sim_top/uut/u0_sv_im
add wave -noupdate -expand -group UUT -radix sfixed /tb_qc_sim_top/uut/pseudo_rng
add wave -noupdate -expand -group UUT -radix sfixed /tb_qc_sim_top/uut/prob_reg
add wave -noupdate -expand -group UUT -radix decimal /tb_qc_sim_top/uut/cbits
add wave -noupdate -expand -group {X Gate} -radix sfixed /tb_qc_sim_top/uut/u0_x/re_i
add wave -noupdate -expand -group {X Gate} -radix sfixed /tb_qc_sim_top/uut/u0_x/im_i
add wave -noupdate -expand -group {X Gate} -radix sfixed /tb_qc_sim_top/uut/u0_x/re_o
add wave -noupdate -expand -group {X Gate} -radix sfixed /tb_qc_sim_top/uut/u0_x/im_o
add wave -noupdate -expand -group {X Gate} /tb_qc_sim_top/uut/u0_x/bitmask_i
add wave -noupdate -expand -group {U0 SV} /tb_qc_sim_top/uut/u0_state_vector/wr_en_i
add wave -noupdate -expand -group {U0 SV} -radix sfixed /tb_qc_sim_top/uut/u0_state_vector/re_i
add wave -noupdate -expand -group {U0 SV} -radix sfixed /tb_qc_sim_top/uut/u0_state_vector/im_i
add wave -noupdate -expand -group {U0 SV} -radix sfixed /tb_qc_sim_top/uut/u0_state_vector/re_o
add wave -noupdate -expand -group {U0 SV} -radix sfixed /tb_qc_sim_top/uut/u0_state_vector/im_o
add wave -noupdate -expand -group RNG /tb_qc_sim_top/uut/rng_gen/rst_ni
add wave -noupdate -expand -group RNG /tb_qc_sim_top/uut/rng_gen/pseudo_rng_q
add wave -noupdate -expand -group RNG /tb_qc_sim_top/uut/rng_gen/pseudo_rng_o
add wave -noupdate -expand -group RNG /tb_qc_sim_top/uut/rng_gen/parity
add wave -noupdate -expand -group RNG /tb_qc_sim_top/uut/rng_gen/clk_i
add wave -noupdate -expand -group Probability -radix sfixed /tb_qc_sim_top/uut/prob_sv/re_i
add wave -noupdate -expand -group Probability -radix sfixed /tb_qc_sim_top/uut/prob_sv/im_i
add wave -noupdate -expand -group Probability -radix sfixed /tb_qc_sim_top/uut/prob_sv/temp_reg
add wave -noupdate -expand -group Probability -radix sfixed -childformat {{{/tb_qc_sim_top/uut/prob_sv/prob_o[0]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_sv/prob_o[1]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_sv/prob_o[2]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_sv/prob_o[3]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_sv/prob_o[4]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_sv/prob_o[5]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_sv/prob_o[6]} -radix sfixed} {{/tb_qc_sim_top/uut/prob_sv/prob_o[7]} -radix sfixed}} -expand -subitemconfig {{/tb_qc_sim_top/uut/prob_sv/prob_o[0]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_sv/prob_o[1]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_sv/prob_o[2]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_sv/prob_o[3]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_sv/prob_o[4]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_sv/prob_o[5]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_sv/prob_o[6]} {-height 15 -radix sfixed} {/tb_qc_sim_top/uut/prob_sv/prob_o[7]} {-height 15 -radix sfixed}} /tb_qc_sim_top/uut/prob_sv/prob_o
add wave -noupdate -expand -group Measure -radix sfixed /tb_qc_sim_top/uut/measure_sv/pseudo_rng_i
add wave -noupdate -expand -group Measure -radix sfixed /tb_qc_sim_top/uut/measure_sv/prob_i
add wave -noupdate -expand -group Measure -radix sfixed /tb_qc_sim_top/uut/measure_sv/prob_windows
add wave -noupdate -expand -group Measure /tb_qc_sim_top/uut/measure_sv/cbits_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10199081 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {1015 ps}

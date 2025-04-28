puts "set_db hdl_error_on_blackbox true" 
set_db hdl_error_on_blackbox true
puts "set_db max_cpus_per_server 8" 
set_db max_cpus_per_server 8
puts "set_db hdl_auto_sync_set_reset true" 
set_db hdl_auto_sync_set_reset true
puts "set_db hdl_unconnected_value none" 
set_db hdl_unconnected_value none
puts "read_mmmc /home/vmetta/Documents/JPEG_Decoder_Asic/build/syn-rundir/mmmc.tcl" 
read_mmmc /home/vmetta/Documents/JPEG_Decoder_Asic/build/syn-rundir/mmmc.tcl
puts "read_physical -lef { /home/vmetta/Documents/JPEG_Decoder_Asic/build/tech-sky130-cache/sky130_fd_sc_hd__nom.tlef /home/projects/ee477.2025wtr/cad/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef }" 
read_physical -lef { /home/vmetta/Documents/JPEG_Decoder_Asic/build/tech-sky130-cache/sky130_fd_sc_hd__nom.tlef /home/projects/ee477.2025wtr/cad/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef }
puts "read_hdl -sv { /home/vmetta/Documents/JPEG_Decoder_Asic/../common/v/bsg_guts.vh /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_defines.v /home/vmetta/Documents/basejump_stl/bsg_fsb/bsg_fsb_pkg.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_noc_links.vh /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_noc_pkg.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_mesh_router_pkg.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_counter_overflow_set_en.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_concentrate_static.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_unconcentrate_static.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_counter_set_down.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_array_concentrate_static.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_wormhole_router_pkg.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_wormhole_router.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_ready_and_link_async_to_wormhole.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_wormhole_router_decoder_dor.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_wormhole_router_input_control.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_wormhole_router_output_control.v /home/vmetta/Documents/basejump_stl/bsg_async/bsg_async_credit_counter.v /home/vmetta/Documents/basejump_stl/bsg_async/bsg_async_fifo.v /home/vmetta/Documents/basejump_stl/bsg_async/bsg_async_ptr_gray.v /home/vmetta/Documents/basejump_stl/bsg_async/bsg_launch_sync_sync.v /home/vmetta/Documents/basejump_stl/bsg_async/bsg_sync_sync.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_1_to_n_tagged.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_1_to_n_tagged_fifo.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_channel_narrow.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_channel_tunnel.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_channel_tunnel_in.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_channel_tunnel_out.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_narrowed.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_pseudo_large.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small_hardened.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small_unhardened.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_fifo_1rw_large.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_fifo_tracker.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_flatten_2D_array.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_make_2D_array.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_one_fifo.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_round_robin_1_to_n.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_round_robin_fifo_to_fifo.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_round_robin_n_to_1.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_sbox.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_scatter_gather.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_full.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_two_fifo.v /home/vmetta/Documents/basejump_stl/bsg_fsb/bsg_front_side_bus_hop_in.v /home/vmetta/Documents/basejump_stl/bsg_fsb/bsg_front_side_bus_hop_out.v /home/vmetta/Documents/basejump_stl/bsg_fsb/bsg_fsb.v /home/vmetta/Documents/basejump_stl/bsg_fsb/bsg_fsb_murn_gateway.v /home/vmetta/Documents/basejump_stl/bsg_link/bsg_link_ddr_downstream.v /home/vmetta/Documents/basejump_stl/bsg_link/bsg_link_ddr_upstream.v /home/vmetta/Documents/basejump_stl/bsg_link/bsg_link_iddr_phy.v /home/vmetta/Documents/basejump_stl/bsg_link/bsg_link_oddr_phy.v /home/vmetta/Documents/basejump_stl/bsg_link/bsg_link_source_sync_downstream.v /home/vmetta/Documents/basejump_stl/bsg_link/bsg_link_source_sync_upstream.v /home/vmetta/Documents/basejump_stl/bsg_mem/bsg_mem_1r1w.v /home/vmetta/Documents/basejump_stl/bsg_mem/bsg_mem_1r1w_synth.v /home/vmetta/Documents/basejump_stl/bsg_mem/bsg_mem_1rw_sync.v /home/vmetta/Documents/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_byte.v /home/vmetta/Documents/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_byte_synth.v /home/vmetta/Documents/basejump_stl/bsg_mem/bsg_mem_1rw_sync_synth.v /home/vmetta/Documents/basejump_stl/bsg_mem/bsg_mem_2r1w_sync.v /home/vmetta/Documents/basejump_stl/bsg_mem/bsg_mem_2r1w_sync_synth.v /home/vmetta/Documents/basejump_stl/bsg_mem/bsg_mem_banked_crossbar.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_adder_cin.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_and.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_arb_fixed.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_array_reverse.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_binary_plus_one_to_gray.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_buf.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_buf_ctrl.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_circular_ptr.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_clkbuf.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_counter_clear_up.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_counter_up_down.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_counter_up_down_variable.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_crossbar_o_by_i.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_cycle_counter.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_decode.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_decode_with_v.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_dff.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_dff_en.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_dff_reset.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_dff_reset_en.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_encode_one_hot.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_gray_to_binary.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_idiv_iterative.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_idiv_iterative_controller.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_imul_iterative.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_mux.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_mux_one_hot.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_nor2.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_popcount.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_priority_encode.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_priority_encode_one_hot_out.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_rotate_right.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_round_robin_arb.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_scan.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_thermometer_count.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_tiehi.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_tielo.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_transpose.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_xnor.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_mesh_router.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_mesh_router_buffered.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_mesh_stitch.v /home/vmetta/Documents/JPEG_Decoder_Asic/../common/v/bsg_guts.v /home/vmetta/Documents/JPEG_Decoder_Asic/../common/v/packaging/bsg_iopad_macros.v /home/vmetta/Documents/JPEG_Decoder_Asic/../common/v/packaging/bsg_iopad_mapping.v /home/vmetta/Documents/JPEG_Decoder_Asic/../common/v/packaging/bsg_iopads.v /home/vmetta/Documents/JPEG_Decoder_Asic/../common/v/packaging/bsg_pinout.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_bitbuffer.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_bitbuffer.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_dht_std_cx_ac.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_dht_std_cx_dc.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_dht_std_y_ac.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_dht_std_y_dc.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_dht.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_dqt.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_idct_fifo.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_idct_ram_dp.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_idct_ram.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_idct_transpose_ram.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_idct_transpose.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_idct.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_idct_x.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_idct_y.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_input.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_mcu_id.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_mcu_proc.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_output_cx_ram.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_output_fifo.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_output.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_output_y_ram.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_core.v }" 
read_hdl -sv { /home/vmetta/Documents/JPEG_Decoder_Asic/../common/v/bsg_guts.vh /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_defines.v /home/vmetta/Documents/basejump_stl/bsg_fsb/bsg_fsb_pkg.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_noc_links.vh /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_noc_pkg.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_mesh_router_pkg.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_counter_overflow_set_en.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_concentrate_static.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_unconcentrate_static.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_counter_set_down.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_array_concentrate_static.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_wormhole_router_pkg.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_wormhole_router.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_ready_and_link_async_to_wormhole.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_wormhole_router_decoder_dor.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_wormhole_router_input_control.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_wormhole_router_output_control.v /home/vmetta/Documents/basejump_stl/bsg_async/bsg_async_credit_counter.v /home/vmetta/Documents/basejump_stl/bsg_async/bsg_async_fifo.v /home/vmetta/Documents/basejump_stl/bsg_async/bsg_async_ptr_gray.v /home/vmetta/Documents/basejump_stl/bsg_async/bsg_launch_sync_sync.v /home/vmetta/Documents/basejump_stl/bsg_async/bsg_sync_sync.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_1_to_n_tagged.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_1_to_n_tagged_fifo.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_channel_narrow.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_channel_tunnel.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_channel_tunnel_in.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_channel_tunnel_out.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_narrowed.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_pseudo_large.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small_hardened.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small_unhardened.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_fifo_1rw_large.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_fifo_tracker.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_flatten_2D_array.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_make_2D_array.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_one_fifo.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_round_robin_1_to_n.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_round_robin_fifo_to_fifo.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_round_robin_n_to_1.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_sbox.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_scatter_gather.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_full.v /home/vmetta/Documents/basejump_stl/bsg_dataflow/bsg_two_fifo.v /home/vmetta/Documents/basejump_stl/bsg_fsb/bsg_front_side_bus_hop_in.v /home/vmetta/Documents/basejump_stl/bsg_fsb/bsg_front_side_bus_hop_out.v /home/vmetta/Documents/basejump_stl/bsg_fsb/bsg_fsb.v /home/vmetta/Documents/basejump_stl/bsg_fsb/bsg_fsb_murn_gateway.v /home/vmetta/Documents/basejump_stl/bsg_link/bsg_link_ddr_downstream.v /home/vmetta/Documents/basejump_stl/bsg_link/bsg_link_ddr_upstream.v /home/vmetta/Documents/basejump_stl/bsg_link/bsg_link_iddr_phy.v /home/vmetta/Documents/basejump_stl/bsg_link/bsg_link_oddr_phy.v /home/vmetta/Documents/basejump_stl/bsg_link/bsg_link_source_sync_downstream.v /home/vmetta/Documents/basejump_stl/bsg_link/bsg_link_source_sync_upstream.v /home/vmetta/Documents/basejump_stl/bsg_mem/bsg_mem_1r1w.v /home/vmetta/Documents/basejump_stl/bsg_mem/bsg_mem_1r1w_synth.v /home/vmetta/Documents/basejump_stl/bsg_mem/bsg_mem_1rw_sync.v /home/vmetta/Documents/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_byte.v /home/vmetta/Documents/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_byte_synth.v /home/vmetta/Documents/basejump_stl/bsg_mem/bsg_mem_1rw_sync_synth.v /home/vmetta/Documents/basejump_stl/bsg_mem/bsg_mem_2r1w_sync.v /home/vmetta/Documents/basejump_stl/bsg_mem/bsg_mem_2r1w_sync_synth.v /home/vmetta/Documents/basejump_stl/bsg_mem/bsg_mem_banked_crossbar.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_adder_cin.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_and.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_arb_fixed.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_array_reverse.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_binary_plus_one_to_gray.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_buf.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_buf_ctrl.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_circular_ptr.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_clkbuf.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_counter_clear_up.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_counter_up_down.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_counter_up_down_variable.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_crossbar_o_by_i.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_cycle_counter.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_decode.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_decode_with_v.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_dff.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_dff_en.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_dff_reset.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_dff_reset_en.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_encode_one_hot.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_gray_to_binary.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_idiv_iterative.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_idiv_iterative_controller.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_imul_iterative.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_mux.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_mux_one_hot.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_nor2.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_popcount.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_priority_encode.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_priority_encode_one_hot_out.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_rotate_right.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_round_robin_arb.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_scan.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_thermometer_count.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_tiehi.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_tielo.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_transpose.v /home/vmetta/Documents/basejump_stl/bsg_misc/bsg_xnor.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_mesh_router.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_mesh_router_buffered.v /home/vmetta/Documents/basejump_stl/bsg_noc/bsg_mesh_stitch.v /home/vmetta/Documents/JPEG_Decoder_Asic/../common/v/bsg_guts.v /home/vmetta/Documents/JPEG_Decoder_Asic/../common/v/packaging/bsg_iopad_macros.v /home/vmetta/Documents/JPEG_Decoder_Asic/../common/v/packaging/bsg_iopad_mapping.v /home/vmetta/Documents/JPEG_Decoder_Asic/../common/v/packaging/bsg_iopads.v /home/vmetta/Documents/JPEG_Decoder_Asic/../common/v/packaging/bsg_pinout.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_bitbuffer.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_bitbuffer.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_dht_std_cx_ac.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_dht_std_cx_dc.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_dht_std_y_ac.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_dht_std_y_dc.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_dht.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_dqt.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_idct_fifo.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_idct_ram_dp.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_idct_ram.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_idct_transpose_ram.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_idct_transpose.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_idct.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_idct_x.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_idct_y.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_input.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_mcu_id.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_mcu_proc.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_output_cx_ram.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_output_fifo.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_output.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_output_y_ram.v /home/vmetta/Documents/JPEG_Decoder_Asic/v/jpeg_core.v }
puts "elaborate jpeg_core" 
elaborate jpeg_core
puts "init_design -top jpeg_core" 
init_design -top jpeg_core
puts "set_db root: .auto_ungroup none" 
set_db root: .auto_ungroup none
puts "set_units -capacitance 1.0pF" 
set_units -capacitance 1.0pF
puts "set_load_unit -picofarads 1" 
set_load_unit -picofarads 1
puts "set_units -time 1.0ns" 
set_units -time 1.0ns

puts "set_dont_use \[get_db lib_cells */*sdf*\]"
if { [get_db lib_cells */*sdf*] ne "" } {
    set_dont_use [get_db lib_cells */*sdf*]
} else {
    puts "WARNING: cell */*sdf* was not found for set_dont_use"
}
            

puts "set_dont_use \[get_db lib_cells */sky130_fd_sc_hd__probe_p_*\]"
if { [get_db lib_cells */sky130_fd_sc_hd__probe_p_*] ne "" } {
    set_dont_use [get_db lib_cells */sky130_fd_sc_hd__probe_p_*]
} else {
    puts "WARNING: cell */sky130_fd_sc_hd__probe_p_* was not found for set_dont_use"
}
            

puts "set_dont_use \[get_db lib_cells */sky130_fd_sc_hd__probec_p_*\]"
if { [get_db lib_cells */sky130_fd_sc_hd__probec_p_*] ne "" } {
    set_dont_use [get_db lib_cells */sky130_fd_sc_hd__probec_p_*]
} else {
    puts "WARNING: cell */sky130_fd_sc_hd__probec_p_* was not found for set_dont_use"
}
            
puts "write_db -to_file pre_genus_syn_with_preserve" 
write_db -to_file pre_genus_syn_with_preserve
puts "syn_generic" 
syn_generic
puts "write_db -to_file pre_genus_maybe_syn_map" 
write_db -to_file pre_genus_maybe_syn_map
puts "syn_map" 
syn_map
puts "write_db -to_file pre_add_tieoffs" 
write_db -to_file pre_add_tieoffs
puts "set_db message:WSDF-201 .max_print 20" 
set_db message:WSDF-201 .max_print 20
puts "set_db use_tiehilo_for_const duplicate" 
set_db use_tiehilo_for_const duplicate
puts "add_tieoffs -high sky130_fd_sc_hd__conb_1 -low sky130_fd_sc_hd__conb_1 -max_fanout 1 -verbose" 
add_tieoffs -high sky130_fd_sc_hd__conb_1 -low sky130_fd_sc_hd__conb_1 -max_fanout 1 -verbose
puts "write_db -to_file pre_write_regs" 
write_db -to_file pre_write_regs

        set write_cells_ir "./find_regs_cells.json"
        set write_cells_ir [open $write_cells_ir "w"]
        puts $write_cells_ir "\["

        set refs [get_db [get_db lib_cells -if .is_sequential==true] .base_name]

        set len [llength $refs]

        for {set i 0} {$i < [llength $refs]} {incr i} {
            if {$i == $len - 1} {
                puts $write_cells_ir "    \"[lindex $refs $i]\""
            } else {
                puts $write_cells_ir "    \"[lindex $refs $i]\","
            }
        }

        puts $write_cells_ir "\]"
        close $write_cells_ir
        set write_regs_ir "./find_regs_paths.json"
        set write_regs_ir [open $write_regs_ir "w"]
        puts $write_regs_ir "\["

        set regs [get_db [get_db [all_registers -edge_triggered -output_pins] -if .direction==out] .name]

        set len [llength $regs]

        for {set i 0} {$i < [llength $regs]} {incr i} {
            #regsub -all {/} [lindex $regs $i] . myreg
            set myreg [lindex $regs $i]
            if {$i == $len - 1} {
                puts $write_regs_ir "    \"$myreg\""
            } else {
                puts $write_regs_ir "    \"$myreg\","
            }
        }

        puts $write_regs_ir "\]"

        close $write_regs_ir
        
puts "write_db -to_file pre_generate_reports" 
write_db -to_file pre_generate_reports
puts "write_reports -directory reports -tag final" 
write_reports -directory reports -tag final
puts "write_db -to_file pre_write_outputs" 
write_db -to_file pre_write_outputs
puts "update_names -suffix _mapped -module" 
update_names -suffix _mapped -module
puts "write_hdl > /home/vmetta/Documents/JPEG_Decoder_Asic/build/syn-rundir/jpeg_core.mapped.v" 
write_hdl > /home/vmetta/Documents/JPEG_Decoder_Asic/build/syn-rundir/jpeg_core.mapped.v
puts "write_script > jpeg_core.mapped.scr" 
write_script > jpeg_core.mapped.scr
puts "write_sdc -view ss_100C_1v60.setup_view > /home/vmetta/Documents/JPEG_Decoder_Asic/build/syn-rundir/jpeg_core.mapped.sdc" 
write_sdc -view ss_100C_1v60.setup_view > /home/vmetta/Documents/JPEG_Decoder_Asic/build/syn-rundir/jpeg_core.mapped.sdc
puts "write_sdf -nosplit_timing_check -timescale ns > /home/vmetta/Documents/JPEG_Decoder_Asic/build/syn-rundir/jpeg_core.mapped.sdf" 
write_sdf -nosplit_timing_check -timescale ns > /home/vmetta/Documents/JPEG_Decoder_Asic/build/syn-rundir/jpeg_core.mapped.sdf
puts "write_design -innovus -hierarchical -gzip_files jpeg_core" 
write_design -innovus -hierarchical -gzip_files jpeg_core
puts "quit" 
quit
HAMMER_EXEC ?= /home/kaulad/myEE478/ee477-hammer-cad/hammer_run
HAMMER_DEPENDENCIES ?= /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/paths.yml /home/kaulad/myEE478/ee477-hammer-cad/hammer_cfg_top.yml /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/cfg/cfg.yml /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/cfg/src.yml /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/cfg/verification.yml /home/projects/ee477.2025wtr/cad/hammer_env.yml /home/kaulad/myEE478/ee477-designs-module2/common/v/bsg_guts.vh /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_defines.v /home/kaulad/myEE478/basejump_stl/bsg_fsb/bsg_fsb_pkg.v /home/kaulad/myEE478/basejump_stl/bsg_noc/bsg_noc_links.vh /home/kaulad/myEE478/basejump_stl/bsg_noc/bsg_noc_pkg.v /home/kaulad/myEE478/basejump_stl/bsg_noc/bsg_mesh_router_pkg.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_counter_overflow_set_en.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_concentrate_static.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_unconcentrate_static.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_counter_set_down.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_array_concentrate_static.v /home/kaulad/myEE478/basejump_stl/bsg_noc/bsg_wormhole_router_pkg.v /home/kaulad/myEE478/basejump_stl/bsg_noc/bsg_wormhole_router.v /home/kaulad/myEE478/basejump_stl/bsg_noc/bsg_ready_and_link_async_to_wormhole.v /home/kaulad/myEE478/basejump_stl/bsg_noc/bsg_wormhole_router_decoder_dor.v /home/kaulad/myEE478/basejump_stl/bsg_noc/bsg_wormhole_router_input_control.v /home/kaulad/myEE478/basejump_stl/bsg_noc/bsg_wormhole_router_output_control.v /home/kaulad/myEE478/basejump_stl/bsg_async/bsg_async_credit_counter.v /home/kaulad/myEE478/basejump_stl/bsg_async/bsg_async_fifo.v /home/kaulad/myEE478/basejump_stl/bsg_async/bsg_async_ptr_gray.v /home/kaulad/myEE478/basejump_stl/bsg_async/bsg_launch_sync_sync.v /home/kaulad/myEE478/basejump_stl/bsg_async/bsg_sync_sync.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_1_to_n_tagged.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_1_to_n_tagged_fifo.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_channel_narrow.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_channel_tunnel.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_channel_tunnel_in.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_channel_tunnel_out.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_narrowed.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_pseudo_large.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small_hardened.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small_unhardened.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_fifo_1rw_large.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_fifo_tracker.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_flatten_2D_array.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_make_2D_array.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_one_fifo.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_round_robin_1_to_n.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_round_robin_fifo_to_fifo.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_round_robin_n_to_1.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_sbox.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_scatter_gather.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_full.v /home/kaulad/myEE478/basejump_stl/bsg_dataflow/bsg_two_fifo.v /home/kaulad/myEE478/basejump_stl/bsg_fsb/bsg_front_side_bus_hop_in.v /home/kaulad/myEE478/basejump_stl/bsg_fsb/bsg_front_side_bus_hop_out.v /home/kaulad/myEE478/basejump_stl/bsg_fsb/bsg_fsb.v /home/kaulad/myEE478/basejump_stl/bsg_fsb/bsg_fsb_murn_gateway.v /home/kaulad/myEE478/basejump_stl/bsg_link/bsg_link_ddr_downstream.v /home/kaulad/myEE478/basejump_stl/bsg_link/bsg_link_ddr_upstream.v /home/kaulad/myEE478/basejump_stl/bsg_link/bsg_link_iddr_phy.v /home/kaulad/myEE478/basejump_stl/bsg_link/bsg_link_oddr_phy.v /home/kaulad/myEE478/basejump_stl/bsg_link/bsg_link_source_sync_downstream.v /home/kaulad/myEE478/basejump_stl/bsg_link/bsg_link_source_sync_upstream.v /home/kaulad/myEE478/basejump_stl/bsg_mem/bsg_mem_1r1w.v /home/kaulad/myEE478/basejump_stl/bsg_mem/bsg_mem_1r1w_synth.v /home/kaulad/myEE478/basejump_stl/bsg_mem/bsg_mem_1rw_sync.v /home/kaulad/myEE478/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_byte.v /home/kaulad/myEE478/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_byte_synth.v /home/kaulad/myEE478/basejump_stl/bsg_mem/bsg_mem_1rw_sync_synth.v /home/kaulad/myEE478/basejump_stl/bsg_mem/bsg_mem_2r1w_sync.v /home/kaulad/myEE478/basejump_stl/bsg_mem/bsg_mem_2r1w_sync_synth.v /home/kaulad/myEE478/basejump_stl/bsg_mem/bsg_mem_banked_crossbar.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_adder_cin.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_and.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_arb_fixed.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_array_reverse.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_binary_plus_one_to_gray.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_buf.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_buf_ctrl.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_circular_ptr.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_clkbuf.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_counter_clear_up.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_counter_up_down.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_counter_up_down_variable.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_crossbar_o_by_i.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_cycle_counter.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_decode.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_decode_with_v.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_dff.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_dff_en.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_dff_reset.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_dff_reset_en.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_encode_one_hot.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_gray_to_binary.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_idiv_iterative.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_idiv_iterative_controller.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_imul_iterative.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_mux.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_mux_one_hot.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_nor2.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_popcount.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_priority_encode.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_priority_encode_one_hot_out.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_rotate_right.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_round_robin_arb.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_scan.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_thermometer_count.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_tiehi.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_tielo.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_transpose.v /home/kaulad/myEE478/basejump_stl/bsg_misc/bsg_xnor.v /home/kaulad/myEE478/basejump_stl/bsg_noc/bsg_mesh_router.v /home/kaulad/myEE478/basejump_stl/bsg_noc/bsg_mesh_router_buffered.v /home/kaulad/myEE478/basejump_stl/bsg_noc/bsg_mesh_stitch.v /home/kaulad/myEE478/ee477-designs-module2/common/v/bsg_guts.v /home/kaulad/myEE478/ee477-designs-module2/common/v/packaging/bsg_iopad_macros.v /home/kaulad/myEE478/ee477-designs-module2/common/v/packaging/bsg_iopad_mapping.v /home/kaulad/myEE478/ee477-designs-module2/common/v/packaging/bsg_iopads.v /home/kaulad/myEE478/ee477-designs-module2/common/v/packaging/bsg_pinout.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_bitbuffer.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_bitbuffer.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_dht_std_cx_ac.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_dht_std_cx_dc.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_dht_std_y_ac.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_dht_std_y_dc.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_dht.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_dqt.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_idct_fifo.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_idct_ram_dp.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_idct_ram.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_idct_transpose_ram.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_idct_transpose.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_idct.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_idct_x.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_idct_y.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_input.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_mcu_id.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_mcu_proc.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_output_cx_ram.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_output_fifo.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_output.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_output_y_ram.v /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/v/jpeg_core.v


####################################################################################
## Global steps
####################################################################################
.PHONY: pcb
pcb: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/pcb-rundir/pcb-output-full.json

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/pcb-rundir/pcb-output-full.json: $(HAMMER_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/paths.yml -p /home/kaulad/myEE478/ee477-hammer-cad/hammer_cfg_top.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/cfg/cfg.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/cfg/src.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/cfg/verification.yml --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build pcb


####################################################################################
## Steps for jpeg_core
####################################################################################
.PHONY: sim-rtl syn syn-to-sim sim-syn syn-to-par par par-to-sim sim-par sim-par-to-power par-to-power power-par par-to-drc drc par-to-lvs lvs syn-to-formal formal-syn par-to-formal formal-par syn-to-timing timing-syn par-to-timing timing-par

#sim-rtl          : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-rtl-rundir/sim-output-full.json
syn              : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/syn-rundir/syn-output-full.json

syn-to-sim       : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-syn-input.json
#sim-syn          : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-syn-rundir/sim-output-full.json

syn-to-par       : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-input.json
par              : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json

par-to-sim       : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-par-input.json
#sim-par          : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-par-rundir/sim-output-full.json

#sim-par-to-power : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/power-sim-par-input.json
par-to-power     : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/power-par-input.json
power-par        : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/power-par-rundir/power-output-full.json

par-to-drc       : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/drc-input.json
drc              : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/drc-rundir/drc-output-full.json

par-to-lvs       : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/lvs-input.json
lvs              : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/lvs-rundir/lvs-output-full.json

syn-to-formal    : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-syn-input.json
formal-syn       : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-syn-rundir/formal-output-full.json

par-to-formal    : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-par-input.json
formal-par       : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-par-rundir/formal-output-full.json

syn-to-timing    : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-syn-input.json
timing-syn       : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-syn-rundir/timing-output-full.json

par-to-timing    : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-par-input.json
timing-par       : /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-par-rundir/timing-output-full.json



/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-rtl-rundir/sim-output-full.json: $(HAMMER_DEPENDENCIES) $(HAMMER_SIM_RTL_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/paths.yml -p /home/kaulad/myEE478/ee477-hammer-cad/hammer_cfg_top.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/cfg/cfg.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/cfg/src.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/cfg/verification.yml $(HAMMER_EXTRA_ARGS) --sim_rundir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-rtl-rundir --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build sim

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/syn-rundir/syn-output-full.json: $(HAMMER_DEPENDENCIES) $(HAMMER_SYN_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/paths.yml -p /home/kaulad/myEE478/ee477-hammer-cad/hammer_cfg_top.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/cfg/cfg.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/cfg/src.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/cfg/verification.yml $(HAMMER_EXTRA_ARGS) --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build syn

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-syn-input.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/syn-rundir/syn-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-syn-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build syn-to-sim

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-syn-rundir/sim-output-full.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-syn-input.json $(HAMMER_SIM_SYN_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-syn-input.json $(SIM_EXTRA_ARGS) $(HAMMER_EXTRA_ARGS) --sim_rundir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-syn-rundir --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build sim

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-input.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/syn-rundir/syn-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build syn-to-par

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-input.json $(HAMMER_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build par

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-par-input.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-par-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build par-to-sim

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-par-rundir/sim-output-full.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-par-input.json $(HAMMER_SIM_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-par-input.json $(SIM_EXTRA_ARGS) $(HAMMER_EXTRA_ARGS) --sim_rundir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-par-rundir --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build sim

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/power-sim-par-input.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-par-rundir/sim-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-par-rundir/sim-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/power-sim-par-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build sim-to-power

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/power-par-input.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/power-par-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build par-to-power

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/power-par-rundir/power-output-full.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/power-sim-par-input.json /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/power-par-input.json $(HAMMER_POWER_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/power-sim-par-input.json -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/power-par-input.json $(HAMMER_EXTRA_ARGS) --power_rundir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/power-par-rundir --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build power

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/drc-input.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/drc-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build par-to-drc

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/drc-rundir/drc-output-full.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/drc-input.json $(HAMMER_DRC_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/drc-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build drc

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/lvs-input.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/lvs-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build par-to-lvs

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/lvs-rundir/lvs-output-full.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/lvs-input.json $(HAMMER_LVS_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/lvs-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build lvs

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-syn-input.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/syn-rundir/syn-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-syn-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build syn-to-formal

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-syn-rundir/formal-output-full.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-syn-input.json $(HAMMER_FORMAL_SYN_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-syn-input.json $(HAMMER_EXTRA_ARGS) --formal_rundir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-syn-rundir --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build formal

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-par-input.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-par-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build par-to-formal

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-par-rundir/formal-output-full.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-par-input.json $(HAMMER_FORMAL_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-par-input.json $(HAMMER_EXTRA_ARGS) --formal_rundir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-par-rundir --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build formal

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-syn-input.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/syn-rundir/syn-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-syn-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build syn-to-timing

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-syn-rundir/timing-output-full.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-syn-input.json $(HAMMER_TIMING_SYN_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-syn-input.json $(HAMMER_EXTRA_ARGS) --timing_rundir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-syn-rundir --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build timing

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-par-input.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-par-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build par-to-timing

/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-par-rundir/timing-output-full.json: /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-par-input.json $(HAMMER_TIMING_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-par-input.json $(HAMMER_EXTRA_ARGS) --timing_rundir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-par-rundir --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build timing

# Redo steps
# These intentionally break the dependency graph, but allow the flexibility to rerun a step after changing a config.
# Hammer doesn't know what settings impact synthesis only, e.g., so these are for power-users who "know better."
# The HAMMER_EXTRA_ARGS variable allows patching in of new configurations with -p or using --to_step or --from_step, for example.
.PHONY: redo-sim-rtl redo-syn redo-syn-to-sim redo-sim-syn redo-syn-to-par redo-par redo-par-to-sim redo-sim-par redo-sim-par-to-power redo-par-to-power redo-power-par redo-par-to-drc redo-drc redo-par-to-lvs redo-lvs redo-syn-to-formal redo-formal-syn redo-par-to-formal redo-formal-par redo-syn-to-timing redo-timing-syn redo-par-to-timing redo-timing-par

#redo-sim-rtl:
#	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/paths.yml -p /home/kaulad/myEE478/ee477-hammer-cad/hammer_cfg_top.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/cfg/cfg.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/cfg/src.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/cfg/verification.yml $(HAMMER_EXTRA_ARGS) --sim_rundir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-rtl-rundir --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build sim

redo-syn:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/paths.yml -p /home/kaulad/myEE478/ee477-hammer-cad/hammer_cfg_top.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/cfg/cfg.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/cfg/src.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/cfg/verification.yml $(HAMMER_EXTRA_ARGS) --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build syn

redo-syn-to-sim:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-syn-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build syn-to-sim

#redo-sim-syn:
#	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-syn-input.json $(SIM_EXTRA_ARGS) $(HAMMER_EXTRA_ARGS) --sim_rundir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-syn-rundir --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build sim

redo-syn-to-par:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build syn-to-par

redo-par:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build par

redo-par-to-sim:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-par-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build par-to-sim

#redo-sim-par:
#	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-par-input.json $(SIM_EXTRA_ARGS) $(HAMMER_EXTRA_ARGS) --sim_rundir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-par-rundir --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build sim

#redo-sim-par-to-power:
#	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/sim-par-rundir/sim-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/power-sim-par-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build sim-to-power

redo-par-to-power:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/power-par-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build par-to-power

redo-power-par:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/power-sim-par-input.json -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/power-par-input.json $(HAMMER_EXTRA_ARGS) --power_rundir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/power-par-rundir --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build power

redo-par-to-drc:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/drc-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build par-to-drc

redo-drc:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/drc-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build drc

redo-par-to-lvs:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/lvs-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build par-to-lvs

redo-lvs:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/lvs-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build lvs

redo-syn-to-formal:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-syn-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build syn-to-formal

redo-formal-syn:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-syn-input.json $(HAMMER_EXTRA_ARGS) --formal_rundir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-syn-rundir --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build formal

redo-par-to-formal:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-par-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build par-to-formal

redo-formal-par:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-par-input.json $(HAMMER_EXTRA_ARGS) --formal_rundir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/formal-par-rundir --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build formal

redo-syn-to-timing:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-syn-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build syn-to-timing

redo-timing-syn:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-syn-input.json $(HAMMER_EXTRA_ARGS) --timing_rundir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-syn-rundir --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build timing

redo-par-to-timing:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-par-input.json --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build par-to-timing

redo-timing-par:
	$(HAMMER_EXEC) -e /home/projects/ee477.2025wtr/cad/hammer_env.yml -p /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-par-input.json $(HAMMER_EXTRA_ARGS) --timing_rundir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/timing-par-rundir --obj_dir /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build timing


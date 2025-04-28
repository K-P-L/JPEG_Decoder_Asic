#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Mon Apr 28 12:01:49 2025                
#                                                     
#######################################################

#@(#)CDS: Innovus v21.13-s100_1 (64bit) 03/04/2022 14:32 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 21.13-s100_1 NR220220-0140/21_13-UB (database version 18.20.572) {superthreading v2.17}
#@(#)CDS: AAE 21.13-s034 (64bit) 03/04/2022 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 21.13-s042_1 () Mar  4 2022 08:38:36 ( )
#@(#)CDS: SYNTECH 21.13-s014_1 () Feb 17 2022 23:50:03 ( )
#@(#)CDS: CPE v21.13-s074
#@(#)CDS: IQuantus/TQuantus 20.1.2-s656 (64bit) Tue Nov 9 23:11:16 PST 2021 (Linux 2.6.32-431.11.2.el6.x86_64)

#@ source /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par.tcl
#@ Begin verbose source (pre): source /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par.tcl
puts "set_db design_process_node 130" 
set_db design_process_node 130
puts "set_multi_cpu_usage -local_cpu 8" 
set_multi_cpu_usage -local_cpu 8
puts "set_db timing_analysis_cppr both" 
set_db timing_analysis_cppr both
puts "set_db timing_analysis_type ocv" 
set_db timing_analysis_type ocv
puts "set_library_unit -time 1ns" 
set_library_unit -time 1ns
puts "set_db init_design_uniquify true" 
set_db init_design_uniquify true
puts "set_db si_delay_separate_on_data true" 
set_db si_delay_separate_on_data true
puts "set_db si_delay_enable_report true" 
set_db si_delay_enable_report true
puts "read_physical -lef { /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/tech-sky130-cache/sky130_fd_sc_hd__nom.tlef /home/projects/ee477.2025wtr/cad/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef }" 
read_physical -lef { /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/tech-sky130-cache/sky130_fd_sc_hd__nom.tlef /home/projects/ee477.2025wtr/cad/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef }
puts "read_mmmc /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/mmmc.tcl" 
read_mmmc /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/mmmc.tcl
#@ Begin verbose source /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/mmmc.tcl (pre)
puts "create_constraint_mode -name my_constraint_mode -sdc_files [list /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/syn-rundir/jpeg_core.mapped.sdc]" 
create_constraint_mode -name my_constraint_mode -sdc_files [list /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/syn-rundir/jpeg_core.mapped.sdc]
puts "create_library_set -name ss_100C_1v60.setup_set -timing [list /home/projects/ee477.2025wtr/cad/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_100C_1v60.lib]" 
create_library_set -name ss_100C_1v60.setup_set -timing [list /home/projects/ee477.2025wtr/cad/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_100C_1v60.lib]
puts "create_timing_condition -name ss_100C_1v60.setup_cond -library_sets [list ss_100C_1v60.setup_set]" 
create_timing_condition -name ss_100C_1v60.setup_cond -library_sets [list ss_100C_1v60.setup_set]
puts "create_rc_corner -name ss_100C_1v60.setup_rc -temperature 100.0  " 
create_rc_corner -name ss_100C_1v60.setup_rc -temperature 100.0  
puts "create_delay_corner -name ss_100C_1v60.setup_delay -timing_condition ss_100C_1v60.setup_cond -rc_corner ss_100C_1v60.setup_rc" 
create_delay_corner -name ss_100C_1v60.setup_delay -timing_condition ss_100C_1v60.setup_cond -rc_corner ss_100C_1v60.setup_rc
puts "create_analysis_view -name ss_100C_1v60.setup_view -delay_corner ss_100C_1v60.setup_delay -constraint_mode my_constraint_mode" 
create_analysis_view -name ss_100C_1v60.setup_view -delay_corner ss_100C_1v60.setup_delay -constraint_mode my_constraint_mode
puts "create_library_set -name ff_n40C_1v95.hold_set -timing [list /home/projects/ee477.2025wtr/cad/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ff_n40C_1v95_ccsnoise.lib]" 
create_library_set -name ff_n40C_1v95.hold_set -timing [list /home/projects/ee477.2025wtr/cad/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ff_n40C_1v95_ccsnoise.lib]
puts "create_timing_condition -name ff_n40C_1v95.hold_cond -library_sets [list ff_n40C_1v95.hold_set]" 
create_timing_condition -name ff_n40C_1v95.hold_cond -library_sets [list ff_n40C_1v95.hold_set]
puts "create_rc_corner -name ff_n40C_1v95.hold_rc -temperature -40.0  " 
create_rc_corner -name ff_n40C_1v95.hold_rc -temperature -40.0  
puts "create_delay_corner -name ff_n40C_1v95.hold_delay -timing_condition ff_n40C_1v95.hold_cond -rc_corner ff_n40C_1v95.hold_rc" 
create_delay_corner -name ff_n40C_1v95.hold_delay -timing_condition ff_n40C_1v95.hold_cond -rc_corner ff_n40C_1v95.hold_rc
puts "create_analysis_view -name ff_n40C_1v95.hold_view -delay_corner ff_n40C_1v95.hold_delay -constraint_mode my_constraint_mode" 
create_analysis_view -name ff_n40C_1v95.hold_view -delay_corner ff_n40C_1v95.hold_delay -constraint_mode my_constraint_mode
puts "create_library_set -name tt_025C_1v80.extra_set -timing [list /home/projects/ee477.2025wtr/cad/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib]" 
create_library_set -name tt_025C_1v80.extra_set -timing [list /home/projects/ee477.2025wtr/cad/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib]
puts "create_timing_condition -name tt_025C_1v80.extra_cond -library_sets [list tt_025C_1v80.extra_set]" 
create_timing_condition -name tt_025C_1v80.extra_cond -library_sets [list tt_025C_1v80.extra_set]
puts "create_rc_corner -name tt_025C_1v80.extra_rc -temperature 25.0  " 
create_rc_corner -name tt_025C_1v80.extra_rc -temperature 25.0  
puts "create_delay_corner -name tt_025C_1v80.extra_delay -timing_condition tt_025C_1v80.extra_cond -rc_corner tt_025C_1v80.extra_rc" 
create_delay_corner -name tt_025C_1v80.extra_delay -timing_condition tt_025C_1v80.extra_cond -rc_corner tt_025C_1v80.extra_rc
puts "create_analysis_view -name tt_025C_1v80.extra_view -delay_corner tt_025C_1v80.extra_delay -constraint_mode my_constraint_mode" 
create_analysis_view -name tt_025C_1v80.extra_view -delay_corner tt_025C_1v80.extra_delay -constraint_mode my_constraint_mode
puts "set_analysis_view -setup { ss_100C_1v60.setup_view } -hold { ff_n40C_1v95.hold_view tt_025C_1v80.extra_view }" 
set_analysis_view -setup { ss_100C_1v60.setup_view } -hold { ff_n40C_1v95.hold_view tt_025C_1v80.extra_view }
#@ End verbose source /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/mmmc.tcl
puts "read_netlist { /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/syn-rundir/jpeg_core.mapped.v } -top jpeg_core" 
read_netlist { /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/syn-rundir/jpeg_core.mapped.v } -top jpeg_core
puts "init_design" 
init_design
puts "read_power_intent -cpf /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/power_spec.cpf" 
read_power_intent -cpf /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/power_spec.cpf
puts "commit_power_intent" 
commit_power_intent
puts "set_db design_flow_effort extreme" 
set_db design_flow_effort extreme
puts "set_dont_use \[get_db lib_cells */*sdf*\]"
if { [get_db lib_cells */*sdf*] ne "" } {
set_dont_use [get_db lib_cells */*sdf*]
}
puts "set_dont_use \[get_db lib_cells */sky130_fd_sc_hd__probe_p_*\]"
if { [get_db lib_cells */sky130_fd_sc_hd__probe_p_*] ne "" } {
set_dont_use [get_db lib_cells */sky130_fd_sc_hd__probe_p_*]
}
puts "set_dont_use \[get_db lib_cells */sky130_fd_sc_hd__probec_p_*\]"
if { [get_db lib_cells */sky130_fd_sc_hd__probec_p_*] ne "" } {
set_dont_use [get_db lib_cells */sky130_fd_sc_hd__probec_p_*]
}
puts "write_db pre_sky130_innovus_settings" 
write_db pre_sky130_innovus_settings
puts "ln -sfn pre_sky130_innovus_settings latest" 
ln -sfn pre_sky130_innovus_settings latest
set_db place_global_place_io_pins  true
set_db opt_honor_fences true
set_db place_detail_dpt_flow true
set_db place_detail_color_aware_legal true
set_db place_global_solver_effort high
set_db place_detail_check_cut_spacing true
set_db place_global_cong_effort high
set_db opt_fix_fanout_load true
set_db opt_clock_gate_aware false
set_db opt_area_recovery true
set_db opt_post_route_area_reclaim setup_aware
set_db opt_fix_hold_verbose true
set_db cts_target_skew 0.03
set_db cts_max_fanout 10
set_db cts_target_max_transition_time .3
set_db opt_setup_target_slack 0.10
set_db opt_hold_target_slack 0.10
set_db route_design_bottom_routing_layer 2
puts "write_db pre_floorplan_design" 
write_db pre_floorplan_design
puts "ln -sfn pre_floorplan_design latest" 
ln -sfn pre_floorplan_design latest
puts "source -echo -verbose /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/floorplan.tcl" 
#@ source -echo -verbose /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/floorplan.tcl
#@ Begin verbose source /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/floorplan.tcl (pre)
create_floorplan -core_margins_by die -flip f -die_size_by_io_height max -site unithd -die_size { 500 500 0 0 0 0 }
create_fence -name guts/link_downstream -area  40 40 340 310 
create_fence -name guts/link_upstream -area 300 250 450 450 
#@ End verbose source /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/floorplan.tcl
puts "write_db pre_place_bumps" 
write_db pre_place_bumps
puts "ln -sfn pre_place_bumps latest" 
ln -sfn pre_place_bumps latest
puts "write_db pre_sky130_add_endcaps" 
write_db pre_sky130_add_endcaps
puts "ln -sfn pre_sky130_add_endcaps latest" 
ln -sfn pre_sky130_add_endcaps latest
set_db add_endcaps_boundary_tap     true
set_db add_endcaps_left_edge        sky130_fd_sc_hd__tap_1
set_db add_endcaps_right_edge       sky130_fd_sc_hd__tap_1
add_endcaps
puts "write_db pre_place_tap_cells" 
write_db pre_place_tap_cells
puts "ln -sfn pre_place_tap_cells latest" 
ln -sfn pre_place_tap_cells latest
set_db add_well_taps_cell sky130_fd_sc_hd__tapvpwrvgnd_1
add_well_taps -cell_interval 15 -in_row_offset 5
puts "write_db pre_sky130_connect_nets" 
write_db pre_sky130_connect_nets
puts "ln -sfn pre_sky130_connect_nets latest" 
ln -sfn pre_sky130_connect_nets latest
connect_global_net VDD -type pg_pin -pin_base_name VPWR -all -auto_tie -netlist_override
connect_global_net VDD -type net    -net_base_name VPWR -all -netlist_override
connect_global_net VDD -type pg_pin -pin_base_name VPB -all -auto_tie -netlist_override
connect_global_net VDD -type net    -net_base_name VPB -all -netlist_override
connect_global_net VSS -type pg_pin -pin_base_name VGND -all -auto_tie -netlist_override
connect_global_net VSS -type net    -net_base_name VGND -all -netlist_override
connect_global_net VSS -type pg_pin -pin_base_name VNB -all -auto_tie -netlist_override
connect_global_net VSS -type net    -net_base_name VNB -all -netlist_override
puts "write_db pre_power_straps" 
write_db pre_power_straps
puts "ln -sfn pre_power_straps latest" 
ln -sfn pre_power_straps latest
puts "source -echo -verbose /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/power_straps.tcl" 
#@ source -echo -verbose /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/power_straps.tcl
#@ Begin verbose source /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/power_straps.tcl (pre)
reset_db -category add_stripes
set_db add_stripes_stacked_via_bottom_layer met1
set_db add_stripes_stacked_via_top_layer met1
set_db add_stripes_spacing_from_block 3.000
add_stripes -pin_layer met1 -layer met1 -over_pins 1 -master "sky130_fd_sc_hd__tap*" -block_ring_bottom_layer_limit met1 -block_ring_top_layer_limit met1 -pad_core_ring_bottom_layer_limit met1 -pad_core_ring_top_layer_limit met1 -direction horizontal -width pin_width -nets { VSS VDD }
reset_db -category add_stripes
set_db add_stripes_stacked_via_top_layer met4
set_db add_stripes_stacked_via_bottom_layer met1
set_db add_stripes_trim_antenna_back_to_shape {stripe}
set_db add_stripes_spacing_from_block 3.000
add_stripes -create_pins 0 -block_ring_bottom_layer_limit met4 -block_ring_top_layer_limit met1 -direction vertical -layer met4 -nets {VSS VDD} -pad_core_ring_bottom_layer_limit met1 -set_to_set_distance 25.800 -spacing 1.100 -switch_layer_over_obs 0 -width 3.100 -area [get_db designs .core_bbox] -start [expr [lindex [lindex [get_db designs .core_bbox] 0] 0] + 7.010]
reset_db -category add_stripes
set_db add_stripes_stacked_via_top_layer met5
set_db add_stripes_stacked_via_bottom_layer met4
set_db add_stripes_trim_antenna_back_to_shape {stripe}
set_db add_stripes_spacing_from_block 3.000
add_stripes -create_pins 1 -block_ring_bottom_layer_limit met5 -block_ring_top_layer_limit met4 -direction horizontal -layer met5 -nets {VSS VDD} -pad_core_ring_bottom_layer_limit met4 -set_to_set_distance 32.000 -spacing 4.800 -switch_layer_over_obs 0 -width 4.800 -area [get_db designs .core_bbox] -start [expr [lindex [lindex [get_db designs .core_bbox] 0] 1] + 7.300]
#@ End verbose source /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/power_straps.tcl
puts "write_db pre_place_pins" 
write_db pre_place_pins
puts "ln -sfn pre_place_pins latest" 
ln -sfn pre_place_pins latest
puts "set_db assign_pins_edit_in_batch true" 
set_db assign_pins_edit_in_batch true
puts "edit_pin -fixed_pin -pin * -hinst jpeg_core -spread_type range -layer { met2 } -side bottom -start { 500 0 } -end { 0 0 }   " 
edit_pin -fixed_pin -pin * -hinst jpeg_core -spread_type range -layer { met2 } -side bottom -start { 500 0 } -end { 0 0 }   
puts "edit_pin -fixed_pin -pin p_sdi_* -hinst jpeg_core -spread_type range -layer { met2 } -side left -end { 0 500 } -start { 0 0 }   " 
edit_pin -fixed_pin -pin p_sdi_* -hinst jpeg_core -spread_type range -layer { met2 } -side left -end { 0 500 } -start { 0 0 }   
#@ End verbose source /home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/par-rundir/par.tcl

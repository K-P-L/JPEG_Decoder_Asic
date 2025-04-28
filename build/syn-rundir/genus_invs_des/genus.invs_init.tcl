################################################################################
#
# Init setup file
# Created by Genus(TM) Synthesis Solution on 04/28/2025 11:59:49
#
################################################################################
if { ![is_common_ui_mode] } { error "ERROR: This script requires common_ui to be active."}

read_mmmc genus_invs_des/genus.mmmc.tcl

read_physical -lef {/home/kaulad/myEE478/jpeg_bsg/jpeg_decoder_asic/build/tech-sky130-cache/sky130_fd_sc_hd__nom.tlef /home/projects/ee477.2025wtr/cad/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef}

read_netlist genus_invs_des/genus.v.gz

init_design

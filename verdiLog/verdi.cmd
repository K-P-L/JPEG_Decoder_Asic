simSetSimulator "-vcssv" -exec \
           "/home/vmetta/Documents/JPEG_Decoder_Asic/build/sim-rtl-rundir/simv" \
           -args
debImport "-full64" "-dbdir" \
          "/home/vmetta/Documents/JPEG_Decoder_Asic/build/sim-rtl-rundir/simv.daidir"
debLoadSimResult \
           /home/vmetta/Documents/JPEG_Decoder_Asic/build/sim-rtl-rundir/waveform.fsdb
wvCreateWindow
srcHBSelect "jpeg_core_tb.DUT" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT" -delim "."
srcHBSelect "jpeg_core_tb.DUT" -win $_nTrace1
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_input" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT.u_jpeg_input" -delim "."
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_input" -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.state_q\[4:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.inport_valid_i"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.inport_data_i\[31:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.dqt_cfg_yumi_i"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.data_yumi_i"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.ready_o"
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.img_dqt_table_y_o\[1:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.img_dqt_table_y_o\[1:0\]"
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
srcSignalView -off
verdiDockWidgetMaximize -dock windowDock_nWave_2
srcSignalView -on
srcSignalView -off
srcSignalView -on
verdiDockWidgetRestore -dock windowDock_nWave_2
srcHBSelect "jpeg_core_tb.DUT" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT" -delim "."
srcHBSelect "jpeg_core_tb.DUT" -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.outport_pixel_x_o\[15:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 4)}
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_idct" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT.u_jpeg_idct" -delim "."
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_idct" -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_idct.outport_accept_i"
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_idct.inport_idx_i\[5:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_idct.inport_id_i\[31:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_idct.outport_id_o\[31:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 4)}
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_idct.u_input" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT.u_jpeg_idct.u_input" -delim "."
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_idct.u_input" -win $_nTrace1
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_input" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT.u_jpeg_input" -delim "."
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_input" -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.img_width_o\[15:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.img_height_o\[15:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.dqt_cfg_data_o\[7:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.dht_cfg_data_o\[7:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.data_data_o\[7:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.data_last_o"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {55 55 6 9 11 10}
srcDeselectAll -win $_nTrace1

simSetSimulator "-vcssv" -exec \
           "/home/vmetta/Documents/JPEG_Decoder_Asic/build/sim-rtl-rundir/simv" \
           -args
debImport "-full64" "-dbdir" \
          "/home/vmetta/Documents/JPEG_Decoder_Asic/build/sim-rtl-rundir/simv.daidir"
debLoadSimResult \
           /home/vmetta/Documents/JPEG_Decoder_Asic/build/sim-rtl-rundir/waveform.fsdb
wvCreateWindow
wvSetCursor -win $_nWave2 14575.093418
srcHBSelect "jpeg_core_tb.DUT" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT" -delim "."
srcHBSelect "jpeg_core_tb.DUT" -win $_nTrace1
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_input" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT.u_jpeg_input" -delim "."
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_input" -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.state_q\[4:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_bitbuffer" -win $_nTrace1
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_input" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT.u_jpeg_input" -delim "."
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_input" -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.inport_data_i\[31:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.clk_i"
srcSignalViewAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 )} 
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.clk_i"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.inport_data_i\[31:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.state_q\[4:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 14546.001415
srcDeselectAll -win $_nTrace1
srcSelect -signal "last_b_q" -line 136 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_r" -line 136 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcSignalView -off
verdiDockWidgetMaximize -dock windowDock_nWave_2
wvSetCursor -win $_nWave2 13469.597311 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 13469.597311
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSetPosition -win $_nWave2 {("G1" 3)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 10)}
srcSignalView -on
srcSignalView -off
srcSignalView -on
verdiDockWidgetRestore -dock windowDock_nWave_2
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.next_state_r\[4:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
debExit

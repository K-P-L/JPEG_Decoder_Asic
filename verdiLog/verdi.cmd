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
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_input" -win $_nTrace1
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_input" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT.u_jpeg_input" -delim "."
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_input" -win $_nTrace1
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_input" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT.u_jpeg_input" -delim "."
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_input" -win $_nTrace1
srcHBSelect "jpeg_core_tb" -win $_nTrace1
srcHBSelect "jpeg_core_tb.DUT" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT" -delim "."
srcHBSelect "jpeg_core_tb.DUT" -win $_nTrace1
srcHBSelect "jpeg_core_tb" -win $_nTrace1
srcSignalView -on
srcSignalViewSelect "jpeg_core_tb.DUT.inport_valid_i"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.inport_strb_i\[3:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.inport_valid_i"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.dqt_cfg_accept_w"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.lookup_table_w\[1:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_dht" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT.u_jpeg_dht" -delim "."
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_dht" -win $_nTrace1
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_dqt" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT.u_jpeg_dqt" -delim "."
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_dqt" -win $_nTrace1
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_dqt" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT.u_jpeg_dqt" -delim "."
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_dqt" -win $_nTrace1
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_input" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT.u_jpeg_input" -delim "."
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_input" -win $_nTrace1
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_dht" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT.u_jpeg_dht" -delim "."
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_dht" -win $_nTrace1
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_input" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT.u_jpeg_input" -delim "."
srcHBSelect "jpeg_core_tb.DUT.u_jpeg_input" -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.img_dqt_table_y_o\[1:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcSignalViewSelect "jpeg_core_tb.DUT.u_jpeg_input.dqt_cfg_data_o\[7:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0

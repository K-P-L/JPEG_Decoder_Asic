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
srcHBSelect "jpeg_core_tb.DUT" -win $_nTrace1
srcSetScope -win $_nTrace1 "jpeg_core_tb.DUT" -delim "."
srcHBSelect "jpeg_core_tb.DUT" -win $_nTrace1
srcSignalView -on
srcSignalViewSelect "jpeg_core_tb.DUT.clk_i"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.rst_i"
srcSignalViewAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
srcSignalViewSelect "jpeg_core_tb.DUT.rst_i"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.rst_i"
srcSignalViewSelect "jpeg_core_tb.DUT.rst_i"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.rst_i"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.rst_i"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.rst_i"
srcSignalViewSelect "jpeg_core_tb.DUT.rst_i"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.rst_i"
srcSignalViewSelect "jpeg_core_tb.DUT.rst_i"
srcSignalViewAddSelectedToWave -win $_nTrace1
srcSignalViewSelect "jpeg_core_tb.DUT.rst_i"
srcSignalViewSelect "jpeg_core_tb.DUT.rst_i"

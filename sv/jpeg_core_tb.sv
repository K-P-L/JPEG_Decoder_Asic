// jpeg_core_tb.v
//
// This file contains the toplevel testbench for testing
// this design.
//

module jpeg_core_tb;

  /* Dump Test Waveform To VPD File */
  initial begin
    $fsdbDumpfile("waveform.fsdb");
    $fsdbDumpvars();
  end

    /* Non-synth clock generator */
  logic clk;
  bsg_nonsynth_clock_gen #(1000) clk_gen_1 (clk);

    /* Non-synth reset generator */
  logic reset;
  bsg_nonsynth_reset_gen #(.num_clocks_p(1),.reset_cycles_lo_p(5),. reset_cycles_hi_p(5))
    reset_gen
      (.clk_i         ( clk )
      ,.async_reset_o( reset )
      );

  //Declaring Signals for connecting the testbench to the DUT
  logic dut_v_lo, dut_v_r;
  logic [87:0] dut_data_lo, dut_data_r;
  logic dut_ready_lo, dut_ready_r;

  logic tr_v_lo, tr_v_dummy_lo;
  logic [87:0] tr_data_lo, tr_data_dummy_lo;
  logic tr_ready_lo, tr_ready_r;

  logic [63:0] rom_addr_li;
  logic [91:0] rom_data_lo;
  logic jpeg_idle_o;

  logic tr_yumi_li, dut_yumi_li, dut_yumi_dummy_li;
  bsg_fsb_node_trace_replay #(.ring_width_p(88)
                             ,.rom_addr_width_p(64) )
    trace_replay
      ( .clk_i ( ~clk ) // Trace Replay should run on negative clock edge!
      , .reset_i( reset )
      , .en_i( 1'b1 )

      , .v_i   ( dut_v_r )
      , .data_i ( dut_data_r ) // Connect 88-bit DUT output to 88-bit trace input
      , .ready_o( tr_ready_lo ) // Trace replay ready to accept DUT output

      , .v_o   ( tr_v_lo )
      , .data_o( tr_data_lo )
      , .yumi_i( tr_yumi_li )

      , .rom_addr_o( rom_addr_li )
      , .rom_data_i( rom_data_lo )

      , .done_o()
      , .error_o()
      );
  assign tr_yumi_li  = dut_ready_lo & tr_v_lo;
  always_ff @(negedge clk)
    begin
      // dut_ready_r <= dut_ready_lo;
      // tr_yumi_li  <= dut_ready_r & tr_v_lo;
      dut_v_r     <= dut_v_lo;
      dut_data_r  <= dut_data_lo;
    end

  trace_rom #(.width_p(92),.addr_width_p(64))
    ROM
      (.addr_i( rom_addr_li )
      ,.data_o( rom_data_lo )
      );
// Connecting the Trace_Replay module to our Design (DUT)
// gcd DUT (
//       .data_in_valid_i(tr_v_lo),
//       .A_i(tr_data_lo[63:32]),
//       .B_i(tr_data_lo[31:0]),
//       .ready_o(dut_ready_lo),
//       .reset_i(reset),
//       .clk_i(clk),
//       .data_out_valid_o(dut_v_lo),
//       .data_out_o(dut_data_lo),
//       .yumi_i(dut_yumi_li)
//     );

// Connecting the Trace_Replay module to our Design (DUT)
// 88 bit trace inputs since we need to support 88 bit outputs (16*4 + 8*3)
// Actual Input is 32 bits so the 92 bit trace will be <4 bit opcode> <1 bit last> <4 bit strobe> <51 dummy data> <32 bit input data>
// Fixed Syntax error in jpeg_core_tb.v and trace format
    always_ff @(posedge clk) begin
      tr_v_dummy_lo <= tr_v_lo;
      tr_data_dummy_lo <= tr_data_lo;
      dut_yumi_dummy_li <= dut_yumi_li;
    end
    jpeg_core DUT (
    // Inputs
      .clk_i(clk),
      .rst_i(reset),
      .inport_valid_i(tr_v_dummy_lo),
      .inport_data_i(tr_data_dummy_lo[31:0]), // 32-bit data from trace [31:0]
      .inport_strb_i(tr_data_dummy_lo[86:83]), // 4-bit strobe from trace [86:83]
      .inport_last_i(tr_data_dummy_lo[87]), // 1-bit last from trace [87]
      .outport_accept_i(1'b1), // Hardcoded to 1 instead of dut_yumi_dummy_li from trace, TODO: dump data
    // Outputs
      .inport_accept_o(dut_ready_lo),//
      .outport_valid_o(dut_v_lo),
      .outport_width_o(dut_data_lo[87:72]),
      .outport_height_o(dut_data_lo[71:56]),
      .outport_pixel_x_o(dut_data_lo[55:40]),
      .outport_pixel_y_o(dut_data_lo[39:24]),
      .outport_pixel_r_o(dut_data_lo[23:16]),
      .outport_pixel_g_o(dut_data_lo[15:8]),
      .outport_pixel_b_o(dut_data_lo[7:0]),
      .idle_o(jpeg_idle_o)
    );

  

  always_ff @(negedge clk)
    begin
      dut_yumi_li <= tr_ready_lo & dut_v_lo;
     // dut_dummy_r <= dut_yumi_li; // Dummy signal for the delay
    end




endmodule
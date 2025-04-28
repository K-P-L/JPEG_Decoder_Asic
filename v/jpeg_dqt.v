//-----------------------------------------------------------------
//                      Baseline JPEG Decoder
//                             V0.1
//                       Ultra-Embedded.com
//                        Copyright 2020
//
//                   admin@ultra-embedded.com
//-----------------------------------------------------------------
//                      License: Apache 2.0
// This IP can be freely used in commercial projects, however you may
// want access to unreleased materials such as verification environments,
// or test vectors, as well as changes to the IP for integration purposes.
// If this is the case, contact the above address.
// I am interested to hear how and where this IP is used, so please get
// in touch!
//-----------------------------------------------------------------
// Copyright 2020 Ultra-Embedded.com
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//-----------------------------------------------------------------

module jpeg_dqt
(
    // Inputs
     input  logic           clk_i
    ,input  logic           rst_i
    ,input  logic           img_start_i
    ,input  logic           img_end_i
    ,input  logic [  1:0]   img_dqt_table_y_i
    ,input  logic [  1:0]   img_dqt_table_cb_i
    ,input  logic [  1:0]   img_dqt_table_cr_i
    ,input  logic           cfg_valid_i
    ,input  logic [  7:0]   cfg_data_i
    ,input  logic           cfg_last_i
    ,input  logic           inport_valid_i
    ,input  logic [ 15:0]   inport_data_i
    ,input  logic [  5:0]   inport_idx_i
    ,input  logic [ 31:0]   inport_id_i
    ,input  logic           inport_eob_i
    ,input  logic           yumi_i            // Yumi input signal (replaces outport_accept_i)

    // Outputs
    ,output logic           cfg_accept_o
    ,output logic           ready_o           // Ready output signal (replaces inport_blk_space_o)
    ,output logic           v_o               // Valid output signal (replaces outport_valid_o)
    ,output logic [ 15:0]   outport_data_o
    ,output logic [  5:0]   outport_idx_o
    ,output logic [ 31:0]   outport_id_o
    ,output logic           outport_eob_o
);

//-----------------------------------------------------------------
// DQT tables
//-----------------------------------------------------------------
// 4 * 256
// synthesis attribute ram_style of table_dqt_q is block
logic [7:0] table_dqt_q[0:255];

//-----------------------------------------------------------------
// Capture Index
//-----------------------------------------------------------------
logic [7:0] idx_q;

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        idx_q <= 8'hFF;
    else if (cfg_valid_i && cfg_last_i && cfg_accept_o)
        idx_q <= 8'hFF;
    else if (cfg_valid_i && cfg_accept_o)
        idx_q <= idx_q + 8'd1;
end

assign cfg_accept_o = 1'b1;

//-----------------------------------------------------------------
// Write DQT table
//-----------------------------------------------------------------
logic [1:0] cfg_table_q;

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        cfg_table_q <= 2'b0;
    else if (cfg_valid_i && cfg_accept_o && idx_q == 8'hFF)
        cfg_table_q <= cfg_data_i[1:0];
end

logic [7:0] cfg_table_addr_w;
assign cfg_table_addr_w = {cfg_table_q, idx_q[5:0]};

logic [1:0] table_src_w[0:3];

assign table_src_w[0] = img_dqt_table_y_i;
assign table_src_w[1] = img_dqt_table_cb_i;
assign table_src_w[2] = img_dqt_table_cr_i;
assign table_src_w[3] = 2'b0;

logic [7:0] table_rd_idx_w;
assign table_rd_idx_w = {table_src_w[inport_id_i[31:30]], inport_idx_i};

logic dqt_write_w;
assign dqt_write_w = cfg_valid_i && cfg_accept_o && idx_q != 8'hFF;

logic [7:0] dqt_table_addr_w;
assign dqt_table_addr_w = dqt_write_w ? cfg_table_addr_w : table_rd_idx_w;

logic [7:0] dqt_entry_q;

always_ff @ (posedge clk_i)
begin
    if (dqt_write_w)
        table_dqt_q[dqt_table_addr_w] <= cfg_data_i;

    dqt_entry_q <= table_dqt_q[dqt_table_addr_w];
end

//-----------------------------------------------------------------
// dezigzag: Reverse zigzag process
//-----------------------------------------------------------------
function logic [5:0] dezigzag;
    input logic [5:0] idx;
    logic [5:0] out_idx;
begin
    case (idx)
    6'd0: out_idx = 6'd0;
    6'd1: out_idx = 6'd1;
    6'd2: out_idx = 6'd8;
    6'd3: out_idx = 6'd16;
    6'd4: out_idx = 6'd9;
    6'd5: out_idx = 6'd2;
    6'd6: out_idx = 6'd3;
    6'd7: out_idx = 6'd10;
    6'd8: out_idx = 6'd17;
    6'd9: out_idx = 6'd24;
    6'd10: out_idx = 6'd32;
    6'd11: out_idx = 6'd25;
    6'd12: out_idx = 6'd18;
    6'd13: out_idx = 6'd11;
    6'd14: out_idx = 6'd4;
    6'd15: out_idx = 6'd5;
    6'd16: out_idx = 6'd12;
    6'd17: out_idx = 6'd19;
    6'd18: out_idx = 6'd26;
    6'd19: out_idx = 6'd33;
    6'd20: out_idx = 6'd40;
    6'd21: out_idx = 6'd48;
    6'd22: out_idx = 6'd41;
    6'd23: out_idx = 6'd34;
    6'd24: out_idx = 6'd27;
    6'd25: out_idx = 6'd20;
    6'd26: out_idx = 6'd13;
    6'd27: out_idx = 6'd6;
    6'd28: out_idx = 6'd7;
    6'd29: out_idx = 6'd14;
    6'd30: out_idx = 6'd21;
    6'd31: out_idx = 6'd28;
    6'd32: out_idx = 6'd35;
    6'd33: out_idx = 6'd42;
    6'd34: out_idx = 6'd49;
    6'd35: out_idx = 6'd56;
    6'd36: out_idx = 6'd57;
    6'd37: out_idx = 6'd50;
    6'd38: out_idx = 6'd43;
    6'd39: out_idx = 6'd36;
    6'd40: out_idx = 6'd29;
    6'd41: out_idx = 6'd22;
    6'd42: out_idx = 6'd15;
    6'd43: out_idx = 6'd23;
    6'd44: out_idx = 6'd30;
    6'd45: out_idx = 6'd37;
    6'd46: out_idx = 6'd44;
    6'd47: out_idx = 6'd51;
    6'd48: out_idx = 6'd58;
    6'd49: out_idx = 6'd59;
    6'd50: out_idx = 6'd52;
    6'd51: out_idx = 6'd45;
    6'd52: out_idx = 6'd38;
    6'd53: out_idx = 6'd31;
    6'd54: out_idx = 6'd39;
    6'd55: out_idx = 6'd46;
    6'd56: out_idx = 6'd53;
    6'd57: out_idx = 6'd60;
    6'd58: out_idx = 6'd61;
    6'd59: out_idx = 6'd54;
    6'd60: out_idx = 6'd47;
    6'd61: out_idx = 6'd55;
    6'd62: out_idx = 6'd62;
    default: out_idx = 6'd63; 
    endcase

    dezigzag = out_idx;
end
endfunction

//-----------------------------------------------------------------
// Process dequantisation and dezigzag
//-----------------------------------------------------------------
logic        inport_valid_q;
logic [15:0] inport_data_q;
logic [5:0]  inport_idx_q;
logic [31:0] inport_id_q;
logic        inport_eob_q;

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        inport_valid_q <= 1'b0;
    else
        inport_valid_q <= inport_valid_i && ~img_start_i;
end

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        inport_idx_q <= 6'b0;
    else
        inport_idx_q <= inport_idx_i;
end

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        inport_data_q <= 16'b0;
    else
        inport_data_q <= inport_data_i;
end

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        inport_id_q <= 32'b0;
    else if (inport_valid_i)
        inport_id_q <= inport_id_i;
end

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        inport_eob_q <= 1'b0;
    else
        inport_eob_q <= inport_eob_i;
end

//-----------------------------------------------------------------
// Output
//-----------------------------------------------------------------
logic               outport_valid_q;
logic signed [15:0] outport_data_q;
logic [5:0]         outport_idx_q;
logic [31:0]        outport_id_q;
logic               outport_eob_q;

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        outport_valid_q <= 1'b0;
    else
        outport_valid_q <= inport_valid_q && ~img_start_i;
end

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        outport_data_q <= 16'b0;
    else
        outport_data_q <= inport_data_q * dqt_entry_q;
end

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        outport_idx_q <= 6'b0;
    else
        outport_idx_q <= dezigzag(inport_idx_q);
end

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        outport_id_q <= 32'b0;
    else
        outport_id_q <= inport_id_q;
end

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        outport_eob_q <= 1'b0;
    else
        outport_eob_q <= inport_eob_q;
end

assign v_o = outport_valid_q;
assign outport_data_o = outport_data_q;
assign outport_idx_o = outport_idx_q;
assign outport_id_o = outport_id_q;    
assign outport_eob_o = outport_eob_q;

// Yumi protocol: Only advance if data is consumed (yumi_i) or no data to consume (!v_o)
assign ready_o = yumi_i || !v_o;

endmodule
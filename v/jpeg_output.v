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

module jpeg_output
(
    // Inputs
     input  logic           clk_i
    ,input  logic           rst_i
    ,input  logic           img_start_i
    ,input  logic           img_end_i
    ,input  logic [ 15:0]   img_width_i
    ,input  logic [ 15:0]   img_height_i
    ,input  logic [  1:0]   img_mode_i
    ,input  logic           inport_valid_i
    ,input  logic [ 31:0]   inport_data_i
    ,input  logic [  5:0]   inport_idx_i
    ,input  logic [ 31:0]   inport_id_i
    ,input  logic           yumi_i             // YUMI input signal (replaces outport_accept_i)

    // Outputs
    ,output logic           ready_o            // Ready output signal (replaces inport_accept_o)
    ,output logic           v_o                // Valid output signal (replaces outport_valid_o)
    ,output logic [ 15:0]   outport_width_o
    ,output logic [ 15:0]   outport_height_o
    ,output logic [ 15:0]   outport_pixel_x_o
    ,output logic [ 15:0]   outport_pixel_y_o
    ,output logic [  7:0]   outport_pixel_r_o
    ,output logic [  7:0]   outport_pixel_g_o
    ,output logic [  7:0]   outport_pixel_b_o
    ,output logic           idle_o
);

// Block types
typedef enum logic [1:0] {
    BLOCK_Y          = 2'd0,
    BLOCK_CB         = 2'd1,
    BLOCK_CR         = 2'd2,
    BLOCK_EOF        = 2'd3
} block_type_e;

// JPEG image formats
typedef enum logic [1:0] {
    JPEG_MONOCHROME  = 2'd0,
    JPEG_YCBCR_444   = 2'd1,
    JPEG_YCBCR_420   = 2'd2,
    JPEG_UNSUPPORTED = 2'd3
} jpeg_format_e;

logic valid_r;
logic output_space_w;
assign output_space_w = (!v_o || yumi_i);

//-----------------------------------------------------------------
// FIFO: Y
//-----------------------------------------------------------------
logic               y_v_w;         // Valid output (renamed from y_valid_w)
logic signed [31:0] y_value_w;
logic               y_yumi_w;      // YUMI signal (renamed from y_pop_w)
logic [31:0]        y_level_w;

jpeg_output_y_ram
u_ram_y
(
     .clk_i(clk_i)
    ,.rst_i(rst_i)

    ,.flush_i(img_start_i)
    ,.level_o(y_level_w)

    ,.push_i(inport_valid_i && (inport_id_i[31:30] == BLOCK_Y || inport_id_i[31:30] == BLOCK_EOF))
    ,.wr_idx_i(inport_idx_i)
    ,.data_in_i(inport_data_i)

    ,.v_o(y_v_w)              // Renamed from valid_o
    ,.data_out_o(y_value_w)
    ,.yumi_i(y_yumi_w)        // Renamed from pop_i
);

//-----------------------------------------------------------------
// FIFO: Cb
//-----------------------------------------------------------------
logic               cb_v_w;         // Valid output (renamed from cb_valid_w)
logic signed [31:0] cb_value_w;
logic               cb_yumi_w;      // YUMI signal (renamed from cb_pop_w)
logic [31:0]        cb_level_w;

jpeg_output_cx_ram
u_ram_cb
(
     .clk_i(clk_i)
    ,.rst_i(rst_i)

    ,.flush_i(img_start_i)
    ,.level_o(cb_level_w)
    ,.mode420_i(img_mode_i == JPEG_YCBCR_420)

    ,.push_i(inport_valid_i && (inport_id_i[31:30] == BLOCK_CB || inport_id_i[31:30] == BLOCK_EOF))
    ,.wr_idx_i(inport_idx_i)
    ,.data_in_i(inport_data_i)

    ,.v_o(cb_v_w)             // Renamed from valid_o
    ,.data_out_o(cb_value_w)
    ,.yumi_i(cb_yumi_w)       // Renamed from pop_i
);

//-----------------------------------------------------------------
// FIFO: Cr
//-----------------------------------------------------------------
logic               cr_v_w;         // Valid output (renamed from cr_valid_w)
logic signed [31:0] cr_value_w;
logic               cr_yumi_w;      // YUMI signal (renamed from cr_pop_w)
logic [31:0]        cr_level_w;

jpeg_output_cx_ram
u_ram_cr
(
     .clk_i(clk_i)
    ,.rst_i(rst_i)

    ,.flush_i(img_start_i)
    ,.level_o(cr_level_w)
    ,.mode420_i(img_mode_i == JPEG_YCBCR_420)

    ,.push_i(inport_valid_i && (inport_id_i[31:30] == BLOCK_CR || inport_id_i[31:30] == BLOCK_EOF))
    ,.wr_idx_i(inport_idx_i)
    ,.data_in_i(inport_data_i)

    ,.v_o(cr_v_w)             // Renamed from valid_o
    ,.data_out_o(cr_value_w)
    ,.yumi_i(cr_yumi_w)       // Renamed from pop_i
);

//-----------------------------------------------------------------
// FIFO: Info
//-----------------------------------------------------------------
logic        id_v_w;              // Valid output (renamed from id_valid_w)
logic [31:0] id_value_w;
logic        id_yumi_w;           // YUMI signal (renamed from id_pop_w)

jpeg_output_fifo
#(
     .WIDTH(32)
    ,.DEPTH(8)
    ,.ADDR_W(3)
)
u_info
(
     .clk_i(clk_i)
    ,.rst_i(rst_i)
    ,.flush_i(img_start_i)
 
    ,.push_i(inport_valid_i && (inport_id_i[31:30] == BLOCK_Y || inport_id_i[31:30] == BLOCK_EOF) && inport_idx_i == 6'd0)
    ,.data_in_i(inport_id_i)
    ,.ready_o()                  // Renamed from accept_o (unused)

    ,.v_o(id_v_w)                // Renamed from valid_o
    ,.data_out_o(id_value_w)
    ,.yumi_i(id_yumi_w)          // Renamed from pop_i
);

assign ready_o = (y_level_w <= 32'd384 && cr_level_w <= 32'd128) | idle_o;

//-----------------------------------------------------------------
// Block counter (0 - 63)
//-----------------------------------------------------------------
logic [5:0] idx_q;

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        idx_q <= 6'b0;
    else if (img_start_i)
        idx_q <= 6'b0;
    else if (valid_r && output_space_w)
        idx_q <= idx_q + 6'd1;
end

//-----------------------------------------------------------------
// Subsampling counter (420 chroma subsampling)
//-----------------------------------------------------------------
logic [1:0] subsmpl_q;

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        subsmpl_q <= 2'b0;
    else if (img_start_i)
        subsmpl_q <= 2'b0;
    else if (valid_r && output_space_w && img_mode_i == JPEG_YCBCR_420 && idx_q == 6'd63)
        subsmpl_q <= subsmpl_q + 2'd1;
end

//-----------------------------------------------------------------
// YUV -> RGB
//-----------------------------------------------------------------
logic active_q;

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        active_q <= 1'b0;
    else if (img_start_i)
        active_q <= 1'b0;
    else if (!active_q)
    begin
        if (img_mode_i == JPEG_MONOCHROME)
            active_q <= (y_level_w >= 32'd64);
        else if (img_mode_i == JPEG_YCBCR_444)
            active_q <= (y_level_w >= 32'd64) && (cb_level_w >= 32'd64) && (cr_level_w >= 32'd64);
        else if (subsmpl_q != 2'b0) // 420
            active_q <= 1'b1;
        else // 420
            active_q <= (y_level_w >= 32'd256) && (cb_level_w >= 32'd256) && (cr_level_w >= 32'd256);
    end
    else if (valid_r && output_space_w && idx_q == 6'd63)
        active_q <= 1'b0;
end

logic signed [31:0] r_conv_r;
logic signed [31:0] g_conv_r;
logic signed [31:0] b_conv_r;

// YUV to RGB conversion coefficients (fixed point)
logic signed [31:0] cr_1_402_w;
logic signed [31:0] cr_0_714_w;
logic signed [31:0] cb_0_344_w;
logic signed [31:0] cb_1_772_w;

assign cr_1_402_w = (cr_value_w * 5743) >>> 12; // cr_value_w * 1.402
assign cr_0_714_w = (cr_value_w * 2925) >>> 12; // cr_value_w * 0.71414
assign cb_0_344_w = (cb_value_w * 1410) >>> 12; // cb_value_w * 0.34414
assign cb_1_772_w = (cb_value_w * 7258) >>> 12; // cb_value_w * 1.772

always_comb
begin
    valid_r  = active_q;
    r_conv_r = 32'b0;
    g_conv_r = 32'b0;
    b_conv_r = 32'b0;

    if (img_mode_i == JPEG_MONOCHROME)
    begin
        r_conv_r = 128 + y_value_w;
        g_conv_r = 128 + y_value_w;
        b_conv_r = 128 + y_value_w;
    end
    else // if (img_mode_i == JPEG_YCBCR_444)
    begin
        r_conv_r = 128 + y_value_w + cr_1_402_w;
        g_conv_r = 128 + y_value_w - cb_0_344_w - cr_0_714_w;
        b_conv_r = 128 + y_value_w + cb_1_772_w;
    end
end

assign y_yumi_w  = output_space_w && active_q;
assign cb_yumi_w = output_space_w && active_q;
assign cr_yumi_w = output_space_w && active_q;
assign id_yumi_w = output_space_w && (idx_q == 6'd63);

//-----------------------------------------------------------------
// Outputs
//-----------------------------------------------------------------
logic        valid_q;
logic [15:0] pixel_x_q;
logic [15:0] pixel_y_q;
logic [7:0]  pixel_r_q;
logic [7:0]  pixel_g_q;
logic [7:0]  pixel_b_q;

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        valid_q <= 1'b0;
    else if (output_space_w)
        valid_q <= valid_r && (id_value_w[31:30] != BLOCK_EOF);
end

logic [31:0] x_start_w;
logic [31:0] y_start_w;

assign x_start_w = {13'b0, id_value_w[15:0], 3'b0};
assign y_start_w = {15'b0, id_value_w[29:16], 3'b0};

always_ff @ (posedge clk_i)
begin
    if (rst_i)
    begin
        pixel_x_q <= 16'b0;
        pixel_y_q <= 16'b0;
    end
    else if (output_space_w)
    begin
        // Calculate pixel coordinates
        pixel_x_q <= x_start_w[15:0] + {10'b0, idx_q[2:0]}; // idx_q % 8
        pixel_y_q <= y_start_w[15:0] + {13'b0, idx_q[5:3]}; // idx_q / 8
    end
end

always_ff @ (posedge clk_i)
begin
    if (rst_i)
    begin
        pixel_r_q <= 8'b0;
        pixel_g_q <= 8'b0;
        pixel_b_q <= 8'b0;
    end
    else if (output_space_w)
    begin
        // Clamp RGB values to 0-255 range
        pixel_r_q <= (|r_conv_r[31:8]) ? (r_conv_r[31:24] ^ 8'hff) : r_conv_r[7:0];
        pixel_g_q <= (|g_conv_r[31:8]) ? (g_conv_r[31:24] ^ 8'hff) : g_conv_r[7:0];
        pixel_b_q <= (|b_conv_r[31:8]) ? (b_conv_r[31:24] ^ 8'hff) : b_conv_r[7:0];
    end
end

assign v_o = valid_q;
assign outport_pixel_x_o = pixel_x_q;
assign outport_pixel_y_o = pixel_y_q;
assign outport_width_o = img_width_i;
assign outport_height_o = img_height_i;
assign outport_pixel_r_o = pixel_r_q;
assign outport_pixel_g_o = pixel_g_q;
assign outport_pixel_b_o = pixel_b_q;

//-----------------------------------------------------------------
// Idle
//-----------------------------------------------------------------
logic idle_q;

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        idle_q <= 1'b1;
    else if (img_start_i)
        idle_q <= 1'b0;
    else if (id_v_w && id_value_w[31:30] == BLOCK_EOF)
        idle_q <= 1'b1;
end

assign idle_o = idle_q;

endmodule
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

module jpeg_mcu_id
(
    // Inputs
     input  logic           clk_i
    ,input  logic           rst_i
    ,input  logic           img_start_i
    ,input  logic           img_end_i
    ,input  logic [ 15:0]   img_width_i
    ,input  logic [ 15:0]   img_height_i
    ,input  logic [  1:0]   img_mode_i
    ,input  logic           start_of_block_i
    ,input  logic           end_of_block_i

    // Outputs
    ,output logic [ 31:0]   block_id_o
    ,output logic [  1:0]   block_type_o
    ,output logic           end_of_image_o
);

//-----------------------------------------------------------------
// Block Type (Y, Cb, Cr)
//-----------------------------------------------------------------
// Image format constants
typedef enum logic [1:0] {
    JPEG_MONOCHROME  = 2'd0,
    JPEG_YCBCR_444   = 2'd1,
    JPEG_YCBCR_420   = 2'd2,
    JPEG_UNSUPPORTED = 2'd3
} jpeg_format_e;

// Block type constants
typedef enum logic [1:0] {
    BLOCK_Y          = 2'd0,
    BLOCK_CB         = 2'd1,
    BLOCK_CR         = 2'd2,
    BLOCK_EOF        = 2'd3
} block_type_e;

logic [1:0] block_type_q;  // Current block type
logic [2:0] type_idx_q;    // Position within MCU

always_ff @ (posedge clk_i)
begin
    if (rst_i)
    begin
        block_type_q <= BLOCK_Y;
        type_idx_q   <= 3'd0;
    end
    else if (img_start_i)
    begin
        block_type_q <= BLOCK_Y;
        type_idx_q   <= 3'd0;
    end
    else if (start_of_block_i && end_of_image_o)
    begin
        block_type_q <= BLOCK_EOF;
        type_idx_q   <= 3'd0;
    end
    else if (img_mode_i == JPEG_MONOCHROME)
        block_type_q <= BLOCK_Y;
    else if (img_mode_i == JPEG_YCBCR_444 && end_of_block_i)
    begin
        if (block_type_q == BLOCK_CR)
            block_type_q <= BLOCK_Y;
        else
            block_type_q <= block_type_q + 2'd1;
    end
    else if (img_mode_i == JPEG_YCBCR_420 && end_of_block_i)
    begin
        type_idx_q <= type_idx_q + 3'd1;

        case (type_idx_q)
        default:
            block_type_q <= BLOCK_Y;
        3'd3:
            block_type_q <= BLOCK_CB;
        3'd4:
            block_type_q <= BLOCK_CR;
        3'd5:
        begin
            block_type_q <= BLOCK_Y;
            type_idx_q   <= 3'd0;
        end
        endcase
    end
end

//-----------------------------------------------------------------
// Block index
//-----------------------------------------------------------------
// Calculate block dimensions
logic [15:0] width_rnd_w;
logic [15:0] block_x_max_w;
logic [15:0] img_w_div4_w;

assign width_rnd_w   = ((img_width_i+7) / 8) * 8;
assign block_x_max_w = width_rnd_w / 8;
assign img_w_div4_w  = width_rnd_w / 4;

// Block tracking registers
logic [15:0] block_x_q;     // Current block X position
logic [15:0] block_y_q;     // Current block Y position
logic [15:0] x_idx_q;       // X index for YCbCr 4:2:0
logic [15:0] y_idx_q;       // Y index for YCbCr 4:2:0
logic        end_of_image_q; // End of image flag

// Next block X position
logic [15:0] block_x_next_w;
assign block_x_next_w = block_x_q + 16'd1;

always_ff @ (posedge clk_i)
begin
    if (rst_i)
    begin
        block_x_q      <= 16'b0;
        block_y_q      <= 16'b0;
        x_idx_q        <= 16'b0;
        y_idx_q        <= 16'b0;
        end_of_image_q <= 1'b0;
    end
    else if (img_start_i)
    begin
        block_x_q      <= 16'b0;
        block_y_q      <= 16'b0;
        x_idx_q        <= 16'b0;
        y_idx_q        <= 16'b0;
        end_of_image_q <= 1'b0;
    end
    else if (end_of_block_i && ((img_mode_i == JPEG_MONOCHROME) || (img_mode_i == JPEG_YCBCR_444 && block_type_q == BLOCK_CR)))
    begin
        if (block_x_next_w == block_x_max_w)
        begin
            block_x_q <= 16'b0;
            block_y_q <= block_y_q + 16'd1;
        end
        else
            block_x_q <= block_x_next_w;

        if (img_end_i && block_x_next_w == block_x_max_w)
            end_of_image_q <= 1'b1;
    end
    else if (start_of_block_i && img_mode_i == JPEG_YCBCR_420 && block_type_q == BLOCK_Y)
    begin
        block_x_q <= ({x_idx_q[15:2], 2'b0} / 2) + (type_idx_q[0] ? 16'd1 : 16'd0);
        block_y_q <= y_idx_q + (type_idx_q[1] ? 16'd1 : 16'd0);

        // Y component
        if (type_idx_q < 3'd4)
        begin
            if ((x_idx_q + 16'd1) == img_w_div4_w)
            begin
                x_idx_q <= 16'd0;
                y_idx_q <= y_idx_q + 16'd2;
            end
            else
                x_idx_q <= x_idx_q + 16'd1;
        end
    end
    else if (start_of_block_i && img_mode_i == JPEG_YCBCR_420 && block_type_q == BLOCK_CR)
    begin
        if (img_end_i && block_x_next_w == block_x_max_w)
            end_of_image_q <= 1'b1;
    end
end

//-----------------------------------------------------------------
// Outputs
//-----------------------------------------------------------------
// Block ID (type=y|cb|cr, y pos, x pos)
assign block_id_o     = {block_type_q, block_y_q[13:0], block_x_q};
assign block_type_o   = block_type_q;

// End of image detection
assign end_of_image_o = end_of_image_q;

endmodule
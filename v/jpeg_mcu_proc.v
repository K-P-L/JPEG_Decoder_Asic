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

module jpeg_mcu_proc
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
    ,input  logic           inport_last_i
    ,input  logic           lookup_valid_i
    ,input  logic [  4:0]   lookup_width_i
    ,input  logic [  7:0]   lookup_value_i
    ,input  logic           yumi_i              // YUMI input signal (replaces outport_blk_space_i)

    // Outputs
    ,output logic [  5:0]   inport_pop_o        // Special signal - indicates bits to consume
    ,output logic           lookup_req_o        // Request to lookup table
    ,output logic [  1:0]   lookup_table_o
    ,output logic [ 15:0]   lookup_input_o
    ,output logic           v_o                 // Valid output signal (replaces outport_valid_o)
    ,output logic [ 15:0]   outport_data_o
    ,output logic [  5:0]   outport_idx_o
    ,output logic [ 31:0]   outport_id_o
    ,output logic           outport_eob_o
);

//-----------------------------------------------------------------
// Block Type (Y, Cb, Cr) and Huffman Tables
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

// Huffman table indices
typedef enum logic [1:0] {
    DHT_TABLE_Y_DC_IDX  = 2'd0,
    DHT_TABLE_Y_AC_IDX  = 2'd1,
    DHT_TABLE_CX_DC_IDX = 2'd2,
    DHT_TABLE_CX_AC_IDX = 2'd3
} dht_table_e;

logic start_block_w;
logic next_block_w;
logic end_of_image_w;
logic [1:0] block_type_w;

jpeg_mcu_id
u_id
(
     .clk_i(clk_i)
    ,.rst_i(rst_i)

    ,.img_start_i(img_start_i)
    ,.img_end_i(img_end_i)
    ,.img_width_i(img_width_i)
    ,.img_height_i(img_height_i)
    ,.img_mode_i(img_mode_i)

    ,.start_of_block_i(start_block_w)
    ,.end_of_block_i(next_block_w)

    ,.block_id_o(outport_id_o)
    ,.block_type_o(block_type_w)
    ,.end_of_image_o(end_of_image_w)
);

//-----------------------------------------------------------------
// FSM
//-----------------------------------------------------------------
typedef enum logic [4:0] {
    STATE_IDLE        = 5'd0,
    STATE_FETCH_WORD  = 5'd1,
    STATE_HUFF_LOOKUP = 5'd2,
    STATE_OUTPUT      = 5'd3,
    STATE_EOB         = 5'd4,
    STATE_EOF         = 5'd5
} state_e;

state_e state_q;
state_e next_state_r;

logic [7:0] code_bits_q;
logic [7:0] coeff_idx_q;

always_comb
begin
    next_state_r = state_q;

    case (state_q)
    STATE_IDLE:
    begin
        if (end_of_image_w && yumi_i)
            next_state_r = STATE_EOF;
        else if (inport_valid_i && yumi_i)
            next_state_r = STATE_FETCH_WORD;
    end
    STATE_FETCH_WORD:
    begin
        if (coeff_idx_q >= 8'd63)
            next_state_r = STATE_EOB;
        else if (inport_valid_i)
            next_state_r = STATE_HUFF_LOOKUP;
    end
    STATE_HUFF_LOOKUP:
    begin
        if (lookup_valid_i)
            next_state_r = STATE_OUTPUT;
    end
    STATE_OUTPUT:
    begin
        next_state_r = STATE_FETCH_WORD;
    end
    STATE_EOB:
    begin
        next_state_r = STATE_IDLE;
    end
    STATE_EOF:
    begin
        if (!img_end_i)
            next_state_r = STATE_IDLE;
    end
    default : ;
    endcase

    if (img_start_i)
        next_state_r = STATE_IDLE;
end

assign start_block_w = (state_q == STATE_IDLE && next_state_r != STATE_IDLE);
assign next_block_w  = (state_q == STATE_EOB);

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        state_q <= STATE_IDLE;
    else
        state_q <= next_state_r;
end

logic first_q;

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        first_q <= 1'b1;
    else if (state_q == STATE_IDLE)
        first_q <= 1'b1;
    else if (state_q == STATE_OUTPUT)
        first_q <= 1'b0;
end

//-----------------------------------------------------------------
// Huffman code lookup stash
//-----------------------------------------------------------------
logic [7:0] code_q;

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        code_q <= 8'b0;
    else if (state_q == STATE_HUFF_LOOKUP && lookup_valid_i)
        code_q <= lookup_value_i;
end

//-----------------------------------------------------------------
// code[3:0] = width of symbol
//-----------------------------------------------------------------
always_ff @ (posedge clk_i)
begin
    if (rst_i)
        code_bits_q <= 8'b0;
    else if (state_q == STATE_HUFF_LOOKUP && lookup_valid_i)
        code_bits_q <= {4'b0, lookup_value_i[3:0]};
end

//-----------------------------------------------------------------
// Lookup width flops
//-----------------------------------------------------------------
logic [4:0] lookup_width_q;

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        lookup_width_q <= 5'b0;
    else if (state_q == STATE_HUFF_LOOKUP && lookup_valid_i)
        lookup_width_q <= lookup_width_i;
end

//-----------------------------------------------------------------
// Data for coefficient (remainder from Huffman lookup)
//-----------------------------------------------------------------
logic [15:0] input_data_q;
logic [31:0] input_shift_w;

assign input_shift_w = inport_data_i >> (5'd16 - lookup_width_i);

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        input_data_q <= 16'b0;
    // Use remaining data for actual coeffecient
    else if (state_q == STATE_HUFF_LOOKUP && lookup_valid_i)
        input_data_q <= input_shift_w[15:0];
end

//-----------------------------------------------------------------
// Bit buffer pop
//-----------------------------------------------------------------
logic [5:0] pop_bits_r;
logic [4:0] coef_bits_w;

assign coef_bits_w = {1'b0, code_q[3:0]};

always_comb
begin
    pop_bits_r = 6'b0;

    case (state_q)
    STATE_OUTPUT:
    begin
        // DC coefficient
        if (coeff_idx_q == 8'd0)
            pop_bits_r = {1'b0, lookup_width_q} + coef_bits_w;
        // End of block or ZRL (no coefficient)
        else if (code_q == 8'b0 || code_q == 8'hF0)
            pop_bits_r = {1'b0, lookup_width_q};
        else
            pop_bits_r = {1'b0, lookup_width_q} + coef_bits_w;
    end
    default: ;
    endcase
end

assign lookup_req_o   = (state_q == STATE_FETCH_WORD) & inport_valid_i;
assign lookup_input_o = inport_data_i[31:16];
assign inport_pop_o   = pop_bits_r;

logic [1:0] lookup_table_r;

always_comb
begin
    lookup_table_r = DHT_TABLE_Y_DC_IDX;

    if (first_q) // (coeff_idx_q == 8'd0)
    begin
        if (block_type_w == BLOCK_Y)
            lookup_table_r = DHT_TABLE_Y_DC_IDX;
        else
            lookup_table_r = DHT_TABLE_CX_DC_IDX;
    end
    else
    begin
        if (block_type_w == BLOCK_Y)
            lookup_table_r = DHT_TABLE_Y_AC_IDX;
        else
            lookup_table_r = DHT_TABLE_CX_AC_IDX;
    end
end

assign lookup_table_o = lookup_table_r;

//-----------------------------------------------------------------------------
// decode_number: Extract number from code / width
//-----------------------------------------------------------------------------
function logic [15:0] decode_number;
    input logic [15:0] w;
    input logic [4:0]  bits;
    
    logic signed [15:0] code;
begin
    code = w;

    if ((code & (1<<(bits - 5'd1))) == 16'b0 && bits != 5'd0)
    begin
        code = (code | ((~0) << bits)) + 1;
    end
    
    decode_number = code;
end
endfunction

//-----------------------------------------------------------------
// Previous DC coeffecient
//-----------------------------------------------------------------
logic [1:0] comp_idx_w;
logic [15:0] prev_dc_coeff_q[0:3];
logic [15:0] dc_coeff_q;

assign comp_idx_w = block_type_w;

always_ff @ (posedge clk_i)
begin

    if (rst_i)
      begin
        for (int i = 0; i < 4; i = i + 1)
            prev_dc_coeff_q[i] <= 16'b0;
      end
    else if (img_start_i) //FIXME: kaulad - Make a part of if condition at line 313
     begin
        for (int i = 0; i < 4; i = i + 1)
            prev_dc_coeff_q[i] <= 16'b0;
     end
    else if (state_q == STATE_EOB)
        prev_dc_coeff_q[comp_idx_w] <= dc_coeff_q;
end

//-----------------------------------------------------------------
// coeff
//-----------------------------------------------------------------
logic [15:0] coeff_r;

always_comb
begin
    if (coeff_idx_q == 8'b0)
        coeff_r = decode_number(input_data_q >> (16 - coef_bits_w), coef_bits_w) + prev_dc_coeff_q[comp_idx_w];
    else
        coeff_r = decode_number(input_data_q >> (16 - coef_bits_w), coef_bits_w);
end

//-----------------------------------------------------------------
// dc_coeff
//-----------------------------------------------------------------
always_ff @ (posedge clk_i)
begin
    if (rst_i)
        dc_coeff_q <= 16'b0;
    else if (state_q == STATE_OUTPUT && coeff_idx_q == 8'b0)
        dc_coeff_q <= coeff_r;
end

//-----------------------------------------------------------------
// DC / AC coeff
//-----------------------------------------------------------------
logic [15:0] coeff_q;

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        coeff_q <= 16'b0;
    else if (state_q == STATE_OUTPUT)
        coeff_q <= coeff_r;
end

//-----------------------------------------------------------------
// Coeffecient index
//-----------------------------------------------------------------
always_ff @ (posedge clk_i)
begin
    if (rst_i)
        coeff_idx_q <= 8'b0;
    else if (state_q == STATE_EOB || img_start_i)
        coeff_idx_q <= 8'b0;
    else if (state_q == STATE_FETCH_WORD && !first_q && inport_valid_i)
        coeff_idx_q <= coeff_idx_q + 8'd1;
    else if (state_q == STATE_OUTPUT)
    begin
        // DC
        if (coeff_idx_q == 8'b0)
            ;  // No change
        // AC
        else
        begin
            // End of block
            if (code_q == 8'b0)
                coeff_idx_q <= 8'd64;
            // ZRL - 16 zeros
            else if (code_q == 8'hF0)
                coeff_idx_q <= coeff_idx_q + 8'd15;
            // RLE number zeros (0 - 15)
            else
                coeff_idx_q <= coeff_idx_q + {4'b0, code_q[7:4]};
        end
    end
end

//-----------------------------------------------------------------
// Output push
//-----------------------------------------------------------------

logic push_q;

always_ff @ (posedge clk_i)
begin
    if (rst_i)
        push_q <= 1'b0;
    else if (state_q == STATE_OUTPUT || state_q == STATE_EOF)
        push_q <= 1'b1;
    else
        push_q <= 1'b0;
end
  
assign v_o = push_q && (coeff_idx_q < 8'd64);
assign outport_data_o = coeff_q;
assign outport_idx_o = coeff_idx_q[5:0];
assign outport_eob_o = (state_q == STATE_EOB) || 
                       (state_q == STATE_EOF && push_q);
  
// Comments: kaulad - Commented out the below code for performance modelling

// `ifdef verilator
// function get_valid; /*verilator public*/
// begin
//     get_valid = outport_valid_o && block_type_w != BLOCK_EOF;
// end
// endfunction
// function [5:0] get_sample_idx; /*verilator public*/
// begin
//     get_sample_idx = outport_idx_o;
// end
// endfunction
// function [15:0] get_sample; /*verilator public*/
// begin
//     get_sample = outport_data_o;
// end
// endfunction

// function [5:0] get_bitbuffer_pop; /*verilator public*/
// begin
//     get_bitbuffer_pop = inport_pop_o;
// end
// endfunction

// function get_dht_valid; /*verilator public*/
// begin
//     get_dht_valid = lookup_valid_i && (state_q == STATE_HUFF_LOOKUP);
// end
// endfunction
// function [4:0] get_dht_width; /*verilator public*/
// begin
//     get_dht_width = lookup_width_i;
// end
// endfunction
// function [7:0] get_dht_value; /*verilator public*/
// begin
//     get_dht_value = lookup_value_i;
// end
// endfunction
// `endif


endmodule
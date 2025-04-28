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

module jpeg_output_fifo
//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
     parameter WIDTH            = 8,
     parameter DEPTH            = 4,
     parameter ADDR_W           = 2
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
(
    // Inputs
     input  logic                clk_i
    ,input  logic                rst_i
    ,input  logic [WIDTH-1:0]    data_in_i
    ,input  logic                push_i      // Valid input signal
    ,input  logic                yumi_i      // YUMI input signal (replaces pop_i)
    ,input  logic                flush_i

    // Outputs
    ,output logic [WIDTH-1:0]    data_out_o
    ,output logic                ready_o     // Ready output signal (replaces accept_o)
    ,output logic                v_o         // Valid output signal (replaces valid_o)
);

//-----------------------------------------------------------------
// Local Params
//-----------------------------------------------------------------
localparam COUNT_W = ADDR_W + 1;

//-----------------------------------------------------------------
// Registers
//-----------------------------------------------------------------
// Synthesis attributes for RAM inference
// synthesis attribute ram_style of ram_q is distributed
logic [WIDTH-1:0]  ram_q[0:DEPTH-1];
logic [ADDR_W-1:0] rd_ptr_q;
logic [ADDR_W-1:0] wr_ptr_q;
logic [COUNT_W-1:0] count_q;

//-----------------------------------------------------------------
// Sequential
//-----------------------------------------------------------------
always_ff @ (posedge clk_i)
begin
    if (rst_i)
    begin
        count_q   <= {(COUNT_W) {1'b0}};
        rd_ptr_q  <= {(ADDR_W) {1'b0}};
        wr_ptr_q  <= {(ADDR_W) {1'b0}};
    end
    else if (flush_i)
    begin
        count_q   <= {(COUNT_W) {1'b0}};
        rd_ptr_q  <= {(ADDR_W) {1'b0}};
        wr_ptr_q  <= {(ADDR_W) {1'b0}};
    end
    else
    begin
        // Push - when input valid and FIFO ready
        if (push_i & ready_o)
        begin
            ram_q[wr_ptr_q] <= data_in_i;
            wr_ptr_q        <= wr_ptr_q + 1'b1;
        end

        // Pop - when FIFO valid and downstream consumes (yumi)
        if (yumi_i & v_o)
            rd_ptr_q <= rd_ptr_q + 1'b1;

        // Count up - push without pop
        if ((push_i & ready_o) & ~(yumi_i & v_o))
            count_q <= count_q + 1'b1;
        // Count down - pop without push
        else if (~(push_i & ready_o) & (yumi_i & v_o))
            count_q <= count_q - 1'b1;
    end
end

//-------------------------------------------------------------------
// Combinatorial
//-------------------------------------------------------------------
// FIFO has valid data when count is non-zero
assign v_o = (count_q != 0);

// FIFO can accept data when not full
assign ready_o = (count_q != DEPTH);

// Output data from read pointer position
assign data_out_o = ram_q[rd_ptr_q];

endmodule
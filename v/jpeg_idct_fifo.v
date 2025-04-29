//-----------------------------------------------------------------
//              Baseline JPEG Decoder - FIFO (ASIC Target)
//                          V0.2 - ASIC Refactor
//                     Ultra-Embedded.com
//                        Copyright 2020-2025
//
//                    admin@ultra-embedded.com
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
// Modification Notes:
// - Replaced push/pop/accept/valid with valid/ready handshake
// - Replaced `reg` with `logic`
// - Replaced `always` with `always_ff` and `assign` (or `always_comb`)
//-----------------------------------------------------------------

module jpeg_idct_fifo_asic
//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
    parameter WIDTH       = 8,
    parameter DEPTH       = 4,
    // ADDR_W calculation moved inside module for clarity if DEPTH changes
    parameter ADDR_W      = $clog2(DEPTH) // Calculate address width based on DEPTH
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
(
    // Clock and Reset
    input  logic           clk_i,
    input  logic           rst_i, // Asynchronous or Synchronous Reset (posedge)

    // Input Handshake (Producer -> FIFO)
    input  logic [WIDTH-1:0] data_in_i,   // Data from producer
    input  logic           valid_in_i,  // Producer indicates data_in_i is valid
    output logic           ready_out_o, // FIFO indicates it can accept data

    // Output Handshake (FIFO -> Consumer)
    output logic [WIDTH-1:0] data_out_o,  // Data to consumer
    output logic           valid_out_o, // FIFO indicates data_out_o is valid
    input  logic           ready_in_i,  // Consumer indicates it can accept data

    // Control
    input  logic           flush_i      // Synchronous flush signal
);

//-----------------------------------------------------------------
// Local Params
//-----------------------------------------------------------------
localparam COUNT_W = ADDR_W + 1; // Need one extra bit to represent 'DEPTH' count

//-----------------------------------------------------------------
// Internal Signals
//-----------------------------------------------------------------
logic [WIDTH-1:0]  ram_q[DEPTH-1:0]; // FIFO storage RAM
logic [ADDR_W-1:0] rd_ptr_q;         // Read pointer register
logic [ADDR_W-1:0] wr_ptr_q;         // Write pointer register
logic [COUNT_W-1:0] count_q;          // Occupancy count register

logic              push_condition;   // Internal signal: data is being pushed
logic              pop_condition;    // Internal signal: data is being popped

//-----------------------------------------------------------------
// Combinational Logic
//-----------------------------------------------------------------

// Handshake Logic:
// FIFO is ready to accept if it's not full
assign ready_out_o = (count_q != DEPTH);
// Data is valid to output if FIFO is not empty
assign valid_out_o = (count_q != 0);

// Transaction Conditions:
// A push happens when the producer has valid data AND the FIFO is ready
assign push_condition = valid_in_i & ready_out_o;
// A pop happens when the FIFO has valid data AND the consumer is ready
assign pop_condition  = valid_out_o & ready_in_i;

// Output data assignment directly from RAM based on read pointer
assign data_out_o = ram_q[rd_ptr_q];

//-----------------------------------------------------------------
// Sequential Logic (Registers)
//-----------------------------------------------------------------
always_ff @ (posedge clk_i or posedge rst_i) begin
    if (rst_i) begin // Asynchronous or Synchronous Reset logic
        count_q  <= '0; // Use '0 for aggregate assignment
        rd_ptr_q <= '0;
        wr_ptr_q <= '0;
        // Optional: Clear RAM on reset (depends on requirements)
        // for (int i = 0; i < DEPTH; i++) begin
        //     ram_q[i] <= '0;
        // end
    end else if (flush_i) begin // Synchronous flush
        count_q  <= '0;
        rd_ptr_q <= '0;
        wr_ptr_q <= '0;
        // Optional: Clear RAM on flush
        // for (int i = 0; i < DEPTH; i++) begin
        //     ram_q[i] <= '0;
        // end
    end else begin
        // Write Logic: Write to RAM and increment write pointer if a push occurs
        if (push_condition) begin
            ram_q[wr_ptr_q] <= data_in_i;
            wr_ptr_q        <= wr_ptr_q + 1'b1; // Use 1'b1 for clarity
        end

        // Read Logic: Increment read pointer if a pop occurs
        if (pop_condition) begin
            rd_ptr_q <= rd_ptr_q + 1'b1;
        end

        // Counter Logic: Update based on push/pop conditions
        // Only push: Increment count
        if (push_condition && !pop_condition) begin
            count_q <= count_q + 1'b1;
        // Only pop: Decrement count
        end else if (!push_condition && pop_condition) begin
            count_q <= count_q - 1'b1;
        // Simultaneous push and pop: Count remains the same
        // No push or pop: Count remains the same
        end else begin
            count_q <= count_q; // Explicitly show no change
        end
    end
end

endmodule
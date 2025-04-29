module jpeg_idct_transpose
(
    // Input port declarations
     input           clk_i               // Clock input
    ,input           rst_i               // Reset input
    ,input           img_start_i         // Image start signal
    ,input           img_end_i           // Image end signal
    ,input           inport_valid_i      // Input port valid signal (v_i)
    ,input  [ 31:0]  inport_data_i       // 32-bit input data
    ,input  [  5:0]  inport_idx_i        // 6-bit input index
    ,input           yumi_i              // YUMI input signal (replaces outport_ready_i)

    // Output port declarations
    ,output          ready_o             // Ready output signal (replaces inport_accept_o)
    ,output          v_o                 // Valid output signal (replaces outport_valid_o)
    ,output [ 31:0]  outport_data0_o     // 32-bit output data (channel 0)
    ,output [ 31:0]  outport_data1_o     // 32-bit output data (channel 1)
    ,output [ 31:0]  outport_data2_o     // 32-bit output data (channel 2)
    ,output [ 31:0]  outport_data3_o     // 32-bit output data (channel 3)
    ,output [  2:0]  outport_idx_o       // 3-bit output index
);


// Register declarations for control signals
reg         block_wr_q;        // Block write index register (toggles between 0/1)
reg         block_rd_q;        // Block read index register (toggles between 0/1)
reg [5:0]   rd_idx_q;          // Read index register (counts from 0 to 63)
reg [3:0]   rd_addr_q;         // Read address register (used for addressing memory)

// Wire to compute the write pointer based on block_wr_q and inport_idx_i
wire [4:0]  wr_ptr_w = {block_wr_q, inport_idx_i[3:0]};  // Concatenation of block_wr_q and lower 4 bits of inport_idx_i

// Output data wires from the four RAM instances
wire [31:0] outport_data0_w;   // Output data wire from RAM 0
wire [31:0] outport_data1_w;   // Output data wire from RAM 1
wire [31:0] outport_data2_w;   // Output data wire from RAM 2
wire [31:0] outport_data3_w;   // Output data wire from RAM 3

// Write enable signals for the four RAM instances based on inport_idx_i[5:4]
wire wr0_w = inport_valid_i && ready_o && (inport_idx_i[5:4] == 2'd0);  // Write enable for RAM 0
wire wr1_w = inport_valid_i && ready_o && (inport_idx_i[5:4] == 2'd1);  // Write enable for RAM 1
wire wr2_w = inport_valid_i && ready_o && (inport_idx_i[5:4] == 2'd2);  // Write enable for RAM 2
wire wr3_w = inport_valid_i && ready_o && (inport_idx_i[5:4] == 2'd3);  // Write enable for RAM 3

// RAM instance 0 instantiation
jpeg_idct_transpose_ram
u_ram0
(
     .clk0_i(clk_i)            // Clock for port 0 is the module clock
    ,.rst0_i(rst_i)            // Reset for port 0 is the module reset
    ,.clk1_i(clk_i)            // Clock for port 1 is the module clock
    ,.rst1_i(rst_i)            // Reset for port 1 is the module reset

    ,.addr0_i(wr_ptr_w)        // Port 0 address is the write pointer
    ,.data0_i(inport_data_i)   // Port 0 data is the input data
    ,.wr0_i(wr0_w)             // Port 0 write enable is wr0_w
    ,.data0_o()                // Port 0 data output is not used

    ,.addr1_i({block_rd_q, rd_addr_q})  // Port 1 address is concatenation of block_rd_q and rd_addr_q
    ,.data1_i(32'b0)           // Port 1 data input is all zeros (read-only port)
    ,.wr1_i(1'b0)              // Port 1 write enable is always 0 (read-only port)
    ,.data1_o(outport_data0_w) // Port 1 data output connects to outport_data0_w
);

// RAM instance 1 instantiation - similar to RAM 0 but with different write enable and output
jpeg_idct_transpose_ram
u_ram1
(
     .clk0_i(clk_i)            // Clock for port 0 is the module clock
    ,.rst0_i(rst_i)            // Reset for port 0 is the module reset
    ,.clk1_i(clk_i)            // Clock for port 1 is the module clock
    ,.rst1_i(rst_i)            // Reset for port 1 is the module reset

    ,.addr0_i(wr_ptr_w)        // Port 0 address is the write pointer
    ,.data0_i(inport_data_i)   // Port 0 data is the input data
    ,.wr0_i(wr1_w)             // Port 0 write enable is wr1_w
    ,.data0_o()                // Port 0 data output is not used

    ,.addr1_i({block_rd_q, rd_addr_q})  // Port 1 address is concatenation of block_rd_q and rd_addr_q
    ,.data1_i(32'b0)           // Port 1 data input is all zeros (read-only port)
    ,.wr1_i(1'b0)              // Port 1 write enable is always 0 (read-only port)
    ,.data1_o(outport_data1_w) // Port 1 data output connects to outport_data1_w
);

// RAM instance 2 instantiation - similar to RAM 0/1 but with different write enable and output
jpeg_idct_transpose_ram
u_ram2
(
     .clk0_i(clk_i)            // Clock for port 0 is the module clock
    ,.rst0_i(rst_i)            // Reset for port 0 is the module reset
    ,.clk1_i(clk_i)            // Clock for port 1 is the module clock
    ,.rst1_i(rst_i)            // Reset for port 1 is the module reset

    ,.addr0_i(wr_ptr_w)        // Port 0 address is the write pointer
    ,.data0_i(inport_data_i)   // Port 0 data is the input data
    ,.wr0_i(wr2_w)             // Port 0 write enable is wr2_w
    ,.data0_o()                // Port 0 data output is not used

    ,.addr1_i({block_rd_q, rd_addr_q})  // Port 1 address is concatenation of block_rd_q and rd_addr_q
    ,.data1_i(32'b0)           // Port 1 data input is all zeros (read-only port)
    ,.wr1_i(1'b0)              // Port 1 write enable is always 0 (read-only port)
    ,.data1_o(outport_data2_w) // Port 1 data output connects to outport_data2_w
);

// RAM instance 3 instantiation - similar to RAM 0/1/2 but with different write enable and output
jpeg_idct_transpose_ram
u_ram3
(
     .clk0_i(clk_i)            // Clock for port 0 is the module clock
    ,.rst0_i(rst_i)            // Reset for port 0 is the module reset
    ,.clk1_i(clk_i)            // Clock for port 1 is the module clock
    ,.rst1_i(rst_i)            // Reset for port 1 is the module reset

    ,.addr0_i(wr_ptr_w)        // Port 0 address is the write pointer
    ,.data0_i(inport_data_i)   // Port 0 data is the input data
    ,.wr0_i(wr3_w)             // Port 0 write enable is wr3_w
    ,.data0_o()                // Port 0 data output is not used

    ,.addr1_i({block_rd_q, rd_addr_q})  // Port 1 address is concatenation of block_rd_q and rd_addr_q
    ,.data1_i(32'b0)           // Port 1 data input is all zeros (read-only port)
    ,.wr1_i(1'b0)              // Port 1 write enable is always 0 (read-only port)
    ,.data1_o(outport_data3_w) // Port 1 data output connects to outport_data3_w
);

//-----------------------------------------------------------------
// Input Buffer Control Logic
//-----------------------------------------------------------------
reg [1:0] block_ready_q;       // Block ready register (2 bits for ping-pong buffer)

// Sequential logic for block control registers
always_ff @ (posedge clk_i )
if (rst_i)                     // On reset
begin
    block_ready_q     <= 2'b0; // Clear block ready flags
    block_wr_q        <= 1'b0; // Clear write block index
    block_rd_q        <= 1'b0; // Clear read block index
end
else if (img_start_i)          // On image start
begin
    block_ready_q     <= 2'b0; // Clear block ready flags
    block_wr_q        <= 1'b0; // Clear write block index
    block_rd_q        <= 1'b0; // Clear read block index
end
else                           // Normal operation
begin
    // If completed writing a full block (reached index 63)
    if (inport_valid_i && inport_idx_i == 6'd63 && ready_o)
    begin
        block_ready_q[block_wr_q] <= 1'b1;   // Mark the current write block as ready
        block_wr_q                <= ~block_wr_q; // Toggle to the other write block
    end

    // If completed reading a full block (reached index 63) AND data was consumed (yumi_i)
    if (v_o && yumi_i && rd_idx_q[5:0] == 6'd63)
    begin
        block_ready_q[block_rd_q] <= 1'b0;   // Mark the current read block as not ready
        block_rd_q <= ~block_rd_q;           // Toggle to the other read block
    end
end

// Ready output signal: accept data when the current write block is not ready
assign ready_o = ~block_ready_q[block_wr_q];

//-----------------------------------------------------------------
// State Machine Definition
//-----------------------------------------------------------------
// Define state machine states using enum
typedef enum logic [1:0] {
    STATE_IDLE    = 2'd0,  // IDLE state - waiting for data
    STATE_SETUP   = 2'd1,  // SETUP state - preparing for transpose
    STATE_ACTIVE  = 2'd2   // ACTIVE state - performing transpose
} state_e;

state_e state_q;           // Current state register
state_e next_state_r;      // Next state register

// Combinational logic for state transitions
always_comb
begin
    next_state_r = state_q;           // Default: stay in current state

    case (state_q)
    STATE_IDLE:                       // In IDLE state
    begin
        // Transition when block is ready - no need to check outport_ready_i 
        // since we use yumi handshake now
        if (block_ready_q[block_rd_q])
            next_state_r = STATE_SETUP;  // Go to SETUP state
    end
    STATE_SETUP:                      // In SETUP state
    begin
        next_state_r = STATE_ACTIVE;  // Always go to ACTIVE state next
    end
    STATE_ACTIVE:                     // In ACTIVE state
    begin
        // Only transition if a complete block has been read AND consumed (yumi_i)
        if (v_o && yumi_i && rd_idx_q == 6'd63)
            next_state_r = STATE_IDLE;  // Go back to IDLE state
    end
    default: ;                        // Default case does nothing
    endcase

    if (img_start_i)                  // If image start signal is active
        next_state_r = STATE_IDLE;    // Go to IDLE state
end

// Sequential logic for state register
always_ff @ (posedge clk_i )
if (rst_i)                           // On reset
    state_q <= STATE_IDLE;           // Go to IDLE state
else
    state_q <= next_state_r;         // Otherwise update to next state

// Sequential logic for read index register
always_ff @ (posedge clk_i )
if (rst_i)                           // On reset
    rd_idx_q <= 6'b0;                // Clear read index
else if (img_start_i)                // On image start
    rd_idx_q <= 6'b0;                // Clear read index
else if (state_q == STATE_ACTIVE && (v_o && yumi_i || !v_o))    // In ACTIVE state AND (data consumed OR not valid)
    rd_idx_q <= rd_idx_q + 6'd1;     // Increment read index

// Sequential logic for read address register
always_ff @ (posedge clk_i )
if (rst_i)                           // On reset
    rd_addr_q <= 4'b0;               // Clear read address
else if (state_q == STATE_IDLE)      // In IDLE state
    rd_addr_q <= 4'b0;               // Clear read address
else if (state_q == STATE_SETUP)     // In SETUP state
    rd_addr_q <= 4'd8;               // Initialize read address to 8
else if (state_q == STATE_ACTIVE && (v_o && yumi_i || !v_o))    // In ACTIVE state AND (data consumed OR not valid)
begin
    case (rd_idx_q[2:0])             // Based on the lower 3 bits of read index
    3'd0: rd_addr_q <= rd_addr_q - 4'd8;  // Subtract 8 from read address
    3'd1: rd_addr_q <= rd_addr_q + 4'd8;  // Add 8 to read address
    3'd2: ;                               // Do nothing
    3'd3: rd_addr_q <= rd_addr_q - 4'd8;  // Subtract 8 from read address
    3'd4: rd_addr_q <= rd_addr_q + 4'd8;  // Add 8 to read address
    3'd5: rd_addr_q <= rd_addr_q - 4'd8;  // Subtract 8 from read address
    3'd6: rd_addr_q <= rd_addr_q + 4'd1;  // Add 1 to read address
    3'd7: rd_addr_q <= rd_addr_q + 4'd8;  // Add 8 to read address
    endcase
end

// Output assignments
assign v_o = (state_q == STATE_ACTIVE);  // Output is valid when in ACTIVE state
assign outport_idx_o   = rd_idx_q[2:0];              // Output index is lower 3 bits of read index
assign outport_data0_o = outport_data0_w;            // Connect output data 0 to RAM 0 output
assign outport_data1_o = outport_data1_w;            // Connect output data 1 to RAM 1 output
assign outport_data2_o = outport_data2_w;            // Connect output data 2 to RAM 2 output
assign outport_data3_o = outport_data3_w;            // Connect output data 3 to RAM 3 output

endmodule
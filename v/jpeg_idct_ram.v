module jpeg_idct_ram
(
    // Inputs
     input           clk_i           // Clock input signal to synchronize all operations
    ,input           rst_i           // Reset input signal to initialize module state
    ,input           img_start_i     // Input signal indicating start of a new image
    ,input           img_end_i       // Input signal indicating end of current image
    ,input           inport_valid_i  // Input signal indicating that inport_data_i contains valid data
    ,input  [ 15:0]  inport_data_i   // 16-bit input data bus for coefficient data
    ,input  [  5:0]  inport_idx_i    // 6-bit index to identify which of the 64 DCT coefficients is being input
    ,input           inport_eob_i    // End-of-block signal indicating the last coefficient of a block
    ,input           yumi_i          // YUMI input signal (replaces outport_ready_i)

    // Outputs
    ,output          ready_o         // Ready output signal (replaces inport_accept_o)
    ,output          v_o             // Valid output signal (replaces outport_valid_o)
    ,output [ 15:0]  outport_data0_o // 16-bit output data bus for coefficient group 0
    ,output [ 15:0]  outport_data1_o // 16-bit output data bus for coefficient group 1
    ,output [ 15:0]  outport_data2_o // 16-bit output data bus for coefficient group 2
    ,output [ 15:0]  outport_data3_o // 16-bit output data bus for coefficient group 3
    ,output [  2:0]  outport_idx_o   // 3-bit output index indicating which coefficient is being output
);


// Block control registers
reg [1:0]   block_wr_q;   // 2-bit register to track which of 4 blocks is currently being written to
reg [1:0]   block_rd_q;   // 2-bit register to track which of 4 blocks is currently being read from
reg [5:0]   rd_idx_q;     // 6-bit register to track which coefficient (0-63) is being read
reg [3:0]   rd_addr_q;    // 4-bit register for RAM read address within a block

// Construct the full write pointer by combining block number and coefficient position
wire [5:0]  wr_ptr_w = {block_wr_q, inport_idx_i[5:3], inport_idx_i[0]}; // Combine block ID and coefficient position for RAM addressing

// Output data wires from each RAM
wire [15:0] outport_data0_w; // 16-bit wire holding output data from RAM 0
wire [15:0] outport_data1_w; // 16-bit wire holding output data from RAM 1
wire [15:0] outport_data2_w; // 16-bit wire holding output data from RAM 2
wire [15:0] outport_data3_w; // 16-bit wire holding output data from RAM 3

// Write enable signals for each RAM based on coefficient index
// Each RAM stores a specific subset of coefficients based on the lower 3 bits of the index
wire wr0_w = inport_valid_i && ready_o && (inport_idx_i[2:0] == 3'd0 || inport_idx_i[2:0] == 3'd1); // Enable writing to RAM 0 for coefficients 0,1
wire wr1_w = inport_valid_i && ready_o && (inport_idx_i[2:0] == 3'd2 || inport_idx_i[2:0] == 3'd3); // Enable writing to RAM 1 for coefficients 2,3
wire wr2_w = inport_valid_i && ready_o && (inport_idx_i[2:0] == 3'd4 || inport_idx_i[2:0] == 3'd5); // Enable writing to RAM 2 for coefficients 4,5
wire wr3_w = inport_valid_i && ready_o && (inport_idx_i[2:0] == 3'd6 || inport_idx_i[2:0] == 3'd7); // Enable writing to RAM 3 for coefficients 6,7

// Instantiate dual-port RAM for coefficients 0,1
jpeg_idct_ram_dp // Instantiate the dual-port RAM module
u_ram0 // Instance name for the first RAM
(
     .clk0_i(clk_i)              // Connect system clock to port 0 clock
    ,.rst0_i(rst_i)              // Connect system reset to port 0 reset
    ,.clk1_i(clk_i)              // Connect system clock to port 1 clock
    ,.rst1_i(rst_i)              // Connect system reset to port 1 reset

    // Port 0 connections (write port)
    ,.addr0_i(wr_ptr_w)          // Connect calculated write address
    ,.data0_i(inport_data_i)     // Connect input data
    ,.wr0_i(wr0_w)               // Connect write enable signal for RAM 0
    ,.data0_o()                  // Leave port 0 output disconnected (not used)

    // Port 1 connections (read port)
    ,.addr1_i({block_rd_q, rd_addr_q})  // Connect calculated read address
    ,.data1_i(16'b0)             // Connect zeros to write data (reads only)
    ,.wr1_i(1'b0)                // Connect constant 0 to write enable (reads only)
    ,.data1_o(outport_data0_w)   // Connect output data wire
);

// Instantiate dual-port RAM for coefficients 2,3
jpeg_idct_ram_dp // Instantiate the dual-port RAM module
u_ram1 // Instance name for the second RAM
(
     .clk0_i(clk_i)              // Connect system clock to port 0 clock
    ,.rst0_i(rst_i)              // Connect system reset to port 0 reset
    ,.clk1_i(clk_i)              // Connect system clock to port 1 clock
    ,.rst1_i(rst_i)              // Connect system reset to port 1 reset

    // Port 0 connections (write port)
    ,.addr0_i(wr_ptr_w)          // Connect calculated write address
    ,.data0_i(inport_data_i)     // Connect input data
    ,.wr0_i(wr1_w)               // Connect write enable signal for RAM 1
    ,.data0_o()                  // Leave port 0 output disconnected (not used)

    // Port 1 connections (read port)
    ,.addr1_i({block_rd_q, rd_addr_q})  // Connect calculated read address
    ,.data1_i(16'b0)             // Connect zeros to write data (reads only)
    ,.wr1_i(1'b0)                // Connect constant 0 to write enable (reads only)
    ,.data1_o(outport_data1_w)   // Connect output data wire
);

// Instantiate dual-port RAM for coefficients 4,5
jpeg_idct_ram_dp // Instantiate the dual-port RAM module
u_ram2 // Instance name for the third RAM
(
     .clk0_i(clk_i)              // Connect system clock to port 0 clock
    ,.rst0_i(rst_i)              // Connect system reset to port 0 reset
    ,.clk1_i(clk_i)              // Connect system clock to port 1 clock
    ,.rst1_i(rst_i)              // Connect system reset to port 1 reset

    // Port 0 connections (write port)
    ,.addr0_i(wr_ptr_w)          // Connect calculated write address
    ,.data0_i(inport_data_i)     // Connect input data
    ,.wr0_i(wr2_w)               // Connect write enable signal for RAM 2
    ,.data0_o()                  // Leave port 0 output disconnected (not used)

    // Port 1 connections (read port)
    ,.addr1_i({block_rd_q, rd_addr_q})  // Connect calculated read address
    ,.data1_i(16'b0)             // Connect zeros to write data (reads only)
    ,.wr1_i(1'b0)                // Connect constant 0 to write enable (reads only)
    ,.data1_o(outport_data2_w)   // Connect output data wire
);

// Instantiate dual-port RAM for coefficients 6,7
jpeg_idct_ram_dp // Instantiate the dual-port RAM module
u_ram3 // Instance name for the fourth RAM
(
     .clk0_i(clk_i)              // Connect system clock to port 0 clock
    ,.rst0_i(rst_i)              // Connect system reset to port 0 reset
    ,.clk1_i(clk_i)              // Connect system clock to port 1 clock
    ,.rst1_i(rst_i)              // Connect system reset to port 1 reset

    // Port 0 connections (write port)
    ,.addr0_i(wr_ptr_w)          // Connect calculated write address
    ,.data0_i(inport_data_i)     // Connect input data
    ,.wr0_i(wr3_w)               // Connect write enable signal for RAM 3
    ,.data0_o()                  // Leave port 0 output disconnected (not used)

    // Port 1 connections (read port)
    ,.addr1_i({block_rd_q, rd_addr_q})  // Connect calculated read address
    ,.data1_i(16'b0)             // Connect zeros to write data (reads only)
    ,.wr1_i(1'b0)                // Connect constant 0 to write enable (reads only)
    ,.data1_o(outport_data3_w)   // Connect output data wire
);

//-----------------------------------------------------------------
// Data Qualifiers - Track which memory locations contain valid data
//-----------------------------------------------------------------
// Valid data tracking for RAM 0 (coefficients 0,1)
reg [63:0]        data_valid0_r;  // 64-bit register (combinatorial) to track which entries in RAM 0 have valid data
reg [63:0]        data_valid0_q;  // 64-bit register (sequential) to track which entries in RAM 0 have valid data

always_comb // Combinatorial logic block that executes whenever any inputs change
begin
    data_valid0_r = data_valid0_q; // Start with current valid flags

    // When a block is completely read, clear the valid flags for that block
    // Only clear if data was consumed (yumi_i)
    if (v_o && yumi_i && rd_idx_q[5:0] == 6'd63) // Check if this is the last coefficient (63) of a block and was consumed
    begin
        case (block_rd_q) // Check which block is being read
        2'd0:    data_valid0_r[15:0]  = 16'b0;  // Clear valid flags for block 0
        2'd1:    data_valid0_r[31:16] = 16'b0;  // Clear valid flags for block 1
        2'd2:    data_valid0_r[47:32] = 16'b0;  // Clear valid flags for block 2
        default: data_valid0_r[63:48] = 16'b0;  // Clear valid flags for block 3
        endcase
    end

    // Set valid flag when data is written to RAM 0
    if (wr0_w) // If writing to RAM 0
        data_valid0_r[wr_ptr_w] = 1'b1; // Set valid flag for the address being written
end

// Register valid flags for RAM 0
always_ff @ (posedge clk_i ) // Sequential logic block that executes on rising edge of clock
if (rst_i) // If reset is active
    data_valid0_q <= 64'b0;  // Clear all valid flags
else if (img_start_i) // If start of image signal is active
    data_valid0_q <= 64'b0;  // Clear all valid flags
else // Otherwise
    data_valid0_q <= data_valid0_r;  // Update valid flags with new values

// Valid data tracking for RAM 1 (coefficients 2,3)
reg [63:0]        data_valid1_r;  // 64-bit register (combinatorial) to track which entries in RAM 1 have valid data
reg [63:0]        data_valid1_q;  // 64-bit register (sequential) to track which entries in RAM 1 have valid data

always_comb // Combinatorial logic block that executes whenever any inputs change
begin
    data_valid1_r = data_valid1_q; // Start with current valid flags

    // When a block is completely read, clear the valid flags for that block
    // Only clear if data was consumed (yumi_i)
    if (v_o && yumi_i && rd_idx_q[5:0] == 6'd63) // Check if this is the last coefficient (63) of a block and was consumed
    begin
        case (block_rd_q) // Check which block is being read
        2'd0:    data_valid1_r[15:0]  = 16'b0;  // Clear valid flags for block 0
        2'd1:    data_valid1_r[31:16] = 16'b0;  // Clear valid flags for block 1
        2'd2:    data_valid1_r[47:32] = 16'b0;  // Clear valid flags for block 2
        default: data_valid1_r[63:48] = 16'b0;  // Clear valid flags for block 3
        endcase
    end

    // Set valid flag when data is written to RAM 1
    if (wr1_w) // If writing to RAM 1
        data_valid1_r[wr_ptr_w] = 1'b1; // Set valid flag for the address being written
end

// Register valid flags for RAM 1
always_ff @ (posedge clk_i ) // Sequential logic block that executes on rising edge of clock
if (rst_i) // If reset is active
    data_valid1_q <= 64'b0;  // Clear all valid flags
else if (img_start_i) // If start of image signal is active
    data_valid1_q <= 64'b0;  // Clear all valid flags
else // Otherwise
    data_valid1_q <= data_valid1_r;  // Update valid flags with new values

// Valid data tracking for RAM 2 (coefficients 4,5)
reg [63:0]        data_valid2_r;  // 64-bit register (combinatorial) to track which entries in RAM 2 have valid data
reg [63:0]        data_valid2_q;  // 64-bit register (sequential) to track which entries in RAM 2 have valid data

always_comb // Combinatorial logic block that executes whenever any inputs change
begin
    data_valid2_r = data_valid2_q; // Start with current valid flags

    // When a block is completely read, clear the valid flags for that block
    // Only clear if data was consumed (yumi_i)
    if (v_o && yumi_i && rd_idx_q[5:0] == 6'd63) // Check if this is the last coefficient (63) of a block and was consumed
    begin
        case (block_rd_q) // Check which block is being read
        2'd0:    data_valid2_r[15:0]  = 16'b0;  // Clear valid flags for block 0
        2'd1:    data_valid2_r[31:16] = 16'b0;  // Clear valid flags for block 1
        2'd2:    data_valid2_r[47:32] = 16'b0;  // Clear valid flags for block 2
        default: data_valid2_r[63:48] = 16'b0;  // Clear valid flags for block 3
        endcase
    end

    // Set valid flag when data is written to RAM 2
    if (wr2_w) // If writing to RAM 2
        data_valid2_r[wr_ptr_w] = 1'b1; // Set valid flag for the address being written
end

// Register valid flags for RAM 2
always_ff @ (posedge clk_i ) // Sequential logic block that executes on rising edge of clock
if (rst_i) // If reset is active
    data_valid2_q <= 64'b0;  // Clear all valid flags
else if (img_start_i) // If start of image signal is active
    data_valid2_q <= 64'b0;  // Clear all valid flags
else // Otherwise
    data_valid2_q <= data_valid2_r;  // Update valid flags with new values

// Valid data tracking for RAM 3 (coefficients 6,7)
reg [63:0]        data_valid3_r;  // 64-bit register (combinatorial) to track which entries in RAM 3 have valid data
reg [63:0]        data_valid3_q;  // 64-bit register (sequential) to track which entries in RAM 3 have valid data

always_comb // Combinatorial logic block that executes whenever any inputs change
begin
    data_valid3_r = data_valid3_q; // Start with current valid flags

    // When a block is completely read, clear the valid flags for that block
    // Only clear if data was consumed (yumi_i)
    if (v_o && yumi_i && rd_idx_q[5:0] == 6'd63) // Check if this is the last coefficient (63) of a block and was consumed
    begin
        case (block_rd_q) // Check which block is being read
        2'd0:    data_valid3_r[15:0]  = 16'b0;  // Clear valid flags for block 0
        2'd1:    data_valid3_r[31:16] = 16'b0;  // Clear valid flags for block 1
        2'd2:    data_valid3_r[47:32] = 16'b0;  // Clear valid flags for block 2
        default: data_valid3_r[63:48] = 16'b0;  // Clear valid flags for block 3
        endcase
    end

    // Set valid flag when data is written to RAM 3
    if (wr3_w) // If writing to RAM 3
        data_valid3_r[wr_ptr_w] = 1'b1; // Set valid flag for the address being written
end

// Register valid flags for RAM 3
always_ff @ (posedge clk_i ) // Sequential logic block that executes on rising edge of clock
if (rst_i) // If reset is active
    data_valid3_q <= 64'b0;  // Clear all valid flags
else if (img_start_i) // If start of image signal is active
    data_valid3_q <= 64'b0;  // Clear all valid flags
else // Otherwise
    data_valid3_q <= data_valid3_r;  // Update valid flags with new values


//-----------------------------------------------------------------
// Input Buffer - Track which blocks are ready for processing
//-----------------------------------------------------------------
reg [3:0] block_ready_q;  // 4-bit register to track which blocks (0-3) are ready for reading

// Sequential logic for block tracking
always_ff @ (posedge clk_i ) // Execute on rising edge of clock
if (rst_i) // If reset is active
begin
    block_ready_q     <= 4'b0;   // Clear all block ready flags
    block_wr_q        <= 2'b0;   // Reset write block pointer to 0
    block_rd_q        <= 2'b0;   // Reset read block pointer to 0
end
else if (img_start_i) // If start of image signal is active
begin
    block_ready_q     <= 4'b0;   // Clear all block ready flags
    block_wr_q        <= 2'b0;   // Reset write block pointer to 0
    block_rd_q        <= 2'b0;   // Reset read block pointer to 0
end
else // Normal operation
begin
    // When end of block is detected and input is accepted
    if (inport_eob_i && ready_o)
    begin
        block_ready_q[block_wr_q] <= 1'b1;  // Mark the current write block as ready
        block_wr_q                <= block_wr_q + 2'd1;  // Move to next write block
    end

    // When a block has been completely read out AND consumed (yumi_i)
    if (v_o && yumi_i && rd_idx_q[5:0] == 6'd63)
    begin
        block_ready_q[block_rd_q] <= 1'b0;  // Mark the current read block as not ready
        block_rd_q                <= block_rd_q + 2'd1;  // Move to next read block
    end
end

// Input is accepted only when the current write block is not marked as ready
assign ready_o = ~block_ready_q[block_wr_q]; // Accept input when current write block isn't full

//-----------------------------------------------------------------
// FSM - Control state machine for block processing
//-----------------------------------------------------------------
// Define state machine states using enum
typedef enum logic [1:0] {
    STATE_IDLE    = 2'd0,  // State value for idle state
    STATE_SETUP   = 2'd1,  // State value for setup state
    STATE_ACTIVE  = 2'd2   // State value for active (processing) state
} state_e;

state_e state_q;        // Register to hold current state
state_e next_state_r;   // Register to hold next state (combinatorial)

// Combinatorial logic for state transitions
always_comb // Execute whenever any inputs change
begin
    next_state_r = state_q; // Default: stay in current state

    case (state_q) // Check current state
    STATE_IDLE: // If in idle state
    begin
        // Transition to setup state when a block is ready to be read
        // No need to check yumi_i here since we're starting a new operation
        if (block_ready_q[block_rd_q])
            next_state_r = STATE_SETUP;
    end
    STATE_SETUP: // If in setup state
    begin
        // Always transition to active state after one cycle of setup
        next_state_r = STATE_ACTIVE;
    end
    STATE_ACTIVE: // If in active state
    begin
        // Transition back to idle when finished processing a block AND data consumed
        if (v_o && yumi_i && rd_idx_q == 6'd63)
            next_state_r = STATE_IDLE;
    end
    default: ; // No action for undefined states
    endcase

    // Override: always go to idle state at start of image
    if (img_start_i)
        next_state_r = STATE_IDLE;
end

// Sequential logic to update state
always_ff @ (posedge clk_i ) // Execute on rising edge of clock
if (rst_i) // If reset is active
    state_q <= STATE_IDLE; // Reset to idle state
else // Normal operation
    state_q <= next_state_r; // Update state with next state value

// Read index counter (0-63) for processing a block
always_ff @ (posedge clk_i ) // Execute on rising edge of clock
if (rst_i) // If reset is active
    rd_idx_q <= 6'b0; // Reset read index to 0
else if (img_start_i) // If start of image signal is active
    rd_idx_q <= 6'b0; // Reset read index to 0
else if (state_q == STATE_ACTIVE && (v_o && yumi_i || !v_o)) // If in active state AND (data consumed OR not valid)
    rd_idx_q <= rd_idx_q + 6'd1;  // Increment read index

// Read address generator - follows a specific pattern for IDCT processing
always_ff @ (posedge clk_i ) // Execute on rising edge of clock
if (rst_i) // If reset is active
    rd_addr_q <= 4'b0; // Reset read address to 0
else if (state_q == STATE_IDLE) // If in idle state
    rd_addr_q <= 4'b0; // Reset read address to 0
else if (state_q == STATE_SETUP) // If in setup state
    rd_addr_q <= 4'd1; // Initialize read address to 1
else if (state_q == STATE_ACTIVE && (v_o && yumi_i || !v_o)) // If in active state AND (data consumed OR not valid)
begin
    // Update read address according to a specific pattern based on the current read index
    case (rd_idx_q[2:0]) // Check lower 3 bits of read index
    3'd0: rd_addr_q <= rd_addr_q - 1; // Decrement address
    3'd1: rd_addr_q <= rd_addr_q + 1; // Increment address
    3'd2: ; // No change to address
    3'd3: rd_addr_q <= rd_addr_q - 1; // Decrement address
    3'd4: rd_addr_q <= rd_addr_q + 1; // Increment address
    3'd5: rd_addr_q <= rd_addr_q - 1; // Decrement address
    3'd6: rd_addr_q <= rd_addr_q + 2; // Add 2 to address
    3'd7: rd_addr_q <= rd_addr_q + 1; // Increment address
    endcase
end

// Data valid flags for each output channel
reg data_val0_q;  // Register to indicate if data on channel 0 is valid
reg data_val1_q;  // Register to indicate if data on channel 1 is valid
reg data_val2_q;  // Register to indicate if data on channel 2 is valid
reg data_val3_q;  // Register to indicate if data on channel 3 is valid

// Register data valid flags for output masking
always_ff @ (posedge clk_i ) // Execute on rising edge of clock
if (rst_i) // If reset is active
begin
    data_val0_q <= 1'b0; // Clear valid flag for channel 0
    data_val1_q <= 1'b0; // Clear valid flag for channel 1
    data_val2_q <= 1'b0; // Clear valid flag for channel 2
    data_val3_q <= 1'b0; // Clear valid flag for channel 3
end
else // Normal operation
begin
    // Check valid flags for current read address in each RAM
    data_val0_q <= data_valid0_q[{block_rd_q, rd_addr_q}]; // Get valid flag for current address in RAM 0
    data_val1_q <= data_valid1_q[{block_rd_q, rd_addr_q}]; // Get valid flag for current address in RAM 1
    data_val2_q <= data_valid2_q[{block_rd_q, rd_addr_q}]; // Get valid flag for current address in RAM 2
    data_val3_q <= data_valid3_q[{block_rd_q, rd_addr_q}]; // Get valid flag for current address in RAM 3
end

// Output is valid when in active state
assign v_o = (state_q == STATE_ACTIVE); // Set output valid when in active state

// Output the lower 3 bits of read index as the output index
assign outport_idx_o   = rd_idx_q[2:0]; // Only use lower 3 bits for output index

// Mask output data with valid flags (zeros if data not valid)
assign outport_data0_o = {16{data_val0_q}} & outport_data0_w; // Use bit replication to create mask for channel 0
assign outport_data1_o = {16{data_val1_q}} & outport_data1_w; // Use bit replication to create mask for channel 1
assign outport_data2_o = {16{data_val2_q}} & outport_data2_w; // Use bit replication to create mask for channel 2
assign outport_data3_o = {16{data_val3_q}} & outport_data3_w; // Use bit replication to create mask for channel 3

endmodule // End of module definition
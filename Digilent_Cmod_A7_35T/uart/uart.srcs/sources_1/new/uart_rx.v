`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2024 17:52:57
// Design Name: 
// Module Name: uart_rx
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_rx
    #(parameter CLOCKS_PER_BIT = 100)
    (
     input          i_Clock,
                    i_Rx_Serial,
     output [7:0]   o_Rx_Byte,
     output         o_Rx_DV
    );
    
    localparam [3:0]                // Possible states of Rx state machine
        s_IDLE         = 3'b000,
        s_RX_START_BIT = 3'b001,
        s_RX_DATA_BITS = 3'b010,
        s_RX_STOP_BIT  = 3'b011,
        s_CLEANUP      = 3'b100;
    
    // Registers for counting clock cycles & tracking state machine
    reg [7:0]   r_Clock_Count = 0;  // Counts clocks (program reads `middle` of received signal)
    reg [2:0]   r_State       = 0;  // Current state of Rx state machine (1 of the 5 defined above)
    reg [2:0]   r_Bit_Index   = 0;  // Current DATA bit being read (8 DATA bits total)
    
    // Registers for outputs
    reg [7:0]   r_Rx_Byte     = 0;  // Stores received byte
    reg         r_Rx_DV       = 0;  // Data valid for received byte
    // Wire outputs
    assign o_Rx_Byte = r_Rx_Byte;
    assign o_Rx_DV   = r_Rx_DV;
    
    // Double register to remove problems caused by metastability for input byte
    reg         r_Rx_Data_R = 1'b1;
    reg         r_Rx_Data   = 1'b1;
    
    always @ (posedge i_Clock) begin
        r_Rx_Data_R <= i_Rx_Serial;
        r_Rx_Data   <= r_Rx_Data_R;
    end
    
    // Control Rx state machine
    always @ (posedge i_Clock) begin
        case(r_State)
            s_IDLE:
                begin
                    r_Clock_Count <= 0;             // Refresh registers as default 0 values
                    r_Bit_Index <= 0;
                    
                    r_Rx_DV <= 1'b0;                // Received data is invalid
                    
                    if (r_Rx_Data == 1'b0)          // START bit detected
                        r_State <= s_RX_START_BIT;  // Move to s_RX_START_BIT state
                    else
                        r_State <= s_IDLE;          // Stay in s_IDLE state
                end
            
            // Check middle of START bit to make sure it's still low
            s_RX_START_BIT:
                begin
                    if (r_Clock_Count == (CLOCKS_PER_BIT-1)/2) begin
                        if (r_Rx_Data == 1'b0) begin        // Middle is still low
                            r_Clock_Count <= 0;             // Reset clock counter
                            r_State <= s_RX_DATA_BITS;      // Move to s_RX_DATA_BITS state
                        end else
                            r_State <= s_IDLE;              // Middle is not low anymore -> move back to s_IDLE state
                    end else begin
                        r_Clock_Count <= r_Clock_Count + 1; // Not at the middle of START bit -> advance clock counter
                        r_State <= s_RX_START_BIT;          // Refresh r_State as s_RX_START_BIT state
                    end
                end
            
            // Wait CLOCKS_PER_BIT-1 clock cycles to sample a serial DATA bit
            s_RX_DATA_BITS:
                begin
                    if (r_Clock_Count == (CLOCKS_PER_BIT-1)) begin
                        r_Clock_Count <= 0;                     // At middle of DATA bit -> reset clock counter
                        r_Rx_Byte[r_Bit_Index] <= r_Rx_Data;    // Read and store the DATA bit
                        
                        // Check if all DATA bits are received
                        if (r_Bit_Index < 7) begin
                            r_Bit_Index <= r_Bit_Index + 1;     // Not all DATA bits received -> advance r_Bit_Index
                            r_State <= s_RX_DATA_BITS;          // Refresh r_State as s_RX_DATA_BITS state
                        end else begin
                            r_Bit_Index <= 0;                   // All DATA bits received -> reset r_Bit_Index
                            r_State <= s_RX_STOP_BIT;           // Move to s_RX_STOP_BIT state
                        end
                    end else begin
                        r_Clock_Count <= r_Clock_Count + 1;     // Not at the middle of DATA bit -> advance clock counter
                        r_State <= s_RX_DATA_BITS;              // Refresh r_State as s_RX_DATA_BITS state
                    end
                end

            // STOP bit received
            // Wait CLKS_PER_BIT-1 clock cycles for STOP bit to finish
            s_RX_STOP_BIT:
                begin
                    if (r_Clock_Count == (CLOCKS_PER_BIT-1)) begin
                        r_Clock_Count <= 0;     // STOP bit finished -> Reset counter
                        r_State <= s_CLEANUP;   // Move to s_CLEANUP state
                        r_Rx_DV <= 1'b1;        // Set r_Rx_DV ouput to 1 (received data is valid)
                    end else begin
                        r_Clock_Count <= r_Clock_Count + 1; // STOP bit not finished -> advance clock counter
                        r_State <= s_RX_STOP_BIT;           // Refresh r_State as s_RX_STOP_BIT state
                    end
                end

            // Stay here for 1 clock count
            s_CLEANUP:
                begin
                    r_State <= s_IDLE;  // Move back to s_IDLE state
                    r_Rx_DV <= 1'b0;    // Reset r_Rx_DV output to 0 (received data is invalid)
                end
            
            default:
                r_State <= s_IDLE;
        endcase
    end

endmodule

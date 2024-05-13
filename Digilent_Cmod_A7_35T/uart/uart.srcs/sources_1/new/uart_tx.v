`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2024 10:36:09
// Design Name: 
// Module Name: uart_tx
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


module uart_tx
    #(parameter CLOCKS_PER_BIT = 100)
    (
     input          i_Clock,
                    i_Tx_DV,
     input  [7:0]   i_Tx_Byte,
     output         o_Tx_Active,
                    o_Tx_Done,
     output reg     o_Tx_Serial
    );
    
    localparam [3:0]                // Possible states of Tx state machine
        s_IDLE          = 3'b000,
        s_TX_START_BIT  = 3'b001,
        s_TX_DATA_BITS  = 3'b010,
        s_TX_STOP_BIT   = 3'b011,
        s_CLEANUP       = 3'b100;
    
    // Registers for counting clock cycles & tracking state machine
    reg [7:0]   r_Clock_Count = 0;  // Counts clocks (program sends `middle` of transmitted signal)
    reg [2:0]   r_State       = 0;  // Current state of Tx state machine (1 of the 5 defined above)
    reg [2:0]   r_Bit_Index   = 0;  // Current bit being sent (8 bits total)
    
    // Register storing input byte to transmit
    reg [7:0]   r_Tx_Byte     = 0;  
    
    // Registers for outputs
    reg         r_Tx_Active   = 0;
    reg         r_Tx_Done     = 0;
    // Wire outputs
    assign o_Tx_Active = r_Tx_Active;
    assign o_Tx_Done   = r_Tx_Done;
    
    // Control Tx state machine
    always @ (posedge i_Clock) begin
        case(r_State)
            s_IDLE:
                begin
                    r_Clock_Count <= 0;             // Refresh registers as default 0 values
                    r_Bit_Index <= 0;
                    r_Tx_Active <= 0;               // Refresh output registers
                    r_Tx_Done <= 0;
                    
                    o_Tx_Serial <= 1'b1;            // Drive output serial line high for s_IDLE state
                    
                    if (i_Tx_DV == 1'b1) begin      // Transmitted data is valid signal detected
                        r_Tx_Byte <= i_Tx_Byte;
                        r_Tx_Active <= 1'b1;
                        r_State <= s_TX_START_BIT;  // Move to s_TX_START_BIT state
                    end
                end

            // Send START bit = 0
            s_TX_START_BIT:
                begin
                    o_Tx_Serial <= 1'b0;
                    
                    // START bit should last CLOCKS_PER_BIT-1 clock cycles
                    if (r_Clock_Count == (CLOCKS_PER_BIT-1)) begin
                        r_Clock_Count <= 0;                 // START_BIT done sending -> reset clock counter
                        r_State <= s_TX_DATA_BITS;          // Move to s_TX_DATA_BITS state
                    end else begin
                        r_Clock_Count <= r_Clock_Count + 1; // START_BIT still sending -> advance clock counter
                        r_State <= s_TX_START_BIT;          // Refresh r_State as s_TX_START_BIT state
                    end
                end
                
            // Wait CLOCKS_PER_BIT-1 clock cycles to send a serial DATA bit
            s_TX_DATA_BITS:
                begin
                    o_Tx_Serial <= r_Tx_Byte[r_Bit_Index];      // Send the DATA bit
                    
                    if (r_Clock_Count == (CLOCKS_PER_BIT-1)) begin
                        r_Clock_Count <= 0;                     // DATA bit done sending -> reset clock counter
                        
                        // Check if all DATA bits are SENT
                        if (r_Bit_Index < 7) begin
                            r_Bit_Index <= r_Bit_Index + 1;     // Not all DATA bits are sent -> advance r_Bit_Index
                            r_State <= s_TX_DATA_BITS;          // Refresh r_State as s_TX_DATA_BITS
                        end else begin
                            r_Bit_Index <= 0;                   // All DATA bits sent -> reset r_Bit_Index 
                            r_State <= s_TX_STOP_BIT;           // Move to s_TX_STOP_BIT state
                        end
                    end else begin
                        r_Clock_Count <= r_Clock_Count + 1;     // DATA bit still sending -> advance clock counter
                        r_State <= s_TX_DATA_BITS;              // Refresh r_State as s_TX_DATA_BITS state
                    end
                end
                
            // Send STOP bit = 1
            s_TX_STOP_BIT:
                begin
                    o_Tx_Serial <= 1'b1;
                    
                    if (r_Clock_Count == (CLOCKS_PER_BIT-1)) begin
                        r_Clock_Count <= 0;     // STOP bit finished -> Reset counter
                        r_State <= s_CLEANUP;   // Move to s_CLEANUP state
                        r_Tx_Active <= 1'b0;    // Set outputs accordingly
                        r_Tx_Done <= 1'b1;
                    end else begin
                        r_Clock_Count <= r_Clock_Count + 1; // STOP bit not finished -> advance clock counter
                        r_State <= s_TX_STOP_BIT;           // Refresh r_State as s_RX_STOP_BIT state
                    end
                end
                
            // Stay here for 1 clock count
            s_CLEANUP:
                begin
                    r_State <= s_IDLE;  // Move back to s_IDLE state
                    r_Tx_Done <= 1'b1;  // Refresh r_Tx_Done output register
                end
                
            default:
                r_State <= s_IDLE;
        endcase
    end
    
endmodule

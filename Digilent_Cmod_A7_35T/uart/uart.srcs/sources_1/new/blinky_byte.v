`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2024 17:50:38
// Design Name: 
// Module Name: blinky_byte
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


module blinky_byte(
    input   sysclk,
            uart_txd_in,
    output  led0,
            uart_rxd_out
    );
    
    // (Clock frequency / Baud rate)
    parameter c_CLOCKS_PER_BIT = 100;
    
    // Create an instance of uart_rx module
    wire [7:0] w_Rx_Byte;
    wire       w_Rx_DV;

    uart_rx #(.CLOCKS_PER_BIT(c_CLOCKS_PER_BIT))
        uart_rx_gen (
            .i_Clock(sysclk),
            .i_Rx_Serial(uart_txd_in),
            .o_Rx_DV(w_Rx_DV),
            .o_Rx_Byte(w_Rx_Byte)
        );
    
    // Create an instance of uart_tx module
    reg         r_Tx_DV = 0;
    reg [7:0]   r_Tx_Byte = 0;
    wire        w_Tx_Active,
                w_Tx_Done;
         
    uart_tx #(.CLOCKS_PER_BIT(c_CLOCKS_PER_BIT))
        uart_tx_gen (
            .i_Clock(sysclk),
            .i_Tx_DV(r_Tx_DV),
            .i_Tx_Byte(r_Tx_Byte),
            .o_Tx_Active(w_Tx_Active),
            .o_Tx_Done(w_Tx_Done),
            .o_Tx_Serial(uart_rxd_out)
        );
    
    // Create register that stores & updates the state of the LED
    reg r_led0_State;
    assign led0 = r_led0_State;
 
    // Register to track state of blinking
    reg r_led0_Blinking = 0;
    reg r_led0_Blinking_Done = 0;
    
    // Registers to count time between blinking bits & track bit index
    // 2**22 clocks / 12 MHz ~ 0.35 blink/s
    reg [21:0] r_Clock_Count = 0;    
    reg [2:0] r_Bit_Index = 0;
    always @ (posedge sysclk) begin
        // Start blinking LED when data byte is received & LED is not currently blinking
        if (w_Rx_DV && !r_led0_Blinking)
            r_led0_Blinking <= 1;
        
        if (r_led0_Blinking) begin
            r_led0_State <= w_Rx_Byte[r_Bit_Index];
            
            // At the end of a bit's blinking cycle 
            if (&r_Clock_Count) begin
                r_led0_State <= 0;                          // Reset led0
                r_Bit_Index = r_Bit_Index + 1;              // Advance bit index
                r_led0_Blinking <= (r_Bit_Index != 0);      // Check if all bits are blinked
                r_led0_Blinking_Done <= (r_Bit_Index == 0);
            end
            r_Clock_Count <= r_Clock_Count + 1;             // Advance clock count
        end
        
        if (r_led0_Blinking_Done) begin // All blinkings are done
            r_Tx_DV <= 1;               // Signal that Tx serial data is valid
            r_Tx_Byte <= w_Rx_Byte;     // Load data to transmit into register
            r_led0_Blinking_Done <= 0;  // Reset
        end
         
        if (w_Tx_Done)                   
            r_Tx_DV <=0;    // All bits are transmitted -> Tx serial data is now invalid
    end
endmodule

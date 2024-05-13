`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2024 17:49:32
// Design Name: 
// Module Name: uart_bt
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


module uart_bt;

    // Testbench uses a 10 MHz clock
    // Want to interface to 115200 baud UART
    // (10000000 / 115200) = 87 Clocks Per Bit.
    parameter c_CLOCK_PERIOD_NS = 100,
              c_CLOCKS_PER_BIT  = 87,
              c_BIT_PERIOD      = 8600;
    
    // Rx
    reg         r_Rx_Serial = 1;
    wire        w_Rx_DV;
    wire [7:0]  w_Rx_Byte;
    
    // Tx
    reg         r_Tx_DV = 0;
    reg [7:0]   r_Tx_Byte = 0;
    wire        w_Tx_Active,
                w_Tx_Done,
                r_Tx_Serial;
    reg [7:0]   r_Tx_Data = 0;
    
    // Configure r_Clock signal
    reg r_Clock = 0;
    always #(c_CLOCK_PERIOD_NS/2)
        r_Clock <= !r_Clock;
    
    // Takes in an input byte and serializes it
    task UART_WRITE_BYTE(input [7:0] i_Data);
        integer j;
        begin
            // Send START bit
            r_Rx_Serial <= 1'b0;
            #(c_BIT_PERIOD);
            
            // Send data byte
            for (j=0; j<8; j=j+1) begin
                r_Rx_Serial <= i_Data[j];
                #(c_BIT_PERIOD);
            end
            
            // Send STOP bit
            r_Rx_Serial <= 1'b1;
            #(c_BIT_PERIOD);
        end
    endtask
    
    // Takes in an input bit and reads its byte data
    task UART_READ_BYTE(input i_Data);
        integer k;
        begin
            // Wait for START bit to pass
            #(c_BIT_PERIOD);
            
            // Read data byte
            for (k=0; k<8; k=k+1) begin
                #(c_BIT_PERIOD/2);
                r_Tx_Data[k] <= r_Tx_Serial;    // Read middle of bit signal
                #(c_BIT_PERIOD/2);
            end
            
            // Wait for STOP bit to pass
            #(c_BIT_PERIOD);
        end
    endtask
    
    // Create an instance of uart_rx module    
    uart_rx #(.CLOCKS_PER_BIT(c_CLOCKS_PER_BIT))
        UART_RX (
            .i_Clock(r_Clock),
            .i_Rx_Serial(r_Rx_Serial),
            .o_Rx_DV(w_Rx_DV),
            .o_Rx_Byte(w_Rx_Byte)
        );
        
    // Create an instance of uart_tx module
    uart_tx #(.CLOCKS_PER_BIT(c_CLOCKS_PER_BIT))
        UART_TX (
            .i_Clock(r_Clock),
            .i_Tx_DV(r_Tx_DV),
            .i_Tx_Byte(r_Tx_Byte),
            .o_Tx_Active(w_Tx_Active),
            .o_Tx_Done(w_Tx_Done),
            .o_Tx_Serial(r_Tx_Serial)
        );
    
    // Main testing
    initial begin
        // Send a command to the UART (exercise Rx)
        @(posedge r_Clock);         // Wait for positive edge of next clock cycle
        UART_WRITE_BYTE(8'h3F);     // Start writing byte data
        @(posedge r_Clock);
             
        // Check that the correct command was received
        if (w_Rx_Byte == 8'h3F)
            $display("Test Passed - Correct Byte Received");
        else
            $display("Test Failed - Incorrect Byte Received");
        
        // ********************************************* //
        
        // Tell the UART to send a command (exercise Tx)
        @(posedge r_Clock);             // Wait for positive edge of next clock cycle
        r_Tx_DV <= 1'b1;                // Signal that transmitted data is valid
        r_Tx_Byte <= 8'b11001010;       // Load data byte to be transmitted
        UART_READ_BYTE(r_Tx_Serial);    // Read data byte transmitted
        @(posedge r_Clock);
        r_Tx_DV <= 0;                   // Transmission done -> signal that transmitted data is not valid
        @(posedge w_Tx_Done);
        
        // Check that the correct command was sent
        if (r_Tx_Data == 8'b11001010)
            $display("Test Passed - Correct Byte Sent");
        else
            $display("Test Failed - Incorrect Byte Sent");
        
    end

endmodule

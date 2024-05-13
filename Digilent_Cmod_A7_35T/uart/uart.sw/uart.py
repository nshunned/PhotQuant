# -*- coding: utf-8 -*-
"""
Created on Wed Mar 13 13:19:06 2024

@author: photquant
"""
# Modules
import serial

# Configure UART port
UART_PORT = 'COM4'
BAUD_RATE = 120000
try:
    ser = serial.Serial(port=UART_PORT)
except:
    uart_port_is_open = False
    print(UART_PORT + ' is not available')
else:
    uart_port_is_open = True
    ser.baudrate = BAUD_RATE
    ser.bytesize = serial.EIGHTBITS
    ser.stopbits = serial.STOPBITS_ONE
    ser.parity = serial.PARITY_NONE
    
    ser.xonxoff = 0     # Software control
    ser.rtscts = 0      # Hardware (RTS/CTS) flow control
    
    ser.timeout = 0.5   # Code will hang without setting timeout
    
# Only continue if the specified UART connection exists  
if uart_port_is_open == True:
    while 1:
        # byte to sent to be received through uart
        num_to_send = int(input('Enter a byte-wide integer for LED (0 to 255) => '))
        bytes_written = ser.write(num_to_send.to_bytes(1, "big"))
        
        print()
        print("Bytes written: ", bytes_written)
        print("Data written: ", num_to_send)
        print("Binary representation: ", format(num_to_send, '#010b'))
        print()
        print("Digilent Cmod A7-35T is blinking at you ;)")
        
        # keep reading until a byte is transmitted through uart
        byte_read = ser.read()
        while(byte_read == bytes(0)):
            byte_read = ser.read()

    	# convert byte to int
        num_read = int.from_bytes(byte_read , 'big')
        
        print()
        print("Digilent Cmod A7-35T is done blinking at you :)")
        print()
        print("Data read: ", num_read)
        print("Binary representation: ", format(num_read, '#010b'))
        
        print()
        print("###############################################")
        
# Close serial connection
ser.close
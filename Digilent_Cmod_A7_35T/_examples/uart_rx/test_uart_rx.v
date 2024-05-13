`timescale 1ns/100ps // 1 ns time unit, 100 ps resolution

module test_uart_rx;

parameter tick = 1;
parameter clock_cycle = tick*32;

reg rx;
reg clk;
reg reset;
reg [7:0] DATA;

wire s_tick;
wire [7:0] dout;
wire rx_done_tick;

integer i;

tick_generator
#(.N(1)) 
gen(
    clk,
    reset,
    s_tick
);

uart_rx uut(
    rx,
    clk,
    dout,
    rx_done_tick,
    reset
);

always #1 clk = !clk;

initial begin
  $dumpfile("wave.vcd");   // create a VCD waveform dump called "wave.vcd"
  $dumpvars(0, test_uart_rx); // dump variable changes in the testbench
                                 // and all modules under it
  clk = 0;
  rx = 1;
  reset = 1;

  #clock_cycle ;
  reset = 0;

  #clock_cycle ;
  DATA = 8'd1;
  rx = 0;
  reset = 1;

  for (i = 0; i < 8; i = i+1) begin
    #clock_cycle rx = DATA[i];
  end

  #clock_cycle $finish();

end

endmodule
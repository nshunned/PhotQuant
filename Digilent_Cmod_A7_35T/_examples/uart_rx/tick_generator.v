module tick_generator(
    input clk,
    input reset,
    output s_tick
);

parameter N = 1;

reg s_tick;
reg [N -1: 0] counter;

always@(clk, negedge reset) begin
  if(~reset)
    counter <= 0;
  else
    counter <= counter + 1;
end

always@(counter) begin
  s_tick <= &counter;
end

always@(negedge clk) begin
    s_tick <= 0;
end

endmodule
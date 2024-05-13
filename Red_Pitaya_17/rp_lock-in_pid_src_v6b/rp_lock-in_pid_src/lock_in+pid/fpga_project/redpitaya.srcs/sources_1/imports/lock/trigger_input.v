//////////////////////////////////////////////////////////////////////////////////
//
//
//  creates a trigger signal trig_tick when trig_in change its value. The value change
//  is chosen by a trig_sel mask. The output tick last for 2**N clock ticks
//
//
//////////////////////////////////////////////////////////////////////////////////

/*
module trigger_input
#(parameter R=8 , N=3)
(
	input  wire clk, rst, 
	input  wire [R-1:0] trig_in,   // input for trigger signals
    input  wire [R-1:0] trig_sel,  // trigger selection
	output reg          state    // trigger level
);
*/
module trigger_input
#(parameter N=3)
(
	input              clk, rst, 
	input      [2-1:0] trig_in,   // input for trigger signals
    input              trig_sel,  // trigger selection
	output             trig_out    // output trigger signal
);

//signal declaration
reg [N-1:0] cnt;

reg         tirgger_now, tirgger_last, state;

localparam  
        low     = 1'b0,
        high    = 1'b1;

// body
always @(posedge clk)
	if (rst) begin
        cnt           <=  {N{1'b0}} ;
        state         <=   low ;
        tirgger_now   <=   1'b0 ;
        tirgger_last  <=   1'b0 ;
    end
	else begin
//        tirgger_now   <=   |(trig_in & trig_sel) ;
        tirgger_now   <=   trig_sel ? trig_in[1] : trig_in[0] ;
        tirgger_last  <=   tirgger_now ;
        if ((state == low) & ( {tirgger_now,tirgger_last}==2'b10))
            state <= high ;
         else if (state == high) begin
            cnt <= cnt + 1'b1;//rolls over to 0 at &cnt and stops
            if (&cnt)
                state <= low;
         end
    end
assign trig_out = state;

endmodule
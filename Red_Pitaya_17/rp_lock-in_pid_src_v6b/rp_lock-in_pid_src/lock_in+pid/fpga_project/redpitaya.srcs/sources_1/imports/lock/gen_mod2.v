`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Modulation generator.
// Creates square signals, whose half period is set by using sqp input.
//
//////////////////////////////////////////////////////////////////////////////////

//(* keep_hierarchy = "yes" *)
module gen_mod2
(
    input clk,rst,
    input           [8-1:0] phase_sq, // Phase control
    input           [7-1:0] sqp,  // Square period control, period = 2*(sqp+1) 
    output                   sq_ref, sq_phas,
    output                   square_trig
);

    // sq divisor
    reg  sq_ref_r;
    wire sq_ref_next;

    reg  sq_phas_r;
    wire sq_phas_next;

    wire clksq_gt_sqp, clksq_equal_sqp, clksq_equal_phas, sqp_off;
    wire phas_less_than_sqp,clksq_equal_sqp_half;

    reg  [8-1:0] clk_sq_cnt;
    wire [8-1:0] clk_sq_cnt_next;
    wire [7-1:0] sqp_half;
    wire [9-1:0] phas_sq;


    // Square signal ---------------------------------------------------

    // Counter
    always @(posedge clk)
	if (rst | sqp_off)
        begin
            clk_sq_cnt <= 0; // {N{1b'0}}
            sq_ref_r   <= 0;
            sq_phas_r  <= 0;
        end
	else
        begin
            clk_sq_cnt <= clk_sq_cnt_next[8-1:0];
            sq_ref_r   <= sq_ref_next ;
            sq_phas_r  <= sq_phas_next;
        end

    // Aux signals


    assign sqp_half                  = sqp >> 1'b1 ;
    assign phas_sq                   = phas_less_than_sqp ? {1'b0,phase_sq} : (phase_sq - sqp - 1) ;

    assign clksq_equal_sqp           = ( clk_sq_cnt==sqp   );                   // Tells me if clksq == sqp
    assign clksq_gt_sqp              = ( clk_sq_cnt>=sqp   );                   // Tells me if clksq >= sqp

    assign clksq_equal_sqp_half      = ( clk_sq_cnt==sqp_half ) ;               // Tells me if clksq == sqp + (sqp+1)/2
    assign clksq_equal_phas          = ( clk_sq_cnt_next==phas_sq ) ;        // Tells me if clksq == phase_sq

    assign sqp_off                   = ( sqp==7'b0       );                   // Tells me if sq modulation is off
    assign phas_less_than_sqp        = ( phase_sq < sqp + 1'b1 );

    // Next-state wires
    assign clk_sq_cnt_next = clksq_gt_sqp              ? 8'b0 : clk_sq_cnt + 8'b001;
    assign sq_ref_next     = clksq_equal_sqp           ? ~sq_ref_r : sq_ref_r  ;
    assign sq_phas_next    = clksq_equal_phas          ? sq_ref_next^(~phas_less_than_sqp) : sq_phas_r ;

    // outputs
    assign sq_ref  = sqp_off ? 1'b0  : sq_ref_r ;
    assign sq_phas = sqp_off ? 1'b0  : sq_phas_r ;

    //assign square_trig = clksq_equal_sqp & sq_ref ;
    assign square_trig = clksq_equal_sqp_half & sq_ref ;


endmodule

/**
  * When sqp > 0 , generator is on
    * sqp sets the clk ticks number of half period of sq_ref
    * period [#ticks] = (sqp+1)*2

*/

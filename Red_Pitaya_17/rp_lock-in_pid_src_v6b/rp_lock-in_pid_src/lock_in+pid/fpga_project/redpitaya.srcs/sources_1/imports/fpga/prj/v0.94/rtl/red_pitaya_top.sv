////////////////////////////////////////////////////////////////////////////////
// Red Pitaya TOP module. It connects external pins and PS part with
// the lock-in+scope+pid module.
// Author: Alexei Ourjoumtsev
////////////////////////////////////////////////////////////////////////////////

/**
 * GENERAL DESCRIPTION:
 *
 * Top module connects PS part with rest of Red Pitaya applications.  
 *
 *                   /-------\      
 *   PS DDR <------> |  PS   |      AXI <-> custom bus
 *   PS MIO <------> |   /   | <------------+
 *   PS CLK -------> |  ARM  |              |
 *                   \-------/              |
 *                                          |
 *                            /-------\     |
 *                         -> | SCOPE | <---+
 *                         |  \-------/     |
 *                         |                |
 *            /--------\   |   /-----\      |
 *   ADC ---> |        | --+-> |     |      |
 *            | ANALOG |       | PID | <----+
 *   DAC <--- |        | <---- |     |      |
 *            \--------/   ^   \-----/      |
 *                         |                |
 *                         |  /-------\     |
 *                         -- |  ASG  | <---+ 
 *                            \-------/     
 * Inside analog module, ADC data is translated from unsigned neg-slope into
 * two's complement. Similar is done on DAC data.
 *
 * Scope module stores data from ADC into RAM, arbitrary signal generator (ASG)
 * sends data from RAM to DAC. MIMO PID uses ADC ADC as input and DAC as its output.
 */

module red_pitaya_top #(
  // identification
  bit [0:5*32-1] GITH = '0,
  // module numbers
  int unsigned MNA = 2,  // number of acquisition modules
  int unsigned MNG = 2   // number of generator   modules
)(
  // PS connections
  inout  logic [54-1:0] FIXED_IO_mio     ,
  inout  logic          FIXED_IO_ps_clk  ,
  inout  logic          FIXED_IO_ps_porb ,
  inout  logic          FIXED_IO_ps_srstb,
  inout  logic          FIXED_IO_ddr_vrn ,
  inout  logic          FIXED_IO_ddr_vrp ,
  // DDR
  inout  logic [15-1:0] DDR_addr   ,
  inout  logic [ 3-1:0] DDR_ba     ,
  inout  logic          DDR_cas_n  ,
  inout  logic          DDR_ck_n   ,
  inout  logic          DDR_ck_p   ,
  inout  logic          DDR_cke    ,
  inout  logic          DDR_cs_n   ,
  inout  logic [ 4-1:0] DDR_dm     ,
  inout  logic [32-1:0] DDR_dq     ,
  inout  logic [ 4-1:0] DDR_dqs_n  ,
  inout  logic [ 4-1:0] DDR_dqs_p  ,
  inout  logic          DDR_odt    ,
  inout  logic          DDR_ras_n  ,
  inout  logic          DDR_reset_n,
  inout  logic          DDR_we_n   ,

  // Red Pitaya periphery

  // ADC
  input  logic [MNA-1:0] [16-1:0] adc_dat_i,  // ADC data
  input  logic           [ 2-1:0] adc_clk_i,  // ADC clock {p,n}
  output logic           [ 2-1:0] adc_clk_o,  // optional ADC clock source (unused)
  output logic                    adc_cdcs_o, // ADC clock duty cycle stabilizer
  // DAC
  output logic [14-1:0] dac_dat_o  ,  // DAC combined data
  output logic          dac_wrt_o  ,  // DAC write
  output logic          dac_sel_o  ,  // DAC channel select
  output logic          dac_clk_o  ,  // DAC clock
  output logic          dac_rst_o  ,  // DAC reset
  // Expansion connector
  input  logic [ 8-1:0] exp_p_io   ,
  output  logic         exp_n_io1  ,
  input  logic          exp_n_io2  ,
  output  logic         exp_n_io7  
);

////////////////////////////////////////////////////////////////////////////////
// local signals
////////////////////////////////////////////////////////////////////////////////

// GPIO parameter

logic [4-1:0] fclk ; //[0]-125MHz, [1]-250MHz, [2]-50MHz, [3]-200MHz
logic [4-1:0] frstn;

// AXI masters
logic            axi1_clk    , axi0_clk    ;
logic            axi1_rstn   , axi0_rstn   ;
logic [ 32-1: 0] axi1_waddr  , axi0_waddr  ;
logic [ 64-1: 0] axi1_wdata  , axi0_wdata  ;
logic [  8-1: 0] axi1_wsel   , axi0_wsel   ;
logic            axi1_wvalid , axi0_wvalid ;
logic [  4-1: 0] axi1_wlen   , axi0_wlen   ;
logic            axi1_wfixed , axi0_wfixed ;
logic            axi1_werr   , axi0_werr   ;
logic            axi1_wrdy   , axi0_wrdy   ;

// PLL signals
logic                 pll_locked;

// ADC clock/reset
logic                 adc_clk;
logic                 adc_rstn;

// stream bus type
localparam type SBA_T = logic signed [14-1:0];  // acquire
localparam type SBG_T = logic signed [14-1:0];  // generate

SBA_T [MNA-1:0]          adc_dat;

// DAC signals
logic                    dac_clk_1x;
logic                    dac_clk_2x;
logic                    dac_clk_2p;
logic                    dac_rst;

logic        [14-1:0] dac_dat_a, dac_dat_b;
//logic        [14-1:0] dac_a    , dac_b    ;//Alexei removed
//logic signed [15-1:0] dac_a_sum, dac_b_sum; //Alexei removed

//LOCK
logic                   trigger_out;
logic        [2-1:0]    osc_ctrl;
logic signed [1:0] [14-1:0] lock_out;
logic signed [1:0] [14-1:0] lock2scope;

// system bus
sys_bus_if   ps_sys      (.clk (adc_clk), .rstn (adc_rstn));
sys_bus_if   sys [8-1:0] (.clk (adc_clk), .rstn (adc_rstn));

// GPIO interface //Alexei: cannot be removed
gpio_if #(.DW (24)) gpio ();

////////////////////////////////////////////////////////////////////////////////
// PLL (clock and reset)
////////////////////////////////////////////////////////////////////////////////
internal_clks_pll pll (
  // inputs
  .clk_in1_p    (adc_clk_i[1]),  // clock
  .clk_in1_n    (adc_clk_i[0]),  // clock
  .resetn        (frstn[0]  ),  // reset - active low
  // output clocks
  .clk_adc     (adc_clk   ),  // ADC clock
  .clk_dac_1x  (dac_clk_1x),  // DAC clock 125MHz
  .clk_dac_2x  (dac_clk_2x),  // DAC clock 250MHz
  .clk_dac_2p  (dac_clk_2p),  // DAC clock 250MHz -45DGR
  // status outputs
  .pll_locked  (pll_locked)
);

// ADC reset (active low)
always @(posedge adc_clk)
adc_rstn <=  frstn[0] &  pll_locked;

// DAC reset (active high)
always @(posedge dac_clk_1x)
dac_rst  <= ~frstn[0] | ~pll_locked;

////////////////////////////////////////////////////////////////////////////////
//  Connections to PS
////////////////////////////////////////////////////////////////////////////////

red_pitaya_ps ps (
  .FIXED_IO_mio       (  FIXED_IO_mio                ),
  .FIXED_IO_ps_clk    (  FIXED_IO_ps_clk             ),
  .FIXED_IO_ps_porb   (  FIXED_IO_ps_porb            ),
  .FIXED_IO_ps_srstb  (  FIXED_IO_ps_srstb           ),
  .FIXED_IO_ddr_vrn   (  FIXED_IO_ddr_vrn            ),
  .FIXED_IO_ddr_vrp   (  FIXED_IO_ddr_vrp            ),
  // DDR
  .DDR_addr      (DDR_addr    ),
  .DDR_ba        (DDR_ba      ),
  .DDR_cas_n     (DDR_cas_n   ),
  .DDR_ck_n      (DDR_ck_n    ),
  .DDR_ck_p      (DDR_ck_p    ),
  .DDR_cke       (DDR_cke     ),
  .DDR_cs_n      (DDR_cs_n    ),
  .DDR_dm        (DDR_dm      ),
  .DDR_dq        (DDR_dq      ),
  .DDR_dqs_n     (DDR_dqs_n   ),
  .DDR_dqs_p     (DDR_dqs_p   ),
  .DDR_odt       (DDR_odt     ),
  .DDR_ras_n     (DDR_ras_n   ),
  .DDR_reset_n   (DDR_reset_n ),
  .DDR_we_n      (DDR_we_n    ),
  // system signals
  .fclk_clk_o    (fclk        ),
  .fclk_rstn_o   (frstn       ),
  // ADC analog inputs
  .vinp_i        (5'b0 /*vinp_i*/      ), //Alexei: disabled
  .vinn_i        (5'b0 /*vinn_i*/      ),//Alexei: disabled
  // GPIO //Alexei:unused
  .gpio          (gpio),
  // system read/write channel
  .bus           (ps_sys      ),
  // AXI masters
  .axi1_clk_i    (axi1_clk    ),  .axi0_clk_i    (axi0_clk    ),  // global clock
  .axi1_rstn_i   (axi1_rstn   ),  .axi0_rstn_i   (axi0_rstn   ),  // global reset
  .axi1_waddr_i  (axi1_waddr  ),  .axi0_waddr_i  (axi0_waddr  ),  // system write address
  .axi1_wdata_i  (axi1_wdata  ),  .axi0_wdata_i  (axi0_wdata  ),  // system write data
  .axi1_wsel_i   (axi1_wsel   ),  .axi0_wsel_i   (axi0_wsel   ),  // system write byte select
  .axi1_wvalid_i (axi1_wvalid ),  .axi0_wvalid_i (axi0_wvalid ),  // system write data valid
  .axi1_wlen_i   (axi1_wlen   ),  .axi0_wlen_i   (axi0_wlen   ),  // system write burst length
  .axi1_wfixed_i (axi1_wfixed ),  .axi0_wfixed_i (axi0_wfixed ),  // system write burst type (fixed / incremental)
  .axi1_werr_o   (axi1_werr   ),  .axi0_werr_o   (axi0_werr   ),  // system write error
  .axi1_wrdy_o   (axi1_wrdy   ),  .axi0_wrdy_o   (axi0_wrdy   )   // system write ready
);

////////////////////////////////////////////////////////////////////////////////
// system bus decoder & multiplexer (it breaks memory addresses into 8 regions)
////////////////////////////////////////////////////////////////////////////////

sys_bus_interconnect #(
  .SN (8),
  .SW (20)
) sys_bus_interconnect (
  .bus_m (ps_sys),
  .bus_s (sys)
);

// Bus 1 used for scope, 2 for lock module, others silenced:
sys_bus_stub sys_bus_stub_0 (sys[0]);
generate
for (genvar i=4; i<8; i++) begin: for_sys
  sys_bus_stub sys_bus_stub_4_8 (sys[i]);
end: for_sys
endgenerate


////////////////////////////////////////////////////////////////////////////////
// ADC IO
////////////////////////////////////////////////////////////////////////////////

assign adc_clk_o = 2'b10;
// To drive ADC clock from FPGA, comment out the previous line, uncomment the two following ones, and move R25 and R26 resistors to R27 and R28 
//ODDR i_adc_clk_p ( .Q(adc_clk_o[0]), .D1(1'b1), .D2(1'b0), .C(fclk[0]), .CE(1'b1), .R(1'b0), .S(1'b0));
//ODDR i_adc_clk_n ( .Q(adc_clk_o[1]), .D1(1'b0), .D2(1'b1), .C(fclk[0]), .CE(1'b1), .R(1'b0), .S(1'b0));

// ADC clock duty cycle stabilizer is enabled
assign adc_cdcs_o = 1'b1 ;

logic [2-1:0] [14-1:0] adc_dat_raw;

// IO block registers should be used here
// lowest 2 bits reserved for 16bit ADC
always @(posedge adc_clk)
begin
  adc_dat_raw[0] <= adc_dat_i[0][16-1:2];
  adc_dat_raw[1] <= adc_dat_i[1][16-1:2];
end
    
// transform into 2's complement (negative slope)
assign adc_dat[0] = {adc_dat_raw[0][14-1], ~adc_dat_raw[0][14-2:0]};
assign adc_dat[1] = {adc_dat_raw[1][14-1], ~adc_dat_raw[1][14-2:0]};

////////////////////////////////////////////////////////////////////////////////
// DAC IO
////////////////////////////////////////////////////////////////////////////////


// output registers + signed to unsigned (also to negative slope)
always @(posedge dac_clk_1x)
begin
  dac_dat_a <= {lock_out[0][14-1], ~lock_out[0][14-2:0]};
  dac_dat_b <= {lock_out[1][14-1], ~lock_out[1][14-2:0]};
end

// DDR outputs
ODDR oddr_dac_clk          (.Q(dac_clk_o), .D1(1'b0     ), .D2(1'b1     ), .C(dac_clk_2p), .CE(1'b1), .R(1'b0   ), .S(1'b0));
ODDR oddr_dac_wrt          (.Q(dac_wrt_o), .D1(1'b0     ), .D2(1'b1     ), .C(dac_clk_2x), .CE(1'b1), .R(1'b0   ), .S(1'b0));
ODDR oddr_dac_sel          (.Q(dac_sel_o), .D1(1'b1     ), .D2(1'b0     ), .C(dac_clk_1x), .CE(1'b1), .R(dac_rst), .S(1'b0));
ODDR oddr_dac_rst          (.Q(dac_rst_o), .D1(dac_rst  ), .D2(dac_rst  ), .C(dac_clk_1x), .CE(1'b1), .R(1'b0   ), .S(1'b0));
ODDR oddr_dac_dat [14-1:0] (.Q(dac_dat_o), .D1(dac_dat_b), .D2(dac_dat_a), .C(dac_clk_1x), .CE(1'b1), .R(dac_rst), .S(1'b0));

////////////////////////////////////////////////////////////////////////////////
// GPIO
////////////////////////////////////////////////////////////////////////////////

//IOBUF i_iobufp [8-1:0] (.O(exp_p_in), .IO(exp_p_io), .I(exp_p_out), .T(~exp_p_dir) );
//IOBUF i_iobufn [8-1:0] (.O(exp_n_in), .IO(exp_n_io), .I(exp_n_out), .T(~exp_n_dir) );
OBUF i_obufn1 (.I(trigger_out), .O(exp_n_io1));

////////////////////////////////////////////////////////////////////////////////
// oscilloscope
////////////////////////////////////////////////////////////////////////////////

red_pitaya_scope i_scope (
  // ADC
  .adc_a_i       (lock2scope[0]  ),  // CH 1
  .adc_b_i       (lock2scope[1]  ),  // CH 2
  .osc_ctrl_i    (osc_ctrl    ),  // Scope control from lock
  .adc_clk_i     (adc_clk     ),  // clock
  .adc_rstn_i    (adc_rstn    ),  // reset - active low
  .trig_ext_i    (trigger_out   ),  // trigger from Lock module
  // AXI0 master                 // AXI1 master
  .axi0_clk_o    (axi0_clk   ),  .axi1_clk_o    (axi1_clk   ),
  .axi0_rstn_o   (axi0_rstn  ),  .axi1_rstn_o   (axi1_rstn  ),
  .axi0_waddr_o  (axi0_waddr ),  .axi1_waddr_o  (axi1_waddr ),
  .axi0_wdata_o  (axi0_wdata ),  .axi1_wdata_o  (axi1_wdata ),
  .axi0_wsel_o   (axi0_wsel  ),  .axi1_wsel_o   (axi1_wsel  ),
  .axi0_wvalid_o (axi0_wvalid),  .axi1_wvalid_o (axi1_wvalid),
  .axi0_wlen_o   (axi0_wlen  ),  .axi1_wlen_o   (axi1_wlen  ),
  .axi0_wfixed_o (axi0_wfixed),  .axi1_wfixed_o (axi1_wfixed),
  .axi0_werr_i   (axi0_werr  ),  .axi1_werr_i   (axi1_werr  ),
  .axi0_wrdy_i   (axi0_wrdy  ),  .axi1_wrdy_i   (axi1_wrdy  ),
  // System bus
  .sys_addr      (sys[1].addr ),
  .sys_wdata     (sys[1].wdata),
  .sys_wen       (sys[1].wen  ),
  .sys_ren       (sys[1].ren  ),
  .sys_rdata     (sys[1].rdata),
  .sys_err       (sys[1].err  ),
  .sys_ack       (sys[1].ack  )
);

////////////////////////////////////////////////////////////////////////////////
//  LOCK pid+lock-in module
////////////////////////////////////////////////////////////////////////////////
lock i_lock (
  .clk(adc_clk),
  .rst(~adc_rstn),
  // input
  .in1( adc_dat[0] ),
  .in2( adc_dat[1] ),
  .ramp_on_sw(exp_p_io[4]),
  .pid_i_on_sw(exp_p_io[0]),
  .ramp_sm(exp_p_io[5]),
  .offset_sm(exp_p_io[1]),
  .pid_freeze(exp_n_io2),
  .ramp_enc(exp_p_io[7:6]),
  .offset_enc(exp_p_io[3:2]),
  // output
  .out1(lock_out[0]),
  .out2(lock_out[1]),
  .oscA(lock2scope[0]),
  .oscB(lock2scope[1]),
  .trigger(trigger_out),
  .mod_sqr(exp_n_io7),
  .osc_ctrl(osc_ctrl),
  // System bus
  .sys_addr      (sys[2].addr ),
  .sys_wdata     (sys[2].wdata),
  .sys_wen       (sys[2].wen  ),
  .sys_ren       (sys[2].ren  ),
  .sys_rdata     (sys[2].rdata),
  .sys_err       (sys[2].err  ),
  .sys_ack       (sys[2].ack  )
);

////////////////////////////////////////////////////////////////////////////////
//  SCPI monitoring module for LOCK pid+lock-in module
////////////////////////////////////////////////////////////////////////////////
lock_monitor i_lock_monitor (
  .clk(adc_clk),
  .rst(~adc_rstn),
  // input
   .unlim_integr(lock_out[0]),
  // System bus
  .sys_addr      (sys[3].addr ),
  .sys_wdata     (sys[3].wdata),
  .sys_wen       (sys[3].wen  ),
  .sys_ren       (sys[3].ren  ),
  .sys_rdata     (sys[3].rdata),
  .sys_err       (sys[3].err  ),
  .sys_ack       (sys[3].ack  )
);



endmodule: red_pitaya_top

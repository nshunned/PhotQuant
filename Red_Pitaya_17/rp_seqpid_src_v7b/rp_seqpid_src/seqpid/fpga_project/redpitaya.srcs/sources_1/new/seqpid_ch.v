`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: PhotQuant, CNRS USR 3573
// Engineer: Alexei
//
// Create Date: 08.04.2020 17:17:16
// Design Name:
// Module Name: seqpid
// Project Name:
// Target Devices:
// Tool Versions:
// Description: This module generates an ~arbitrary analog output waveform.
//              This waveform is defined by a set of "elements", each consisting of some number of "slices"
//              In each slice, the waveform is a linear function of time. 
//              Each element can be repeated in a "burst" up to 2^18 times.
//              Elements can be executed in random order, in a sequence of up to 2048 steps.
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

//(* dont_touch = "true" *)
//(* keep = "true" *)
//(* use_dsp48 = "yes" *)
//(* fsm_encoding = "gray" *)
//(* keep_hierarchy = "yes" *)

module seqpid_ch(
// inputs
input clk, rst, trigger, init_seq, stop_seq,
input  signed   [14-1:0] in,
// outputs
output signed   [14-1:0] out,
// system bus
input           [32-1:0] sys_addr        ,  //!< bus address, 20 bits per module, see https://redpitaya.readthedocs.io/en/latest/developerGuide/fpga.html
input           [32-1:0] sys_wdata       ,  //!< bus write data
input                    sys_wen         ,  //!< bus write enable
input                    sys_ren         ,  //!< bus read enable
output reg      [32-1:0] sys_rdata       ,  //!< bus read data
output reg               sys_err         ,  //!< bus error indicator
output reg               sys_ack            //!< bus acknowledge signal
);

// Module starts here  *********************************************

//Internal signals *************************************************

// internal signals for BlockRAMs:
wire        [18-1:0] dataStep_a;        //bus for data exchange between stepRAM and PS (width <=32 bits), address controlled by sys_addr
wire        [11-1:0] addrStep_b;        //address for data transfer from stepRAM to seqgen
wire        [36-1:0] dataStep_b;        //[35:34 unused,33:32 pid_mute_mode, 31:18 addrSlice0, 17:0 countBurst]
wire        [20-1:0] dataSlice_a;       //bus for data exchange between stepRAM and PS (width <=32 bits), address controlled by sys_addr
wire        [14-1:0] addrSlice_b;       //address for data transfer from sliceRAM to seqgen
wire        [80-1:0] dataSlice_b;       // [79 last slice of an element, 78 PID active or frozen/bypassed, 77:64 start voltage, 63:49 voltage ramp step, 48:18 slice duration, 17:0 time btw steps]
// internal signals for sequence generator main state machine:
reg         [11-1:0] seq_countStepLim;  //step counter limit (number of elements in flattened sequence -1)
reg         [21-1:0] seq_syncDelay;     //initial delay between trigger and sequence start, for synchronisation with other hardware
reg                  seq_out_overwr;    //generator output overwrite on rising edge
reg         [14-1:0] seq_overwr_val;    //enerator output overwrite value
wire signed [14-1:0] seq_out;           //output of the sequence generator 
reg  signed [14-1:0] seq_out_reg;       //delayed copy of seq_out to fix timing errors
wire                 pid_freeze;        //pid frozen/bypassed/scaling when high, active when low
wire           [1:0] pid_mute_mode;     //when pid frozen, output is [0] from pid (freeze), [1] from generator (bypass), [2] from scaling module (scale)
localparam pid_mute_freeze = 2'b00;
localparam pid_mute_bypass = 2'b01;
localparam pid_mute_scale  = 2'b10;
wire                 seqRunning;        //sequence running when high
reg                  trig_enable;       //sequence triggers ignored when low
// internal signals for PID
wire signed [15-1:0] error_d;           //unsaturated error signal
wire signed [14-1:0] error;             // error signal saturated to 14 bits
reg  signed [14-1:0] error_reg;         // registered error signal (removes timing violation)
reg         [ 3-1:0] pid_PSR, pid_ISR, pid_DSR;           //pid gain exponents
reg         [ 3-1:0] pid_cd;            //pid derivator cutoff frequency
reg  signed [11-1:0] pid_kp, pid_ki, pid_kd;//p,i,d gains
reg signed  [14-1:0] pid_max, pid_min;  // max and min saturation of the output
reg                  pid_off;           //pid reset and bypassed when high
wire signed [14-1:0] pid_out;           //output of the PID
// internal signals for scaler
reg signed  [14-1:0] offset_adc;
reg signed  [15-1:0] offset_dac;//with output resisors removed, this offset needs int15 encoding
wire signed [13:0]   scaled_out;
// internal signals for communications with PS
reg         [1:0]    enforceMode;       //unused by the FPGA, only for storage btw client connections
reg                  inputRangeLow;      //unused by the FPGA, only for storage btw client connections
reg         [3-1: 0] ren_dly ;          //delay for data redaout from RAMs
reg                  ack_dly ;          //acknowledgement delay for data readout from RAMS
wire                 sys_en;            //data exchage enable
//Module logic *************************************************

/*
stepRAM stores:
- pid_mute_mode [33:32] (when pid_freeze high, output is : 0 => frozen PID, 1 => generator, 2 => scaler)
- the address of the first slice of the sequence element [31:18]
- the number of times (-1) this element is executed in a burst [17:0]
The sequence execution engine seqgen steps through this list until reaching countStepLim, then returns to the 0
*/
bram_18x4k_36x2k stepRAM(
    .clka(clk),
    .wea(&{sys_wen,!sys_addr[19],sys_addr[18]}),//write only when sequence is idle to avoid inconsistent output
    .addra(sys_addr[14-1:2]),
    .dina(sys_wdata[18-1:0]),
    .douta(dataStep_a),
    .clkb(clk),
    .web(1'b0),
    .addrb(addrStep_b),
    .dinb(10'b0),
    .doutb(dataStep_b)
  );    

/*
sliceRAM stores "slices", sequentially for each element.
Each slice is defined by 80 bits telling:
 - whether or not it is the last slice of an element [79]
 - whether or not the PID should be active (0) or frozen/bypassed (1) [78]
 - the initial value of the output voltage [77:64]
 - the voltage step performed by the ramp [63:49]
 - its duration [48:18]
 - and the time between two voltage steps [17:0]
*/
bram_20x49k_80x12k sliceRAM(
.clka(clk),
.wea(&{sys_wen,sys_addr[19],!sys_addr[18]}),
.addra(sys_addr[18-1:2]),
.dina(sys_wdata[20-1:0]),
.douta(dataSlice_a),
.clkb(clk),
.web(1'b0),
.addrb(addrSlice_b),
.dinb(80'b0),
.doutb(dataSlice_b)
);

// sequence generator --------------------------
seqgen i_seqgen(
.clk(clk),
.rst(rst),
.trig(trigger && trig_enable),
.init_seq(init_seq && trig_enable),
.stop_seq(stop_seq),
.countStepLim(seq_countStepLim),
.syncDelay(seq_syncDelay),
.addrStep(addrStep_b),
.dataStep(dataStep_b[34-1:0]),
.addrSlice(addrSlice_b),
.dataSlice(dataSlice_b),
.out_overwr(seq_out_overwr),
.overwr_val(seq_overwr_val),
.out(seq_out),
.pid_freeze(pid_freeze),
.pid_mute_mode(pid_mute_mode),
.seqRunningOut(seqRunning)
);

always @(posedge clk) begin //timing improvements
    seq_out_reg <= seq_out;
end

//error signal = output of sequence generator - fast analog input
assign error_d = seq_out_reg - in;
satsigned #(.Ri(15),.Ro(14)) i_satsigned_err ( .in(error_d), .out(error) );

always @(posedge clk) //timing improvements
    error_reg <= error;

// pid with limited differentiator gain --------------------------
 pidlim i_pidlim(
   .clk( clk ),
   .rst( rst || pid_off ),  
   .freeze( pid_freeze ),
   .error( error_reg ), 
   .pid_out( pid_out ), 
   .ISR (pid_ISR) ,
   .PSR( pid_PSR ) , 
   .DSR( pid_DSR) , 
   .ki( pid_ki), 
   .kp( pid_kp), 
   .kd( pid_kd), 
   .cd( pid_cd),
   .pid_max ( pid_max ),
   .pid_min( pid_min )
);

// scaling module
scaler i_scaler(
   .clk( clk ),
   .seqgen_in( seq_out ),
   .pid_in( pid_out ),
   .freeze( pid_freeze ),
   .offset_adc(offset_adc),
   .offset_dac(offset_dac),
   .scaled_out(scaled_out)
);

// pid bypass:
// if PID disabled, or PID frozen and we use the "mute" mode defined by the 33rd bit stored in stepRAM, out <= generator output
// otherwise, output <= pid output, which may be running, reset or frozen
assign out = (pid_off || (pid_mute_mode == pid_mute_bypass)) ? seq_out_reg : (pid_mute_mode == pid_mute_scale) ? scaled_out : pid_out;


//  System bus connection

// SO --> MEMORIA --> FPGA
always @(posedge clk)
if (rst) begin
    pid_off               <=   1'b0     ; // pid off when high
    pid_PSR               <=   3'd2     ; // pid proportional gain exponent
    pid_ISR               <=   3'd6     ; // pid integrator gain exponent
    pid_DSR               <=   3'd0     ; // pid derivator gain exponent
    pid_kp                <=  11'd0     ; // pid proportional gain factor
    pid_ki                <=  11'd0     ; // pid integrator gain factor
    pid_kd                <=  11'd0     ; // pid derivator gain factor
    pid_cd                <=   3'b0     ; // pid derivator cutoff exponent
    pid_max               <=  14'h1FFF  ;// 2¹³-1=+1V or 0V
    pid_min               <=  14'h2000  ;// -2¹³=-1V or 2V
    seq_countStepLim      <=  11'b0     ;//
    seq_syncDelay         <=  21'b0     ;//
    seq_out_overwr        <=   1'b0     ;//generator output overwrite if high
    enforceMode           <=   2'b0     ;//default mode : Voltage+Time
end else begin
    if (sys_wen && !sys_addr[19] && !sys_addr[18]) begin
        if (sys_addr[4:2]==3'h0)  {offset_dac,offset_adc}                       <= {sys_wdata[30:16],sys_wdata[13:0]};
        if (sys_addr[4:2]==3'h1)  {pid_ISR, pid_ki,pid_PSR, pid_kp}             <= {sys_wdata[29:16],sys_wdata[13:0]};
        if (sys_addr[4:2]==3'h2)  {pid_off,pid_cd, pid_DSR, pid_kd}             <= {sys_wdata[19:16],sys_wdata[13:0]};
        if (sys_addr[4:2]==3'h3)  {pid_max, pid_min}                            <= {sys_wdata[30-1:16],sys_wdata[14-1:0]}; 
        if (sys_addr[4:2]==3'h4)  {seq_syncDelay, seq_countStepLim}             <=  sys_wdata;//21 MSBs to syncDelay, 11 LSBs to countStepLim 
        if (sys_addr[4:2]==3'h5)  {trig_enable,seq_out_overwr, seq_overwr_val, inputRangeLow, enforceMode} <=  {sys_wdata[31:16], sys_wdata[2:0]}; 
    end
end
//---------------------------------------------------------------------------------
// FPGA --> MEMORIA --> SO
assign sys_en = sys_wen | sys_ren;

always @(posedge clk, posedge rst)
if (rst) begin
    sys_err <= 1'b0  ;
    sys_ack <= 1'b0  ;
    ren_dly <= 3'b0  ;
    ack_dly <= 1'b0  ;
end else begin
    ren_dly <= {ren_dly[3-2:0], sys_ren};
    ack_dly <=  ren_dly[3-1] || sys_wen ;
    sys_err <= 1'b0 ;
    casez (sys_addr[19:18])
        2'h2 : begin sys_ack <= ack_dly;  sys_rdata <= {12'b0, dataSlice_a}; end
        2'h1 : begin sys_ack <= ack_dly;  sys_rdata <= {14'b0,dataStep_a}; end
        2'h0 :
            casez (sys_addr[4:2])
                3'h0 : begin sys_ack <= sys_en;  sys_rdata <= {  1'b0, offset_dac, 2'b0, offset_adc}; end 
                3'h1 : begin sys_ack <= sys_en;  sys_rdata <= {  2'b0, pid_ISR, pid_ki, 2'b0, pid_PSR, pid_kp}; end 
                3'h2 : begin sys_ack <= sys_en;  sys_rdata <= { 12'b0, pid_off, pid_cd, 2'b0, pid_DSR, pid_kd}; end 
                3'h3 : begin sys_ack <= sys_en;  sys_rdata <= {  2'b0, pid_max, 2'b0, pid_min}; end 
                3'h4 : begin sys_ack <= sys_en;  sys_rdata <= { seq_syncDelay, seq_countStepLim}; end 
                3'h5 : begin sys_ack <= sys_en;  sys_rdata <= {  trig_enable, seq_out_overwr, seq_overwr_val, 13'b0, inputRangeLow, enforceMode}; end
                3'h6 : begin sys_ack <= sys_en;  sys_rdata <= {  1'b0, seqRunning, seq_out_reg, 2'b0, in}; end
//                default : begin sys_ack <= sys_en;  sys_rdata <= 32'b0; end
            endcase
        default :  begin sys_ack <= sys_en;  sys_rdata <= 32'b0; end
    endcase
end
// [FPGA MEMORY DOCK END]

endmodule

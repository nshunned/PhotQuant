`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2020 01:23:54 PM
// Design Name: 
// Module Name: seqpid_instr
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


module seqpid_instr(
    input                   clk,
    input                   rst,
    input                   clk_ext_use, //PS readout of presence of correctly-configured external clock
    output reg              start_seq, //software sequence trigger
    output reg              init_seq_edge,// initialisation of sequence to starting point
    output reg              stop_seq,// interrupt sequence
    output reg              clk_out_enab,//enable 40MHz clock output on BNC
    output reg              trig_out_enab,//enable sequence trigger output on BNC
    input           [32-1:0] sys_addr        ,  //!< bus address, 20 bits per module, see https://redpitaya.readthedocs.io/en/latest/developerGuide/fpga.html
    input           [32-1:0] sys_wdata       ,  //!< bus write data
    input                    sys_wen         ,  //!< bus write enable
    input                    sys_ren         ,  //!< bus read enable
    output reg      [32-1:0] sys_rdata       ,  //!< bus read data
    output reg               sys_err         ,  //!< bus error indicator
    output reg               sys_ack            //!< bus acknowledge signal
    );
    
reg [1:0] action, action_buf; // sequence run/stop/init/idle
    localparam act_Idle = 2'h0;
    localparam act_Init = 2'h1;
    localparam act_Stop = 2'h2;
    localparam act_Run  = 2'h3;
reg trig_out_enab_buf;

always @(posedge clk) begin
    action_buf <= action;
    start_seq <= (action == act_Run);
    stop_seq <= (action == act_Stop);
    init_seq_edge <= ((action == act_Init) && (action_buf != act_Init));
    trig_out_enab <= trig_out_enab_buf;
end

//  System bus connection

// SO --> MEMORIA --> FPGA

always @(posedge clk)
    if (rst) begin
        action          <=   2'b0     ;
//        trig_out_enab   <=   1'b0     ;
//        clk_out_enab    <=   1'b0     ;
    end else begin
        if (sys_wen) begin
            if (sys_addr[4:2]==3'h0)  {clk_out_enab, trig_out_enab_buf, action}   <=  sys_wdata[3:0];
        end
    end

// FPGA --> MEMORIA --> SO
wire sys_en;
assign sys_en = sys_wen | sys_ren;

always @(posedge clk, posedge rst)
if (rst) begin
    sys_err <= 1'b0  ;
    sys_ack <= 1'b0  ;
end else begin
    sys_err <= 1'b0 ;
/*
    casez (sys_addr[4:2])
        3'h0 : begin sys_ack <= sys_en;  sys_rdata <= {  26'b0, clk_ext_use, clk_out_enab, trig_out_enab, trig_in_enab, action}; end 
        default : begin sys_ack <= sys_en;  sys_rdata <= 32'b0; end
    endcase
*/
    sys_ack <= sys_en;  sys_rdata <= {  27'b0, clk_ext_use, clk_out_enab, trig_out_enab_buf, action};
end
// [FPGA MEMORY DOCK END]


endmodule

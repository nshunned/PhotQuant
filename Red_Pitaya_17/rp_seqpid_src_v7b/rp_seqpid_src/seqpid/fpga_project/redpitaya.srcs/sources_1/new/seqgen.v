`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: PhotQuant
// Engineer: Alexei
// 
// Create Date: 04/20/2020 10:12:28 AM
// Design Name: 
// Module Name: seqgen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Main state machine controlling the generation of a sequence of analog ramps
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seqgen(
input clk,
input rst,
input trig, // trigger from external pin or software starting sequence
input init_seq, // trigger from seqpid_instr resetting sequence to starting point
input stop_seq, // signal from seqpid_instr stopping sequence
input [10:0] countStepLim, // step counter wrap limit
input [20:0] syncDelay, // initial delay for synchrolozation with other hardware
output reg [10:0] addrStep,
input [33:0] dataStep,
output reg [13:0] addrSlice,
input [79:0] dataSlice,
input        out_overwr, //overwrite output value when rising edge
input [13:0] overwr_val, //value to output, when rising edge on out_overwr
output signed [13:0] out, //generator output
output reg pid_freeze,
output reg [1:0] pid_mute_mode,
output seqRunningOut
);

reg syncDelayRunning, lastSlice, out_overwr_buf, seqRunning;
reg [1:0] pid_mute_mode_mem;
reg [30:0] timeSlice;
reg [17:0] timeIncr, timeIncr_buf;
reg [17:0] countBurst;
reg signed [15:0] out_sum;
reg signed [14:0] out_step;
wire signed [13:0] out_sat;
reg [20:0] timeSliceBuf;//stores timeSlice during hardware delay synchronzation
reg [13:0] addrSliceBuf;// buffer for address of first slice in an element, used for bursts

assign seqRunningOut = seqRunning || syncDelayRunning;


always @(posedge clk) begin
if (!seqRunning) begin
    out_overwr_buf <= out_overwr;
    if (out_overwr && !out_overwr_buf)
        out_sum <= {overwr_val[13],overwr_val[13],overwr_val[13:0]};//overwrite output if requested
    if (syncDelayRunning) begin // before actually starting the sequence: hardware synchronization delay
        if (timeSlice[20:0] == 21'h0) begin
            syncDelayRunning <= 1'b0;
            timeSlice[20:0] <= timeSliceBuf;
            seqRunning <= 1'b1;
        end else
            timeSlice[20:0] <= timeSlice[20:0] -1;
    end
    else if (trig) begin // sequence trigger rising edge: first go to hardware sync delay
        timeSliceBuf <= timeSlice[20:0];
        timeSlice[20:0] <= syncDelay;
        syncDelayRunning <= 1'b1;
    end else if (init_seq) begin
        addrStep <= 11'b0;
        countBurst <= 18'h0;
        lastSlice <= 1'b1;
        timeSlice <= 31'h5;
        timeIncr <= 31'h5;
        seqRunning <= 1'b1;
    end
end else begin //sequence running
    if (timeSlice == 31'h0) begin
        lastSlice <= dataSlice[79];
        pid_freeze <= dataSlice[78];
        pid_mute_mode <= dataSlice[78] ? pid_mute_mode_mem : 2'b00;// if pid "mute" mode chosen, when the PID is frozen its output goes to 0 instead of staying constant.
        out_sum <= $signed({dataSlice[77],dataSlice[77],dataSlice[77:64]});
        out_step <= $signed(dataSlice[63:49]);
        timeSlice <= dataSlice[48:18];
        timeIncr <= dataSlice[17:0];
        timeIncr_buf <= dataSlice[17:0];
        if (lastSlice)// just finished last slice of an element
            if (countBurst == 18'h0) begin
                countBurst <= dataStep[17:0];
                addrSliceBuf <= dataStep[31:18];
                addrStep <= (addrStep == countStepLim) ? 11'h0 : addrStep +1;
                if (addrStep == 0)//entering step 0: stop here and wait for trigger
                    seqRunning <= 1'b0;
            end else
                countBurst <= countBurst - 1;
        if (dataSlice[79]) //starting last slice of an element
            addrSlice <= (countBurst == 18'h0) ? dataStep[31:18] : addrSliceBuf;
        else
            addrSlice <= addrSlice + 1;
    end else begin
        timeSlice <= timeSlice - 1;
        if (lastSlice && (countBurst == 18'h0)) begin//during last slice of a burst, keep updating addrSlice and muteMode from dataStep to get corrrect config at the end
            addrSlice <= dataStep[31:18];
            pid_mute_mode_mem <= dataStep[33:32];
        end
        if (timeIncr == 18'h0) begin
            timeIncr <= timeIncr_buf;
            out_sum <= out_sat + out_step;
        end else
            timeIncr <= timeIncr - 1;
        if (stop_seq)
            seqRunning <= 1'b0;
    end

    
end
end

satsigned #(.Ri(16),.Ro(14)) i_satsigned_out ( .in(out_sum), .out(out_sat) );
assign out = out_sat;

endmodule

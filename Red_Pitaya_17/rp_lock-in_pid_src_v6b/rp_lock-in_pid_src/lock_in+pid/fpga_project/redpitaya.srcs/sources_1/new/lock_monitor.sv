`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2021 08:47:00 PM
// Design Name: 
// Module Name: lock_monitor
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


module lock_monitor(
    input clk, rst,
    input [14-1:0] unlim_integr,
        // system bus
    input           [32-1:0] sys_addr        ,  //!< bus address, 20 bits per module (4 used here) see https://redpitaya.readthedocs.io/en/latest/developerGuide/fpga.html
    input           [32-1:0] sys_wdata       ,  //!< bus write data
    input                    sys_wen         ,  //!< bus write enable
    input                    sys_ren         ,  //!< bus read enable
    output logic    [32-1:0] sys_rdata       ,  //!< bus read data
    output logic             sys_err         ,  //!< bus error indicator
    output logic             sys_ack            //!< bus acknowledge signal

);
    logic [19:0] countIntLP;
    logic lp_filter_run;
    logic [13:0] integr_out;
    logic [13:0] integr_out_dump;//the 14 fractional bits of the low-passed unlimited integrator are dumped
    logic  [2:0] integr_lptimeexp;
    
    always @(posedge clk)
    begin
        countIntLP <= countIntLP + 1'b1;
        lp_filter_run <= &countIntLP;
    end
    
    LPFilterGain1 #(.Rin(14),.Sfix(0),.MaxTau(14)) i_LP_filter_IntLP (
        .clk(clk),
        .rst(rst),
        .run(lp_filter_run),
        .in( unlim_integr ),
        .tau( {integr_lptimeexp,1'b0} ),
        .out( {integr_out,integr_out_dump} )
    );
        
    // [FPGA MEMORY DOCK]
    //---------------------------------------------------------------------------------
        
    //
    //  System bus connection

    // SO --> MEMORIA --> FPGA

    always @(posedge clk)
    if (rst) begin
        integr_lptimeexp <=  3'd0; // 20'h00004 : low-passed unlimited integrator exponent, r/w via SCPI server
    end else begin
        if (sys_wen) begin
            if (sys_addr[2]==1'h1)  integr_lptimeexp <=  sys_wdata[ 3-1: 0] ;
        end
    end
    //---------------------------------------------------------------------------------
    // FPGA --> MEMORIA --> SO
    wire sys_en;
    assign sys_en = sys_wen | sys_ren;

    always @(posedge clk, posedge rst)
    if (rst) begin
        sys_err <= 1'b0  ;
        sys_ack <= 1'b0  ;
    end else begin
        sys_err <= 1'b0 ;
        sys_ack <= sys_en;//no delayed acknowledgements here (no BRAMs used)
/* This looks nice and has a wns of 0.303 but, unlike in the SeqPID project, the C code only gets the first element of a uint32
        casez (sys_addr[5:2]) //1 signal at most per 1 hex = 4 bits, to make the registers ~ human-readable
            4'h0 : sys_rdata <= { 7'b0, trig_sw, 6'b0, osc_ctrl, 6'b0, oscB_sw, 6'b0, oscA_sw };
            4'h1 : sys_rdata <= { 4'b0, demod_gain, 3'b0, demod_lpf, loc_osc_phase, 1'b0, mod_period };
            4'h2 : sys_rdata <= { 7'b0, ramp_on, 4'b0, ramp_freqexp, 2'b0, ramp_B_factor };
            4'h3 : sys_rdata <= { 2'b0, offset_out_B, 2'b0, error_offset };
            4'h4 : sys_rdata <= { 3'b0, error_sw, 3'b0, pid_off, 5'b0, pid_PSR, 5'b0, pid_kp  };
            4'h5 : sys_rdata <= { 3'b0, pid_freeze_reg, 3'b0, pid_i_on, 5'b0, pid_ISR, 5'b0, pid_ki };
            4'h6 : sys_rdata <= { 5'b0, pid_cl, 5'b0, pid_LSR, 5'b0, pid_kl };
            4'h7 : sys_rdata <= { 5'b0, pid_cf, 5'b0, pid_FSR, 5'b0, pid_kf };
            4'h8 : sys_rdata <= { 5'b0, pid_cd, 5'b0, pid_DSR, 5'b0, pid_kd };
            4'h9 : sys_rdata <= { 3'b0, rl_error_max, 7'b0, rl_unlocked, 4'b0, rl_config };
            4'hA : sys_rdata <= { 2'b0, rl_signal_max, 2'b0, rl_signal_min };
            4'hB : sys_rdata <= {18'b0, error_mean  };
            4'hC : sys_rdata <= { 4'b0, error_var  } ;
            4'hD : sys_rdata <= { 2'b0, ramp_ampl, 2'b0, ramp_offset };
            4'hE : sys_rdata <= { 5'b0, ramp_ampl_step, 5'b0, ramp_offs_step};
            default   : sys_rdata <=  32'h0        ;
        endcase
*/
        casez (sys_addr[2])
            1'h0 : sys_rdata <= { 18'b0, integr_out }; // 20'h00000 : low-passed unlimited integrator output
            1'h1 : sys_rdata <= { 29'b0, integr_lptimeexp }; // 20'h00004 : low-passed unlimited integrator output
//            default   : sys_rdata <=  32'h0        ;
        endcase

    end
    // [FPGA MEMORY DOCK END]
endmodule

/**
 * $Id: $
 *
 * @brief Red Pitaya Scpi server SCPI configuration and general command implementation
 *
 * @Author Red Pitaya
 *
 * (c) Red Pitaya  http://www.redpitaya.com
 *
 * This part of code is written in C programming language.
 * Please visit http://en.wikipedia.org/wiki/C_(programming_language)
 * for more details on the language used herein.
 */

#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>
//#include <stdio.h>

#include "api_cmd.h"
#include "common.h"
#include "seqpid.h"
#include "scpi/error.h"
#include "scpi/ieee488.h"
#include "scpi/minimal.h"
#include "scpi/units.h"
#include "scpi/parser.h"

bool RST_executed = FALSE;

/**
 * Interface general commands
 */
size_t SCPI_Write(scpi_t * context, const char * data, size_t len) {

    size_t total = 0;

    if (context->user_context != NULL) {
        int fd = *(int *)(context->user_context);
        while (len > 0) {
            size_t written =  write(fd, data, len);
            if (written < 0) {
                syslog(LOG_ERR,
                    "Failed to write into the socket. Should send %zu bytes. Could send only %zu bytes",
                    len, written);
                return total;
            }
            len -= written;
            data += written;
            total += written;
        }
    }
    return total;
}

scpi_result_t SCPI_Flush(scpi_t * context) {
    return SCPI_RES_OK;
}

int SCPI_Error(scpi_t * context, int_fast16_t err) {
    const char error[] = "ERR!";
//Alexei: uncomment the next 2 lines, comment the previous one, and include stdio.h to return error code to SCPI user instead of "ERR!"
//    char error[4];
//	sprintf(error,"%d",(int16_t)err);//Alexei: end changes here (+ include stdio.h)
    syslog(LOG_ERR, "**ERROR: %d, \"%s\"", (int32_t) err, SCPI_ErrorTranslate(err));
    SCPI_Write(context, error, strlen(error));
    return 0;
}

scpi_result_t SCPI_Control(scpi_t * context, scpi_ctrl_name_t ctrl, scpi_reg_val_t val) {
    if (SCPI_CTRL_SRQ == ctrl) {
        syslog(LOG_ERR, "**SRQ not implemented");
    } else {
         syslog(LOG_ERR, "**CTRL not implemented");
    }

    return SCPI_RES_ERR;
}

scpi_result_t SCPI_Reset(scpi_t * context) {
    /* Terminating all scpi operations */
    (void) context;
    RP_LOG(LOG_INFO, "*RST Sucsessfuly reset scpi server.");
    return SCPI_RES_OK;
}

scpi_result_t SCPI_SystemCommTcpipControlQ(scpi_t * context) {
    syslog(LOG_ERR, "**SCPI_SystemCommTcpipControlQ not implemented");
    return SCPI_RES_ERR;
}

/**
 * SCPI Configuration
 */

static const scpi_command_t scpi_commands[] = {
    /* IEEE Mandated Commands (SCPI std V1999.0 4.1.1) */
    { .pattern = "*CLS" , .callback = SCPI_CoreCls,},
    { .pattern = "*ESE" , .callback = SCPI_CoreEse,},
    { .pattern = "*ESE?", .callback = SCPI_CoreEseQ,},
    { .pattern = "*ESR?", .callback = SCPI_CoreEsrQ,},
    { .pattern = "*IDN?", .callback = SCPI_CoreIdnQ,},
    { .pattern = "*OPC" , .callback = SCPI_CoreOpc,},
    { .pattern = "*OPC?", .callback = SCPI_CoreOpcQ,},
    { .pattern = "*RST" , .callback = SCPI_CoreRst,},
    { .pattern = "*SRE" , .callback = SCPI_CoreSre,},
    { .pattern = "*SRE?", .callback = SCPI_CoreSreQ,},
    { .pattern = "*STB?", .callback = SCPI_CoreStbQ,},
    { .pattern = "*TST?", .callback = SCPI_CoreTstQ,},
    { .pattern = "*WAI" , .callback = SCPI_CoreWai,},

    /* Required SCPI commands (SCPI std V1999.0 4.2.1) */
    {.pattern = "SYSTem:ERRor[:NEXT]?", .callback = SCPI_SystemErrorNextQ,},
    {.pattern = "SYSTem:ERRor:COUNt?",  .callback = SCPI_SystemErrorCountQ,},
    {.pattern = "SYSTem:VERSion?",      .callback = SCPI_SystemVersionQ,},

    {.pattern = "STATus:QUEStionable[:EVENt]?", .callback = SCPI_StatusQuestionableEventQ,},
    {.pattern = "STATus:QUEStionable:ENABle",   .callback = SCPI_StatusQuestionableEnable,},
    {.pattern = "STATus:QUEStionable:ENABle?",  .callback = SCPI_StatusQuestionableEnableQ,},
    {.pattern = "STATus:PRESet",                .callback = SCPI_StatusPreset,},

    {.pattern = "SYSTem:COMMunication:TCPIP:CONTROL?", .callback = SCPI_SystemCommTcpipControlQ,},

    /* RedPitaya */

    /* General commands */
    {.pattern = "RP:INit", .callback                    = RP_InitAll,},
    {.pattern = "RP:REset", .callback                   = RP_ResetAll,},
    {.pattern = "RP:RELease", .callback                 = RP_ReleaseAll,},
    {.pattern = "RP:FPGABITREAM", .callback             = RP_FpgaBitStream,},
//    {.pattern = "RP:DIg[:loop]", .callback              = RP_EnableDigLoop,},

    /* SeqPID */
    {.pattern = "SEQ#:RST", .callback 					= RP_SeqReset,},
    {.pattern = "SEQ:GEN:ACTION", .callback 			= RP_SeqAction,},
    {.pattern = "SEQ:GEN:ACTION?", .callback 			= RP_SeqActionQ,},
    {.pattern = "SEQ:GEN:IDLE", .callback 				= RP_SeqActionIdle,},
    {.pattern = "SEQ:GEN:INIT", .callback 				= RP_SeqActionInit,},
    {.pattern = "SEQ:GEN:STOP", .callback 				= RP_SeqActionStop,},
    {.pattern = "SEQ:GEN:RUN", .callback 				= RP_SeqActionRun,},
    {.pattern = "SEQ:TRIGOUT:ENABLE", .callback	 		= RP_SeqTrigOutEnab,},
    {.pattern = "SEQ:TRIGOUT:ENABLE?", .callback 		= RP_SeqTrigOutEnabQ,},
    {.pattern = "SEQ:CLKOUT:ENABLE", .callback	 		= RP_SeqClkOutEnab,},
    {.pattern = "SEQ:CLKOUT:ENABLE?", .callback 		= RP_SeqClkOutEnabQ,},	
	{.pattern = "SEQ:EXTCLK?", .callback 				= RP_SeqClkExtUseQ,},
    {.pattern = "SEQ#:RANGES?", .callback 				= RP_SeqRangesQ,},
    {.pattern = "SEQ#:IN:RANGELOW", .callback 			= RP_SeqInRangeLow,},
    {.pattern = "SEQ#:IN:RANGELOW?", .callback 			= RP_SeqInRangeLowQ,},
    {.pattern = "SEQ#:PID:ENABLE", .callback 			= RP_SeqPIDEnable,},
    {.pattern = "SEQ#:PID:ENABLE?", .callback 			= RP_SeqPIDEnableQ,},
    {.pattern = "SEQ#:TRIG:ENABLE", .callback	 		= RP_SeqTrigEnable,},
    {.pattern = "SEQ#:TRIG:ENABLE?", .callback 			= RP_SeqTrigEnableQ,},
    {.pattern = "SEQ#:PID:GAINP", .callback 			= RP_SeqPIDGainP,},
    {.pattern = "SEQ#:PID:GAINP?", .callback 			= RP_SeqPIDGainPQ,},
    {.pattern = "SEQ#:PID:GAINI", .callback 			= RP_SeqPIDGainI,},
    {.pattern = "SEQ#:PID:GAINI?", .callback 			= RP_SeqPIDGainIQ,},
    {.pattern = "SEQ#:PID:GAIND", .callback 			= RP_SeqPIDGainD,},
    {.pattern = "SEQ#:PID:GAIND?", .callback 			= RP_SeqPIDGainDQ,},
    {.pattern = "SEQ#:PID:FREQD", .callback 			= RP_SeqPIDFreqD,},
    {.pattern = "SEQ#:PID:FREQD?", .callback 			= RP_SeqPIDFreqDQ,},
    {.pattern = "SEQ#:PID:MIN", .callback 				= RP_SeqPIDMin,},
    {.pattern = "SEQ#:PID:MIN?", .callback 				= RP_SeqPIDMinQ,},
    {.pattern = "SEQ#:PID:MAX", .callback 				= RP_SeqPIDMax,},
    {.pattern = "SEQ#:PID:MAX?", .callback 				= RP_SeqPIDMaxQ,},
    {.pattern = "SEQ#:GEN:DELAY", .callback 			= RP_SeqSyncDelay,},
    {.pattern = "SEQ#:GEN:DELAY?", .callback 			= RP_SeqSyncDelayQ,},
    {.pattern = "SEQ#:GEN:OVRWR", .callback 			= RP_SeqGenOverwriteValue,},
    {.pattern = "SEQ#:GEN:OVRWR?", .callback 			= RP_SeqGenOverwriteValueQ,},
    {.pattern = "SEQ#:IN:VOLT?", .callback 				= RP_SeqInputValueQ,},
    {.pattern = "SEQ#:GEN:VOLT?", .callback 			= RP_SeqGenOutputValueQ,},
    {.pattern = "SEQ#:GEN:RUNNING?", .callback 			= RP_SeqGenRunningQ,},
    {.pattern = "SEQ#:GEN:RUNGUESS?", .callback 		= RP_SeqGenRunGuessQ,},
    {.pattern = "SEQ#:GEN:STEP:BYSLICE", .callback 		= RP_SeqStepsBySlice,},
    {.pattern = "SEQ#:GEN:STEP:BYSLICE?", .callback		= RP_SeqStepsBySliceQ,},
    {.pattern = "SEQ#:GEN:STEP:BYINDEX", .callback 		= RP_SeqStepsByIndex,},
    {.pattern = "SEQ#:GEN:STEP:BYINDEX?", .callback		= RP_SeqStepsByIndexQ,},
    {.pattern = "SEQ#:GEN:ELEM", .callback 				= RP_SeqElements,},
    {.pattern = "SEQ#:GEN:ELEM:BYSLICE?", .callback		= RP_SeqElementsBySliceQ,},
    {.pattern = "SEQ#:GEN:ELEM:BYINDEX?", .callback		= RP_SeqElementsByIndexQ,},
    {.pattern = "SEQ#:GEN:DATA:INIT", .callback 		= RP_SeqInitElements,},
    {.pattern = "SEQ#:GEN:LISTSLICE0?", .callback		= RP_SeqListSlice0Q,},
    {.pattern = "SEQ#:GEN:ENFORCE", .callback 			= RP_SeqEnforceMode,},
    {.pattern = "SEQ#:GEN:ENFORCE?", .callback			= RP_SeqEnforceModeQ,},	

    SCPI_CMD_LIST_END
};

static scpi_interface_t scpi_interface = {
    .error   = SCPI_Error,
    .write   = SCPI_Write,
    .control = SCPI_Control,
    .flush   = SCPI_Flush,
    .reset   = SCPI_Reset,
};

#define SCPI_INPUT_BUFFER_LENGTH 538688
static char scpi_input_buffer[SCPI_INPUT_BUFFER_LENGTH];

static scpi_reg_val_t scpi_regs[SCPI_REG_COUNT];


scpi_t scpi_context = {
    .cmdlist = scpi_commands,
    .buffer = {
        .length = SCPI_INPUT_BUFFER_LENGTH,
        .data = scpi_input_buffer,
    },
    .interface = &scpi_interface,
    .registers = scpi_regs,
    .units = scpi_units_def,
    .idn = {"REDPITAYA", "INSTR2014", NULL, "01-02"},
};


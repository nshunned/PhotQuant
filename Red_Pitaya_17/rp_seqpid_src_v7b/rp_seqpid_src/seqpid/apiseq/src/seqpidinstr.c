/**
 * $Id: $
 *
 * @brief Red Pitaya library SeqPID instrument module interface
 *
 * @Author Alexei
 *
 *
 * This part of code is written in C programming language.
 * Please visit http://en.wikipedia.org/wiki/C_(programming_language)
 * for more details on the language used herein.
 */


#include <stdio.h>
#include <stdlib.h>
#include "common.h"
#include "redpitaya/rpseq.h"
#include "seqpidinstr.h"

static volatile seqpidinstr_control_t *seqpidinstr = NULL;

// MEMORY MAPPING:
int seqpidinstr_Init() {
	return cmn_Map(SEQPIDINSTR_BASE_SIZE, SEQPIDINSTR_BASE_ADDR, (void **) &seqpidinstr);
}

int seqpidinstr_Release() {
    return cmn_Unmap(SEQPIDINSTR_BASE_SIZE, (void **) &seqpidinstr);;
}

// COMMUNICATIONS WITH FPGA:

int seqpidinstr_setAction(rp_seq_action_t action) {
	seqpidinstr->seq_action = (uint8_t)action;
    return RP_OK;
}

int seqpidinstr_getAction(rp_seq_action_t *action) {
	*action = (rp_seq_action_t)(seqpidinstr->seq_action);
    return RP_OK;
}

int seqpidinstr_setTrigOutEnab(bool enable) {
	seqpidinstr->trig_out_enab = enable;
    return RP_OK;
}

int seqpidinstr_getTrigOutEnab(bool *enabled) {
	*enabled = (bool)(seqpidinstr->trig_out_enab);
	return RP_OK;
}

int seqpidinstr_setClkOutEnab(bool enable) {
	seqpidinstr->clk_out_enab = enable;
    return RP_OK;
}

int seqpidinstr_getClkOutEnab(bool *enabled) {
	*enabled = (bool)(seqpidinstr->clk_out_enab);
	return RP_OK;
}

int seqpidinstr_getClkExtUse(bool *enabled){
	*enabled = (bool)(seqpidinstr->clk_ext_use);
    return RP_OK;
}

/**
 * $Id: $
 *
 * @brief Red Pitaya library SeqPID module interface
 *
 * @Author Alexei
 *
 * This part of code is written in C programming language.
 * Please visit http://en.wikipedia.org/wiki/C_(programming_language)
 * for more details on the language used herein.
 */
#ifndef __SEQPIDINSTR_H
#define __SEQPIDINSTR_H

#include "redpitaya/rpseq.h"

// Base Generate addresses
#define SEQPIDINSTR_BASE_ADDR     	0x00100000
#define SEQPIDINSTR_BASE_SIZE	   	0x00000010

typedef struct seqpidinstr_control_s {
//FPGA addr 0x00000
    uint32_t	 seq_action   		:2; 
    uint32_t	 trig_out_enab   	:1; 
    uint32_t	 clk_out_enab   	:1; 
    uint32_t	 clk_ext_use	   	:1; 
    uint32_t	 					:27;
} seqpidinstr_control_t;

int seqpidinstr_Init();
int seqpidinstr_Release();

int seqpidinstr_setAction(rp_seq_action_t action);
int seqpidinstr_getAction(rp_seq_action_t *action);
int seqpidinstr_setTrigOutEnab(bool enable);
int seqpidinstr_getTrigOutEnab(bool *enabled);
int seqpidinstr_setClkOutEnab(bool enable);
int seqpidinstr_getClkOutEnab(bool *enabled);
int seqpidinstr_getClkExtUse(bool *enabled);


#endif //__SEQPIDINSTR_H

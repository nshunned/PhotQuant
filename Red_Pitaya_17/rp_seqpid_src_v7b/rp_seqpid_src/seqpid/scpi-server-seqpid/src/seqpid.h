/**
 * $Id: $
 *
 * @brief Red Pitaya Scpi server SeqPID SCPI commands interface
 *
 * @Author Alexei
 *
 * This part of code is written in C programming language.
 * Please visit http://en.wikipedia.org/wiki/C_(programming_language)
 * for more details on the language used herein.
 */


#ifndef SEQPID_H_
#define SEQPID_H_

#include "scpi/types.h"

scpi_result_t RP_SeqReset(scpi_t * context);

scpi_result_t RP_SeqAction(scpi_t * context);
scpi_result_t RP_SeqActionQ(scpi_t * context);
scpi_result_t RP_SeqActionIdle(scpi_t * context);
scpi_result_t RP_SeqActionInit(scpi_t * context);
scpi_result_t RP_SeqActionStop(scpi_t * context);
scpi_result_t RP_SeqActionRun(scpi_t * context);
scpi_result_t RP_SeqTrigInEnab(scpi_t * context);
scpi_result_t RP_SeqTrigInEnabQ(scpi_t * context);
scpi_result_t RP_SeqTrigOutEnab(scpi_t * context);
scpi_result_t RP_SeqTrigOutEnabQ(scpi_t * context);
scpi_result_t RP_SeqClkOutEnab(scpi_t * context);
scpi_result_t RP_SeqClkOutEnabQ(scpi_t * context);
scpi_result_t RP_SeqClkExtUseQ(scpi_t * context);

scpi_result_t RP_SeqInRangeLow(scpi_t * context);
scpi_result_t RP_SeqInRangeLowQ(scpi_t * context);
scpi_result_t RP_SeqRangesQ(scpi_t * context);
scpi_result_t RP_SeqPIDEnable(scpi_t * context);
scpi_result_t RP_SeqPIDEnableQ(scpi_t * context);
scpi_result_t RP_SeqTrigEnable(scpi_t * context);
scpi_result_t RP_SeqTrigEnableQ(scpi_t * context);
scpi_result_t RP_SeqPIDGainP(scpi_t * context);
scpi_result_t RP_SeqPIDGainPQ(scpi_t * context);
scpi_result_t RP_SeqPIDGainI(scpi_t * context);
scpi_result_t RP_SeqPIDGainIQ(scpi_t * context);
scpi_result_t RP_SeqPIDGainD(scpi_t * context);
scpi_result_t RP_SeqPIDGainDQ(scpi_t * context);
scpi_result_t RP_SeqPIDFreqD(scpi_t * context);
scpi_result_t RP_SeqPIDFreqDQ(scpi_t * context);
scpi_result_t RP_SeqPIDMin(scpi_t * context);
scpi_result_t RP_SeqPIDMinQ(scpi_t * context);
scpi_result_t RP_SeqPIDMax(scpi_t * context);
scpi_result_t RP_SeqPIDMaxQ(scpi_t * context);
scpi_result_t RP_SeqSyncDelay(scpi_t * context);
scpi_result_t RP_SeqSyncDelayQ(scpi_t * context);
scpi_result_t RP_SeqGenOverwriteValue(scpi_t * context);
scpi_result_t RP_SeqGenOverwriteValueQ(scpi_t * context);
scpi_result_t RP_SeqInputValueQ(scpi_t * context);
scpi_result_t RP_SeqGenOutputValueQ(scpi_t * context);
scpi_result_t RP_SeqGenRunningQ(scpi_t * context);
scpi_result_t RP_SeqGenRunGuessQ(scpi_t *context);

scpi_result_t RP_SeqStepsBySlice(scpi_t * context);
scpi_result_t RP_SeqStepsBySliceQ(scpi_t * context);
scpi_result_t RP_SeqStepsByIndex(scpi_t *context);
scpi_result_t RP_SeqStepsByIndexQ(scpi_t *context);
scpi_result_t RP_SeqElements(scpi_t *context);
scpi_result_t RP_SeqElementsBySliceQ(scpi_t *context);
scpi_result_t RP_SeqElementsByIndexQ(scpi_t *context);
scpi_result_t RP_SeqInitElements(scpi_t *context);
scpi_result_t RP_SeqListSlice0Q(scpi_t *context);
scpi_result_t RP_SeqEnforceMode(scpi_t *context);
scpi_result_t RP_SeqEnforceModeQ(scpi_t *context);

#endif /* SEQPID_H_ */

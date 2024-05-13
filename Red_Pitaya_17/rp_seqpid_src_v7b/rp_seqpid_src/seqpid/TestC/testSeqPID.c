
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
//#include "../../apiseq/src/seqpid.h"
#include "redpitaya/rpseq.h"
//#include "../../apiseq/src/seqpid.h"
//#include "../../api/src/calib.h"

int main(){
	bool isPID1on, isPID2on, clkExtUse;
	float inval1, inval2;
	float genval1, genval2;
	float gainI1, gainP1;
	float pid1min, pid1max;
	rp_Init();
	rp_Reset();
	
	uint16_t numElementsTest;
	uint16_t listSlice0Test[5];
	rp_seqGetListSlice0(RP_CH_1, &numElementsTest, listSlice0Test);
	printf("numElements=%d, listSlice0[0] = %d, listSlice0[1] = %d, listSlice0[2] = %d\n",numElementsTest,listSlice0Test[0],listSlice0Test[1], listSlice0Test[2]);
	
	rp_seqSetGenOverwriteValue(RP_CH_1, 0.3);
	rp_seqSetPIDMin(RP_CH_1, -1);
	rp_seqSetPIDMax(RP_CH_1, 1);
	rp_seqSetPIDGainP(RP_CH_1, 0.21);
	rp_seqSetPIDGainI(RP_CH_1, 0.103);
	rp_seqSetPIDGainD(RP_CH_1, 0);
	rp_seqSetPIDFreqLimD(RP_CH_1, RP_SEQ_DFLIM_2M);
	rp_seqSetPIDEnabled( RP_CH_1, false);

	rp_seqSetGenOverwriteValue(RP_CH_2, 0.2);
	rp_seqSetPIDMin(RP_CH_2, -0.8);
	rp_seqSetPIDMax(RP_CH_2, 0.8);
	rp_seqSetPIDGainP(RP_CH_2, 0.21);
	rp_seqSetPIDGainI(RP_CH_2, 0.103);
	rp_seqSetPIDGainD(RP_CH_2, 0.00);
	rp_seqSetPIDFreqLimD(RP_CH_2, RP_SEQ_DFLIM_4M);
	rp_seqSetPIDEnabled( RP_CH_2, true);

	usleep(5000);
	rp_seqGetClkExtUse( RP_CH_1, &clkExtUse);
	rp_seqGetPIDEnabled( RP_CH_1, &isPID1on);
	rp_seqGetPIDEnabled( RP_CH_2, &isPID2on);
	rp_seqGetInputValue(RP_CH_1, &inval1);
	rp_seqGetInputValue(RP_CH_2, &inval2);
	rp_seqGetPIDMin(RP_CH_1, &pid1min);
	rp_seqGetPIDMax(RP_CH_1, &pid1max);
	rp_seqGetGenOutputValue(RP_CH_1, &genval1);
	rp_seqGetGenOutputValue(RP_CH_2, &genval2);
	rp_seqGetPIDGainI(RP_CH_1, &gainI1);
	rp_seqGetPIDGainP(RP_CH_1, &gainP1);

	printf("\nExt clk: %d, PID 1 on: %d, PID 2 on: %d\n",clkExtUse,isPID1on,isPID2on);
	printf("input 1 value: %g, input 2 value: %g\n",inval1,inval2);
	printf("generator 1 value: %g, generator 2 value: %g\n",genval1,genval2);
	printf("ch1 P gain: %g, ch1 I gain: %g\n",gainP1,gainI1);
	printf("pid 1 min: %g, pid 1 max: %g\n",pid1min,pid1max);

	rp_seqSetTrigEnabled(RP_CH_1, true);
	rp_seqInitElementsCounter(RP_CH_1);
	rp_seqSetEnforceMode(RP_CH_1, RP_SEQ_ENFORCE_VS);
	rp_seqSetTrigEnabled(RP_CH_2, true);
	rp_seqInitElementsCounter(RP_CH_2);
	rp_seqSetEnforceMode(RP_CH_2, RP_SEQ_ENFORCE_VS);

	float Vstart1[4]={-0.3,0.5,-0.1,0.2};
	float Vstop1[4]={0.5,-0.1,0.2,0.2};
	double duration1[4]={1e-5,1e-5,1e-5, 2e-5};
	bool pidfreeze1_1[4]={true,true, true,true};
	bool pidfreeze1_2[4]={false,false, false,false};
	rp_seqWriteElement(RP_CH_1, 4, Vstart1, Vstop1, duration1, pidfreeze1_1);
	rp_seqWriteElement(RP_CH_2, 4, Vstart1, Vstop1, duration1, pidfreeze1_2);


	float Vstart2[5]={0,0.1,0.4,0.2,0.03};
	float Vstop2[5]={0.03,0.2,0.4,0.1,0};
	double duration2[5]={8e-9,8e-9,8e-9,8e-9,8e-7};
	bool pidfreeze2[5]={true,true,true,true,true};
	rp_seqWriteElement(RP_CH_2, 5, Vstart2, Vstop2, duration2, pidfreeze2);
	rp_seqWriteElement(RP_CH_1, 5, Vstart2, Vstop2, duration2, pidfreeze2);

	float Vstart3[2]={0.8,-0.8};
	float Vstop3[2]={-0.8,0.0};
	double duration3[2]={1e-3,1e-3};
	bool pidfreeze3_1[2]={true,true};
	bool pidfreeze3_2[2]={false,false};
	rp_seqWriteElement(RP_CH_1, 2, Vstart3, Vstop3, duration3, pidfreeze3_1);
	rp_seqWriteElement(RP_CH_2, 2, Vstart3, Vstop3, duration3, pidfreeze3_2);

	rp_seqGetListSlice0(RP_CH_1, &numElementsTest, listSlice0Test);

	uint32_t countBurst[4] = {0,0,1,0};
	uint16_t indexStep[4]={0,2,1,2};
	bool muteMode_1[4] = {true,true,true,true};
	bool muteMode_2[4] = {false,false,true,false};
	rp_seqWriteStepsByIndex(RP_CH_1, 4, countBurst, indexStep, muteMode_1);
	rp_seqWriteStepsByIndex(RP_CH_2, 4, countBurst, indexStep, muteMode_2);
	
	rp_seqSetSyncDelay(RP_CH_2, 0);
	bool running;
	rp_seqSetActionInit(RP_CH_1);
	rp_seqSetActionInit(RP_CH_2);
	rp_seqSetActionRun(RP_CH_2);
	usleep(1);
	rp_seqGetRunning(RP_CH_1, &running);
	printf("\n CH1 seq running =%d", running);

	float minIn, maxIn,  minOut, maxOut, clkFreq;
	rp_seqGetRanges(RP_CH_2, &minIn, &maxIn,  &minOut, &maxOut, &clkFreq);
	printf("\n CH2 minIn=%g, maxIn=%g, minOut=%g, maxOut=%g, clkFreq=%g\n", minIn, maxIn,  minOut, maxOut, clkFreq);
	
	
	bool  pidfreezeQ[12288];
	float VstartQ[12288];
	float VstopQ[12288];
	double durationQ[12288];
	uint16_t length;
	rp_seqReadElementBySlice(RP_CH_2, listSlice0Test[1], &length, VstartQ, VstopQ, durationQ, pidfreezeQ);
	for(int i=0; i<length;i++){
		printf("Vstart=%g, Vstop=%g, duration=%g,pidfreeze=%d\n",VstartQ[i],VstopQ[i],durationQ[i],pidfreezeQ[i]);
	}

	rp_seqReadElementByIndex(RP_CH_2, indexStep[2], &length, VstartQ, VstopQ, durationQ, pidfreezeQ);
	for(int i=0; i<length;i++){
		printf("Vstart=%g, Vstop=%g, duration=%g,pidfreeze=%d\n",VstartQ[i],VstopQ[i],durationQ[i],pidfreezeQ[i]);
	}
	uint16_t indexStepQ[10];
	uint32_t countBurstQ[10];
	bool 	 muteModeQ[10];
    uint16_t numStepsQ;

	rp_seqReadStepsByIndex(RP_CH_1, &numStepsQ, countBurstQ, indexStepQ, muteModeQ);
	for(int i=0; i<numStepsQ;i++){
		printf("indexStep=%d, countBurst=%d, muteMode=%d\n",indexStepQ[i],countBurstQ[i],muteModeQ[i]);
	}
	

	
	printf("numElements=%d, listSlice0[0] = %d, listSlice0[1] = %d, listSlice0[2] = %d\n",numElementsTest,listSlice0Test[0],listSlice0Test[1], listSlice0Test[2]);
	

	return rp_Release();
}

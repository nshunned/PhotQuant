#define _USE_MATH_DEFINES

#include <NIDAQmx.h>
#include <stdio.h>
#include <math.h>

#define DAQmxErrChk(functionCall) if ( DAQmxFailed(error=(functionCall)) ) goto Error; else

int32 DoneCallback(TaskHandle taskHandle, int32 status, void *callbackData);

// DAQmxCreateAOVoltageChan options 
const char* physicalChannel = "PXI1Slot5/ao0";
const char* nameToAssignChannel = "AO Voltage";
const float64 minVal = -10;
const float64 maxVal = 10;
const int32 units = DAQmx_Val_Volts;
const char* customScaleName = "";

// DAQmxCfgSampClkTiming options
const char* source = "OnboardClock";
const float64 rate = 1000;
const int32 activeEdge = DAQmx_Val_Rising;
const int32 sampleMode = DAQmx_Val_FiniteSamps;
const uInt64 sampsPerChanToAquire = 1000;

// wave form configuration
const double freq = 10;
const double amp = 5;

// DAQmxWriteAnalogF64 options
const bool32 autoStart = 0;
const float64 timeout = 10;
const bool32 dataLayout = DAQmx_Val_GroupByChannel;

// DAQmxWaitUntilTaskDone options
const float64 timeToWait = 10;

int main(void) {

    // task & error handling
    TaskHandle  taskHandle = 0;
    int         error = 0;
    char        errBuff[2048] = {'\0'};
    
    // save actual number of samples per channel successfully written to the buffer
    int32 sampsPerChanWritten;

    // create wave form
    float64 writeArray[sampsPerChanToAquire];
    for (int i = 0; i < sampsPerChanToAquire; i++)
        writeArray[i] = amp * sin(2.0*M_PI * freq * (double)i / rate);

    // create task
    DAQmxErrChk ( DAQmxCreateTask("TestNIDAQmxAO_Finite", &taskHandle) );

    // create channel
    DAQmxErrChk ( DAQmxCreateAOVoltageChan(taskHandle, physicalChannel, nameToAssignChannel, minVal, maxVal, units, customScaleName) );

    // set sample clock timing
    DAQmxErrChk ( DAQmxCfgSampClkTiming(taskHandle, source, rate, activeEdge, sampleMode, sampsPerChanToAquire) );

    // register callback function when task stops
    DAQmxErrChk ( DAQmxRegisterDoneEvent(taskHandle, 0, DoneCallback, NULL) );

    // write
    DAQmxErrChk ( DAQmxWriteAnalogF64(taskHandle, sampsPerChanToAquire, autoStart, timeout, dataLayout, writeArray, &sampsPerChanWritten, NULL) );

    // start task
    DAQmxErrChk ( DAQmxStartTask(taskHandle) );

    // wait
    DAQmxErrChk ( DAQmxWaitUntilTaskDone(taskHandle, timeToWait) );

    printf("Generating voltage continuously. Press Enter to interrupt\n");
	getchar();

Error:
    if ( DAQmxFailed(error) )
        DAQmxGetExtendedErrorInfo(errBuff, 2048);
    if ( taskHandle != 0 ) {
        DAQmxStopTask(taskHandle);
        DAQmxClearTask(taskHandle);
    }
    if ( DAQmxFailed(error) )
        printf("DAQmx Error: %s\n", errBuff);

    printf("End of program, press Enter key to quit\n");
    printf("Number of samples per channel written: %d\n", sampsPerChanWritten);
    getchar();
    return 0;
}

int32 DoneCallback(TaskHandle taskHandle, int32 status, void *callbackData)
{
	int32   error = 0;
	char    errBuff[2048] = {'\0'};

	// Check to see if an error stopped the task.
	DAQmxErrChk (status);

Error:
	if( DAQmxFailed(error) ) {
		DAQmxGetExtendedErrorInfo(errBuff, 2048);
		DAQmxClearTask(taskHandle);
		printf("DAQmx Error: %s\n", errBuff);
	}
	return 0;
}
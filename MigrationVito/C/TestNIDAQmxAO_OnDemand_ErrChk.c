#include <NIDAQmx.h>
#include <stdio.h>

#define DAQmxErrChk(functionCall) if ( DAQmxFailed(error=(functionCall)) ) goto Error; else

// DAQmxCreateAOVoltageChan options 
const char* physicalChannel = "PXI1Slot5/ao0";
const char* nameToAssignChannel = "AO Voltage";
const float64 minVal = -10;
const float64 maxVal = 10;
const int32 units = DAQmx_Val_Volts;
const char* customScaleName = "";

// DAQmxWriteAnalogF64 options
const int32 numSampsPerChan = 1;
const bool32 autoStart = 0;
const float64 timeout = 10;
const bool32 dataLayout = DAQmx_Val_GroupByChannel;
const float64 writeArray[1] = {5};

int main(void) {
    // task & error handling
    TaskHandle  taskHandle = 0;
    int         error = 0;
    char        errBuff[2048] = {'\0'};

    // create task
    DAQmxErrChk ( DAQmxCreateTask("TestNIDAQmxAO_OnDemand", &taskHandle) );

    // create channel
    DAQmxErrChk ( DAQmxCreateAOVoltageChan(taskHandle, physicalChannel, nameToAssignChannel, minVal, maxVal, units, customScaleName) );

    // start task
    DAQmxErrChk ( DAQmxStartTask(taskHandle));
    
    // write
    DAQmxErrChk ( DAQmxWriteAnalogF64(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, NULL, NULL) );

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
    getchar();
    return 0;
}
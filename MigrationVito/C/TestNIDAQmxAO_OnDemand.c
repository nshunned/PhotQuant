#include <NIDAQmx.h>
#include <stdio.h>
#include <time.h>

void testCode() {
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
    const float64 writeArray[1] = {7.5};
    int32 sampsPerChanWritten;

    // task
    TaskHandle  taskHandle = 0;
    DAQmxCreateTask("TestNIDAQmxAO_OnDemand", &taskHandle);
    DAQmxCreateAOVoltageChan(taskHandle, physicalChannel, nameToAssignChannel, minVal, maxVal, units, customScaleName);
    DAQmxStartTask(taskHandle);
    DAQmxWriteAnalogF64(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, &sampsPerChanWritten, NULL);

    if ( taskHandle != 0 ) {
        DAQmxStopTask(taskHandle);
        DAQmxClearTask(taskHandle);
    }
}

int main() {
    testCode();

    int number = 10000;

    clock_t startTime = clock();
    for (int i = 0; i < number; i++) {
        testCode();
    }
    double elapsedTime = (double)(clock() - startTime) / CLOCKS_PER_SEC;
    
    printf("Test code was run %d times\n", number);
    printf("Total runetime: %f seconds\n", elapsedTime);
    printf("Average run time: %f seconds\n", elapsedTime/number);

    return 0;
}
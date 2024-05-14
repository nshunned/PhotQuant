#define _USE_MATH_DEFINES

#include <NIDAQmx.h>
#include <math.h>
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

    // DAQmxCfgSampClkTiming options
    const char* source = "OnboardClock";
    const float64 rate = 3000000;
    const int32 activeEdge = DAQmx_Val_Rising;
    const int32 sampleMode = DAQmx_Val_FiniteSamps;
    const uInt64 sampsPerChanToAquire = 30000;

    // wave form configuration
    const double freq = 1000;
    const double amp = 5;

    // DAQmxWriteAnalogF64 options
    const bool32 autoStart = 0;
    const float64 timeout = 10;
    const bool32 dataLayout = DAQmx_Val_GroupByChannel;
    float64 writeArray[sampsPerChanToAquire];
    for (int i = 0; i < sampsPerChanToAquire; i++)
        writeArray[i] = amp * sin(2.0*M_PI * freq * (double)i / rate);
    int32 sampsPerChanWritten;

    // DAQmxWaitUntilTaskDone options
    const float64 timeToWait = 10;

    // task
    TaskHandle  taskHandle = 0;
    DAQmxCreateTask("TestNIDAQmxAO_Finite", &taskHandle);
    DAQmxCreateAOVoltageChan(taskHandle, physicalChannel, nameToAssignChannel, minVal, maxVal, units, customScaleName);
    DAQmxCfgSampClkTiming(taskHandle, source, rate, activeEdge, sampleMode, sampsPerChanToAquire);
    DAQmxWriteAnalogF64(taskHandle, sampsPerChanToAquire, autoStart, timeout, dataLayout, writeArray, &sampsPerChanWritten, NULL);
    DAQmxStartTask(taskHandle);
    DAQmxWaitUntilTaskDone(taskHandle, timeToWait);

    if ( taskHandle != 0 ) {
        DAQmxStopTask(taskHandle);
        DAQmxClearTask(taskHandle);
    }
}

int main() {
    testCode();

    int number = 1000;

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
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <NIDAQmx.h>

#define DAQmxErrChk(functionCall) if ( DAQmxFailed(error=(functionCall)) ) goto Error; else

int main(void) {

    // task & error handling
    TaskHandle  taskHandle = 0;
    int         error = 0;
    char        errBuff[2048] = {'\0'};

    // get names of system devices
    char dataSysDevNames[2048] = {'\0'};

    DAQmxErrChk ( DAQmxGetSysDevNames(dataSysDevNames, 2048) );
    printf("System Devices: %s\n", dataSysDevNames);

    // get names of ao physical channels
    char deviceName[] = "PXI1Slot5";
    char dataAOPhysicalChans[2048] = {'\0'};

    DAQmxErrChk ( DAQmxGetDevAOPhysicalChans(deviceName, dataAOPhysicalChans, 2048) );
    printf("Device AO Physical Channels: %s\n", dataAOPhysicalChans);

    // split names of physical channels into an array
    char** arrAOPhysicalChans = NULL;
    char* nextAOPhysicalChan = strtok(dataAOPhysicalChans, ", ");
    int numPhysicalChans = 0;

    while (nextAOPhysicalChan) {
        arrAOPhysicalChans = realloc(arrAOPhysicalChans, sizeof (char*) * (++numPhysicalChans));

        if (arrAOPhysicalChans == NULL)
            exit(-1); // memory allocation failed
        arrAOPhysicalChans[numPhysicalChans-1] = nextAOPhysicalChan;

        nextAOPhysicalChan = strtok(NULL, ", ");
    }

    arrAOPhysicalChans = realloc(arrAOPhysicalChans, sizeof (char*) * (numPhysicalChans+1));
    arrAOPhysicalChans[numPhysicalChans] = 0;

    for (int i = 0; i < numPhysicalChans; i++)
        printf("%s\n", arrAOPhysicalChans[i]);

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
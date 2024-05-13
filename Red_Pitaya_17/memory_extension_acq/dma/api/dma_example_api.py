#!/usr/bin/python3
"""Example of DMA acquisition of 1024-samples of data on both channels"""

import time
import rp


## size in samples 16Bit
DATA_SIZE = 1024          # ((1024 * 1024 * 128) / 2)        ## for 128 MB ##
READ_DATA_SIZE = 1024     # (1024 * 256)                     ## for 128 MB ##

dec = rp.RP_DEC_1
trig_lvl = 0.2

# Initialize the interface
rp.rp_Init()


### Setting up DMA ###
# Get Memory region
memoryRegion = rp.rp_AcqAxiGetMemoryRegion()
g_adc_axi_start = memoryRegion[1]
g_adc_axi_size = memoryRegion[2]
print(f"Reserved memory Start: {g_adc_axi_start:x} Size: {g_adc_axi_size:x}\n")

# Set decimation
rp.rp_AcqAxiSetDecimationFactor(dec)

# Set trigger delay for both channels
rp.rp_AcqAxiSetTriggerDelay(rp.RP_CH_1, DATA_SIZE)
rp.rp_AcqAxiSetTriggerDelay(rp.RP_CH_2, DATA_SIZE)

# Set-up the Channel 1 and channel 2 buffers to each work with half the available memory space.

rp.rp_AcqAxiSetBufferSamples(rp.RP_CH_1, g_adc_axi_start, DATA_SIZE)
rp.rp_AcqAxiSetBufferSamples(rp.RP_CH_2, int(g_adc_axi_start + int(g_adc_axi_size/2)), DATA_SIZE)

# Enable DMA on both channels
rp.rp_AcqAxiEnable(rp.RP_CH_1, True)
print("Enable CHA\n")
rp.rp_AcqAxiEnable(rp.RP_CH_2, True)
print("Enable CHB\n")

# Specify the acquisition trigger
rp.rp_AcqSetTriggerLevel(rp.RP_T_CH_1, trig_lvl)


### Acquisition ###
# Start the DMA acquisition
rp.rp_AcqStart()
print("ACQ Started\n")

# Specify trigger source
rp.rp_AcqSetTriggerSrc(rp.RP_TRIG_SRC_CHA_PE)
state = rp.RP_TRIG_STATE_TRIGGERED

# Wait for the triggering moment
while 1:
    state = rp.rp_AcqGetTriggerState()[1]
    if state == rp.RP_TRIG_STATE_TRIGGERED:
        print("Triggered")
        time.sleep(1)
        break

# Wait until both buggers are full/data is acquired
fillState = False

while not fillState:
    fillState = rp.rp_AcqAxiGetBufferFillState(rp.RP_CH_1)[1]
print("DMA buffer full")

# Stop the acquisition
rp.rp_AcqStop()
print("Stop DMA acq\n")

# Get write pointer on the triggering location
posChA = rp.rp_AcqAxiGetWritePointerAtTrig(rp.RP_CH_1)[1]
posChB = rp.rp_AcqAxiGetWritePointerAtTrig(rp.RP_CH_2)[1]


# Allocate memory for the data
buff1 = rp.i16Buffer(READ_DATA_SIZE)
buff2 = rp.i16Buffer(READ_DATA_SIZE)


# Writing data into a text file
with open("out.txt", "w", encoding="ascii") as fp:
    read_size = 0

    while read_size < DATA_SIZE:
        size1 = READ_DATA_SIZE
        size2 = READ_DATA_SIZE
        rp.rp_AcqAxiGetDataRaw(rp.RP_CH_1, posChA, size1, buff1.cast())
        rp.rp_AcqAxiGetDataRaw(rp.RP_CH_2, posChB, size2, buff2.cast())
        for i in range(0, READ_DATA_SIZE):
            fp.write(f"{i+1:6d}:  {buff1[i]:6d}\t{buff2[i]:6d}\n")

        posChA += size1
        posChB += size2
        read_size += READ_DATA_SIZE
        print(f"Saved data size {read_size}\n")


### Releasing resources ###
print("\nReleasing resources\n")
rp.rp_AcqAxiEnable(rp.RP_CH_1, False)
rp.rp_AcqAxiEnable(rp.RP_CH_2, False)

rp.rp_Release()
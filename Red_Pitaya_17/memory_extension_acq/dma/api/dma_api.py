#!/usr/bin/python3
from math import *

import time
import rp

import numpy as np



### CONFIGURATION ###

BITS_PER_SAMPLE = 32
SAMPLE_RATE = 125e6

maxMemBytes = int(16**5 * 2)
maxNumMemSamples = int(maxMemBytes * 8 / BITS_PER_SAMPLE)
print('Per channel:')
print('Max memory allocated  = {:>8} = 16^{:<2} bytes'.format(maxMemBytes, log2(maxMemBytes)/log2(16)))
print('Max number of samples = {:>8} =  2^{:<2}'.format(maxNumMemSamples, log2(maxNumMemSamples)))

signalPeriod = maxNumMemSamples / SAMPLE_RATE
signalFrequency = 1 / signalPeriod
print('Singal period   = {:>10.5f} μs'.format(signalPeriod * 1e6))
print('Signal frequncy = {:>10.5f} Hz'.format(signalFrequency))

## number of samples to write/read
DATA_SIZE = maxNumMemSamples
READ_DATA_SIZE = maxNumMemSamples

## units
units = 'RAW'
# units = 'VOLTS'

## decimation
dec = rp.RP_DEC_1

## trigger
trig_lvl = 0
trig_src = rp.RP_TRIG_SRC_CHA_PE
# trig_src = rp.RP_TRIG_SRC_CHB_PE



### INITIALIZE THE INTERFACE ###
rp.rp_Init()



### DMA SETUP ###

# get memory region
memoryRegion = rp.rp_AcqAxiGetMemoryRegion()

size = memoryRegion[2]
start_address_a = memoryRegion[1]
start_address_b = int(start_address_a + int(size/2))

print(f'Reserved memory >> Start: {start_address_a:x} Size: {size:x}\n')

# set decimation
rp.rp_AcqAxiSetDecimationFactor(dec)

# set trigger delay for both channels
rp.rp_AcqAxiSetTriggerDelay(rp.RP_CH_1, DATA_SIZE)
rp.rp_AcqAxiSetTriggerDelay(rp.RP_CH_2, DATA_SIZE)

# set DMA buffer address and size in samples
rp.rp_AcqAxiSetBufferSamples(rp.RP_CH_1, start_address_a, DATA_SIZE)
rp.rp_AcqAxiSetBufferSamples(rp.RP_CH_2, start_address_b, DATA_SIZE)

# enable DMA
rp.rp_AcqAxiEnable(rp.RP_CH_1, True)
rp.rp_AcqAxiEnable(rp.RP_CH_2, True)
print('Channel A and Channel B are enabled\n')

# set acquisition trigger
rp.rp_AcqSetTriggerLevel(rp.RP_T_CH_1, trig_lvl)
rp.rp_AcqSetTriggerLevel(rp.RP_T_CH_2, trig_lvl)



### ACQUISITION ###

rp.rp_AcqStart()
print('Acquisition started\n')

# set trigger source
rp.rp_AcqSetTriggerSrc(trig_src)

# wait for trigger
while 1:
    state = rp.rp_AcqGetTriggerState()[1]
    if state == rp.RP_TRIG_STATE_TRIGGERED:     # 'rp.RP_TRIG_STATE_TRIGGERED' or 'rp.RP_TRIG_STATE_WAITING'
        print('Triggered\n')
        time.sleep(1)
        break

# wait until adc buffer is filled
while 1:
    fillState1 = rp.rp_AcqAxiGetBufferFillState(rp.RP_CH_1)[1]
    fillState2 = rp.rp_AcqAxiGetBufferFillState(rp.RP_CH_2)[1]

    if fillState1 or fillState2:
        if fillState1:
            print('DMA buffer 1 full\n')
        if fillState2:
            print('DMA buffer 2 full\n')
        break;

# stop acquisition
rp.rp_AcqStop()
print('Acquisition stopped\n')



### GET WRITE POINTERS ###

posChA = rp.rp_AcqAxiGetWritePointerAtTrig(rp.RP_CH_1)[1]
posChB = rp.rp_AcqAxiGetWritePointerAtTrig(rp.RP_CH_2)[1]

# allocate memory for the data
if units == 'RAW':
    buff1 = rp.i16Buffer(READ_DATA_SIZE)
    buff2 = rp.i16Buffer(READ_DATA_SIZE)
else:
    buff1 = rp.fBuffer(READ_DATA_SIZE)
    buff2 = rp.fBuffer(READ_DATA_SIZE)

# write data into .npy binary files
read_size = 0
signal_num_a = []
signal_num_b = []

while read_size < DATA_SIZE:
    size1 = READ_DATA_SIZE
    size2 = READ_DATA_SIZE

    if units == 'RAW':
        units_data_type = int
        rp.rp_AcqAxiGetDataRaw(rp.RP_CH_1, posChA, size1, buff1.cast())
        rp.rp_AcqAxiGetDataRaw(rp.RP_CH_2, posChB, size2, buff2.cast())
    else:
        units_data_type = float
        rp.rp_AcqAxiGetDataV(rp.RP_CH_1, posChA, size1, buff1.cast())
        rp.rp_AcqAxiGetDataV(rp.RP_CH_2, posChB, size2, buff2.cast())
    
    for i in range(0, READ_DATA_SIZE):
        signal_num_a.append(buff1[i])
        signal_num_b.append(buff2[i])

    signal_num_a = list(map(units_data_type, signal_num_a))
    signal_num_b = list(map(units_data_type, signal_num_b))

    posChA += size1
    posChB += size2
    read_size += READ_DATA_SIZE
    print(f'Saved data size {read_size}\n')

signal_num_a = np.array(signal_num_a)
signal_num_b = np.array(signal_num_b)



## SAVE DATA
trig_src = 'CH1_PE' if (trig_src == rp.RP_TRIG_SRC_CHA_PE) else 'CH2_PE'

dataFileName = f'{int(signalFrequency)}Hz_{READ_DATA_SIZE}_{int(SAMPLE_RATE/1e6)}MHz_{trig_src}_{units.lower()}'

np.save(f'{dataFileName}_chA.npy', signal_num_a)
np.save(f'{dataFileName}_chB.npy', signal_num_b)


### RELEASE RESOURCES & SEVER CONNECTION ###

rp.rp_AcqAxiEnable(rp.RP_CH_1, False)
rp.rp_AcqAxiEnable(rp.RP_CH_2, False)
rp.rp_Release()
print('Resources released\n')
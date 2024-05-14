import timeit

setup = '''
import nidaqmx
import numpy as np

# add_ao_voltage_chan options
physical_channel = "PXI1Slot5/ao0"
name_to_assign_to_channel = "AO Voltage"
min_val = -10
max_val = 10
units = nidaqmx.constants.VoltageUnits.VOLTS

# cfg_samp_clk_timing options
rate = 10000
source = "OnboardClock"
active_edge = nidaqmx.constants.Edge.RISING
sample_mode = nidaqmx.constants.AcquisitionType.FINITE
samps_per_chan = 100

# wave form configuration
freq = 1000
amp = 5
times = np.linspace(0, samps_per_chan / rate, samps_per_chan)

# write options
data = amp * np.sin(2*np.pi * freq * times)
auto_start = False
timeout = 10.0
'''

stmt = '''
# create task
with nidaqmx.Task('TestNIDAQmxAO_Finite') as task:
    task.ao_channels.add_ao_voltage_chan(physical_channel, name_to_assign_to_channel, min_val, max_val, units)
    task.timing.cfg_samp_clk_timing(rate, source, active_edge, sample_mode, samps_per_chan)
    task.write(data, auto_start, timeout)
    task.start()
    task.wait_until_done(timeout)
    task.stop()
'''

number = 1000

time = timeit.timeit(stmt, setup, number=number) 

print("Your code was run", number, "times")
print("Total run time:", time, "seconds")
print("Average runtime:", time/number, "seconds")
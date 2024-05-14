import timeit

setup = '''
import nidaqmx

# add_ao_voltage_chan options
physical_channel = "PXI1Slot5/ao0"
name_to_assign_to_channel = "AO Voltage"
min_val = -10
max_val = 10
units = nidaqmx.constants.VoltageUnits.VOLTS

# write options
data = 7.5
auto_start = False
timeout = 10.0
'''

stmt = '''
# create task
with nidaqmx.Task('TestNIDAQmxAO_OnDemand') as task:
    task.ao_channels.add_ao_voltage_chan(physical_channel, name_to_assign_to_channel, min_val, max_val, units)
    task.start()
    task.write(data, auto_start, timeout)
    task.stop()
'''

number = 5000

elapsedTime = timeit.timeit(stmt, setup, number=number)

print("Test code was run", number, "times")
print("Total run time:", elapsedTime, "seconds")
print("Average runtime:", elapsedTime/number, "seconds")
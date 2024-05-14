import nidaqmx
import numpy as np
import matplotlib.pyplot as plt
from nidaqmx.stream_writers import AnalogSingleChannelWriter

# helper functions
def getIntInput(message, errorMessage):
    while(True):
        try:
            i = int(input(message).strip())
            return i
        except ValueError:
            print(errorMessage)

def getIntInputMinMax(min, max, message, errorMessage):
    while(True):
        try:
            i = int(input(message).strip())
            if ((min is None and i <= max) or (i >= min and max is None)  or (i >= min and i <= max)):
                return i
            print(errorMessage)
        except ValueError:
            print(errorMessage)

def getFloatInputMinMax(min, max, message, errorMessage):
    while(True):
        try:
            i = float(input(message).strip())
            if ((min is None and i <= max) or (i >= min and max is None)  or (i >= min and i <= max)):
                return round(i, 2)
            print(errorMessage)
        except ValueError:
            print(errorMessage)

###################################

# create channel task
with nidaqmx.Task('TestNIDAQmxAO_Finite') as task:    
    # get device
    device = nidaqmx.system.Device('PXI1Slot5')

    # get all channels
    ao_phys_chans = device.ao_physical_chans

    print('\nAvailable physical channels: ')
    for i, ao_phys_chan in enumerate(ao_phys_chans):
        print(i, '-', ao_phys_chan.name)
    print()
    
    # channel settings
    i_phys_chan = getIntInputMinMax(0, len(ao_phys_chans)-1, 'Select a physical channel: ', 'Invalid selection.')    
    min_val = getIntInput('Enter a min voltage: ', 'Invalid input.')
    max_val = getIntInput('Enter a max voltage: ', 'Invalid input.')
    
    # set channel settings
    ao_phys_chan_name = ao_phys_chans[i_phys_chan].name
    task.ao_channels.add_ao_voltage_chan(ao_phys_chan_name, 'AO Voltage', min_val, max_val)
    
    # timing settings
    rate = getIntInputMinMax(1, None, 'Enter a sample rate (positive integer): ', 'Invalid input.')
    samps_per_chan = getIntInputMinMax(1, None, 'Enter number of samples per channel (positive integer): ', 'Invalid input.')
    stop_time = samps_per_chan / rate
    
    # set sample timing settings
    task.timing.cfg_samp_clk_timing(rate, samps_per_chan=samps_per_chan)
    
    # wave form settings
    freq = getFloatInputMinMax(0, None, 'Enter output wave frequency (Hz): ', 'Invalid input.')
    amp = getFloatInputMinMax(0, None, f'Enter output wave voltage amplitude (between {min_val} to {max_val}) for channel {ao_phys_chan_name}: ', 'Invalid input.')
    
    # create wave form array
    times = np.linspace(0, stop_time, samps_per_chan)
    wave = amp * np.sin(2*np.pi * freq * times)

    # plot wave form
    plt.plot(times, wave, 'r.')
        
    try:
        # writer
        writer = AnalogSingleChannelWriter(task.out_stream)
        writer.write_many_sample(wave)
    
        # start task
        task.start()
        print('\nTask has started. Press Ctrl+C to stop.')

    except KeyboardInterrupt:
        pass
    except nidaqmx.DaqError as e:
        print('\n[ERROR] :', e, '\n')
    
    task.wait_until_done()
    
    task.stop()
    
print('Task is stopped and closed.')

# show wave form plot
plt.show()

import nidaqmx

# helper functions
def getIntInput(message, errorMessage):
    while(True):
        try:
            i = int(input(message).strip())
            return i
        except ValueError:
            print(errorMessage)

def getIntInputMinMax(min, max, message):
    while(True):
        try:
            i = int(input(message).strip())
            if ((min is None and i <= max) or (i >= min and max is None)  or (i >= min and i <= max)):
                return i
            print('Invalid input.')
        except ValueError:
            print('Invalid input.')

###################################

# create channel task
with nidaqmx.Task('TestNIDAQmxAO_OnDemand') as task:
    # get device
    device = nidaqmx.system.Device('PXI1Slot5')
    
    # get all channels
    ao_phys_chans = device.ao_physical_chans

    print('\nAvailable physical channels: ')
    for i, ao_phys_chan in enumerate(ao_phys_chans):
        print(i, '-', ao_phys_chan.name)
    
    # channel settings
    i_phys_chan = getIntInputMinMax(0, len(ao_phys_chans)-1, 'Select a physical channel: ')    
    min_val = getIntInput('Enter a min voltage: ', 'Invalid input.')
    max_val = getIntInput('Enter a max voltage: ', 'Invalid input.')
    
    # set channel settings
    ao_phys_chan_name = ao_phys_chans[i_phys_chan].name
    task.ao_channels.add_ao_voltage_chan(ao_phys_chan_name, 'AO Voltage', min_val, max_val)
    
    try:
        # start task
        task.start()
        print('\nTask has started. Press Ctrl+C to stop.')

        while True:
            v = input(f'Enter an output voltage (between {min_val} to {max_val}) for channel {ao_phys_chan_name}: ')
            v = v.strip()
            try:
                v = float(v)
                if (v >= min_val and v <= max_val):
                    task.write(v)
                else:
                    print('The voltage you entered is out of range.')
            except ValueError:
                print('Invalid input.')      
    except KeyboardInterrupt:
        pass
    except nidaqmx.DaqError as e:
        print('\n[ERROR] :', e, '\n')
    
    task.stop()

print('Task is stopped and closed.')







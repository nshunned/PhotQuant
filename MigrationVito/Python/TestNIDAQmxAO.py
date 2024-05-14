import nidaqmx

with nidaqmx.Task() as task:
    # channel settings
    physical_channel = 'PXI1Slot5/ao0'
    name_to_assign_to_channel = 'AO Voltage'
    min_val = -10
    max_val = 10
    
    task.ao_channels.add_ao_voltage_chan(physical_channel, name_to_assign_to_channel, min_val, max_val)
    
    # start task
    task.start()
    
    try:
        v_out = 4
        task.write(v_out)
        
        
        
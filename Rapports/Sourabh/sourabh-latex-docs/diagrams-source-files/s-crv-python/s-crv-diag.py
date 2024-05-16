import numpy as np
import matplotlib.pyplot as plt

# Define time vector from 0 to 2^23 with 1 second increments
t = np.arange(0, 2**23 + 1, 1)

# Define jerk constant
jerk_constant = 3.947218709 * 10**-16

# Define jerk profile
jerk = np.zeros_like(t, dtype=float)
jerk[t < 2**20] = jerk_constant
jerk[(t >= 2**20) & (t < 2**21)] = -jerk_constant
jerk[(t >= 6*2**20) & (t < 7*2**20)] = -jerk_constant
jerk[(t >= 7*2**20) & (t < 2**23)] = jerk_constant

# Calculate acceleration using the cumulative sum of jerk
acceleration = np.cumsum(jerk)

# Calculate velocity using the cumulative sum of acceleration
velocity = np.cumsum(acceleration)

# Calculate position using the cumulative sum of velocity
position = np.cumsum(velocity)

# Define font size
label_font_size = 16
title_font_size = 18

# Define the downsample rate
downsample_rate = 1000

# Load data from csv file
data = np.loadtxt('/Users/sourabh/Library/Mobile Documents/com~apple~CloudDocs/Universite PSL/College-de-France---Internship/code/s-crv-python/NewFile2.csv', delimiter=',', skiprows = 2, usecols= (0,1))

# Separate the data into time and amplitude for clarity
# assuming that the first column is time and the second column is amplitude
osc_time = data[:,0]
osc_amplitude = data[:,1]

# Create the figure and axis objects
fig, axs = plt.subplots(nrows=1, ncols=2, figsize=(20, 10))

# Plot position, velocity, acceleration, and jerk
axs[0].plot(t[::downsample_rate], position[::downsample_rate], label=r'Position (m)')
axs[0].plot(t[::downsample_rate], velocity[::downsample_rate] * 10e5, label=r'Velocity $\times 10^{5}$ (m/s)')
axs[0].plot(t[::downsample_rate], acceleration[::downsample_rate] * 10e11, label=r'Acceleration $\times 10^{11}$ (m/s$^2$)')
axs[0].plot(t[::downsample_rate], jerk[::downsample_rate] * 10e17, label=r'Jerk $\times 10^{16}$ (m/s$^3$)')

axs[0].grid(lw=0.5,ls='--')

# Add the legend with adjusted font size
axs[0].legend(loc='best', fontsize=label_font_size)

# Add a title with adjusted font size
axs[0].set_title('Python Simulation', fontsize=title_font_size)

# Plot the data
axs[1].plot(osc_time, osc_amplitude,'.', markersize = 1)

axs[1].set_title('Oscilloscope Data', fontsize=title_font_size)

axs[1].grid(lw=0.5,ls='--')

# Add common labels
fig.text(0.5, 0.04, 'Time', ha='center', va='center', fontsize=label_font_size)
fig.text(0.04, 0.5, 'Position', ha='center', va='center', rotation='vertical', fontsize=label_font_size)

plt.show()

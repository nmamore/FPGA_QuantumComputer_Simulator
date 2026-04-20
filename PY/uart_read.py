import serial
import time
import struct
import matplotlib.pyplot as plt
import numpy as np

#Access serial port
ser = serial.Serial(
    port='COM3',
    baudrate=1000000,
    bytesize=8,
    parity='N',
    stopbits=1,
    timeout=2,
)

#Commands used by FPGA
READ_CMD = 153
WRITE_CMD = 102
STREAM_CMD = 165
STOP_CMD = 90

#Register values
REV_REG = 0
STATUS_REG = 4
CONTROL_REG = 8
RESULT_REG = 12

#Number of measurements to take
shots = 10000

#Function to read FPGA register
def read_reg(ser, reg):
    cmd = struct.pack("B", READ_CMD) #Packs read command as byte
    reg_bytes = struct.pack("<I",reg) #Packs register LSB first
    ser.write(cmd + reg_bytes) #Sends command
    ser.flush() #Ensures serial port is done
    
    response = ser.read(4) #Grabs read register data
    if len(response) != 4: #Error if not all bytes recieved
        return None
    return struct.unpack("<I", response)[0]

#Function to write to FPGA register
def write_reg(ser, reg, data):
    cmd = struct.pack("B", WRITE_CMD) #Packs read command as byte
    reg_bytes = struct.pack("<I",reg) #Packs register LSB first
    data_bytes = struct.pack("<I", data) #Packs data LSB first
    ser.write(cmd + reg_bytes + data_bytes) #Sends command
    ser.flush() #Ensures serial port is done

#Function to start streaming data
def stream(ser):
    cmd = struct.pack("B", STREAM_CMD) #Packs stream command as byte
    ser.write(cmd) #Sends data
    ser.flush() #Ensures serial port is done

#Function to stop streaming data
def stop(ser):
    cmd = struct.pack("B", STOP_CMD) #Packs stop command as byte
    ser.write(cmd) #Sends data
    ser.flush() #Ensures serial port is done

print(ser.name)
write_reg(ser, CONTROL_REG, 1) #Reset FPGA
write_reg(ser, CONTROL_REG, 4) #Load state vector

#Wait for data to stabilize
while True:
    status = read_reg(ser, STATUS_REG)
    if status & 1:
        break
    time.sleep(0.001)

stream(ser) #Start streaming

#Grab data and store in array
reads = []
for n in range (shots):
    resp = ser.read(4)
    value = struct.unpack("<I", resp)[0]
    reads.append(value)

write_reg(ser, CONTROL_REG, 0) #Stop operations
stop(ser) #Stop stream

ser.close() #Close serial port

#Grab array and prep for histogram
reads_np = np.array(reads)
reads_np = np.clip(reads_np, 0, 7)

#Gather histogram data
values, counts = np.unique(reads_np, return_counts=True)

#Plot histogram
plt.figure(figsize=(8, 5))
bars = plt.bar(values, counts, color='steelblue', edgecolor='black', width=0.8)

# Add count label above each bar
for i, (v, c) in enumerate(zip(values, counts)):
    plt.text(v, c + 0.1, str(c), ha='center', va='bottom', fontsize=10)

#Display histogram and information
plt.title(f"Result register values (0–7) over {shots} shots")
plt.xlabel("Register value (0–7)")
plt.ylabel("Count")
plt.xticks(np.arange(0, 8))
plt.grid(True, alpha=0.3)
plt.show()
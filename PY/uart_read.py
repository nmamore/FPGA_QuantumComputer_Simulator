import serial
import time
import struct
import matplotlib.pyplot as plt
import numpy as np

ser = serial.Serial(
    port='COM3',
    baudrate=1000000,
    bytesize=8,
    parity='N',
    stopbits=1,
    timeout=2,
)

READ_CMD = 153
WRITE_CMD = 102
STREAM_CMD = 165
STOP_CMD = 90

REV_REG = 0
STATUS_REG = 4
CONTROL_REG = 8
RESULT_REG = 12

shots = 10000

def read_reg(ser, reg):
    cmd = struct.pack("B", READ_CMD)
    reg_bytes = struct.pack("<I",reg)
    ser.write(cmd + reg_bytes)
    ser.flush()

def write_reg(ser, reg, data):
    cmd = struct.pack("B", WRITE_CMD)
    reg_bytes = struct.pack("<I",reg)
    data_bytes = struct.pack("<I", data)
    ser.write(cmd + reg_bytes + data_bytes)
    ser.flush()

def stream(ser):
    cmd = struct.pack("B", STREAM_CMD)
    ser.write(cmd)
    ser.flush()

def stop(ser):
    cmd = struct.pack("B", STOP_CMD)
    ser.write(cmd)
    ser.flush()

print(ser.name)
write_reg(ser, CONTROL_REG, 1)
stream(ser)

reads = []
for n in range (shots):
    resp = ser.read(4)
    if len (resp) == 4:
        value = struct.unpack("<I", resp)[0]
        reads.append(value)
        print(f"Shot {n} 0x{value:08x}")
    else:
        print(f"Shot {n}: short read ({len(resp)} bytes)")
        

write_reg(ser, CONTROL_REG, 0)
stop(ser)

ser.close()

reads_np = np.array(reads)
reads_np = np.clip(reads_np, 0, 7)

values, counts = np.unique(reads_np, return_counts=True)

plt.figure(figsize=(8, 5))
bars = plt.bar(values, counts, color='steelblue', edgecolor='black', width=0.8)

# Add count label above each bar
for i, (v, c) in enumerate(zip(values, counts)):
    plt.text(v, c + 0.1, str(c), ha='center', va='bottom', fontsize=10)

plt.title("Result register values (0–7) over 32 shots")
plt.xlabel("Register value (0–7)")
plt.ylabel("Count")
plt.xticks(np.arange(0, 8))
plt.grid(True, alpha=0.3)
plt.show()
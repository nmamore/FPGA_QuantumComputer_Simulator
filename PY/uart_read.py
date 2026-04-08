import serial
import time

ser = serial.Serial(
    port='COM3',
    baudrate=1000000,
    bytesize=8,
    parity='N',
    stopbits=1,
    timeout=2,
)

print(ser.name)
ser.write(b'\x99')
ser.write(b'\x00')
ser.write(b'\x00')
ser.write(b'\x00')
ser.write(b'\x00')

read = ser.read(4)

ser.close()

print(read)
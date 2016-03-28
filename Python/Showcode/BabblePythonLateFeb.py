# a program to interpret sensor data from charlie and pass it on to SC

# import random
from time import sleep

import OSC
import serial
import re

# scaling tool (no longer needed)
# from numpy import interp

# setup OSC communication
c = OSC.OSCClient()
c.connect(('127.0.0.1', 57120))
oscmsg = OSC.OSCMessage()

# setup serial communication
# port = input('port: ')
# baudrate = input('baudrate: ')
# ser = serial.Serial(port, baudrate)

# for testing
ser = serial.Serial('/dev/ttyACM0', 115200)

# regex string formatting pattern to check if serial has read correctly
pattern = re.compile("^msg=")

sleep(1)

i = 0
counter = 32

while True:

    q = 0
    # a while statement to make sure only proper lines of data are parsed
    while q == 0:
        check = ser.readline()
        matched = pattern.match(check)
        if matched:
            result = check.split(" ")
            q = 1
        else:
            print '_dropped_'

    # this all needs to be looked up now otherwise we will have errors later
    oscmsg = OSC.OSCMessage()
    oscmsg.setAddress("/x")
    oscmsg.append(int(result[1]))
    c.send(oscmsg)

    oscmsg = OSC.OSCMessage()
    oscmsg.setAddress("/y")
    oscmsg.append(int(result[2]))
    c.send(oscmsg)

    oscmsg = OSC.OSCMessage()
    oscmsg.setAddress("/z")
    oscmsg.append(int(result[3]))
    c.send(oscmsg)

    oscmsg = OSC.OSCMessage()
    oscmsg.setAddress("/x1")
    oscmsg.append(int(result[4]))
    c.send(oscmsg)

    oscmsg = OSC.OSCMessage()
    oscmsg.setAddress("/y1")
    oscmsg.append(int(result[5]))
    c.send(oscmsg)

    oscmsg = OSC.OSCMessage()
    oscmsg.setAddress("/z1")
    oscmsg.append(int(result[6]))
    c.send(oscmsg)


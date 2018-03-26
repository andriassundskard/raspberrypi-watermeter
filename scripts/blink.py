#!/usr/bin/env python

import RPi.GPIO as GPIO
import time

def setup():
    GPIO.setmode(GPIO.BCM)
    GPIO.setwarnings(False)
    GPIO.setup(23,GPIO.OUT)

def blink():
    while True:
        GPIO.output(23,GPIO.HIGH)
        time.sleep(0.5)
        GPIO.output(23,GPIO.LOW)
        time.sleep(0.5)

setup()
try:
    blink()
except KeyboardInterrupt:
    GPIO.output(23,GPIO.LOW)
    exit()

#!/usr/bin/env python

import RPi.GPIO as GPIO

def setup():
    GPIO.setmode(GPIO.BCM)
    GPIO.setwarnings(False)
    GPIO.setup(23,GPIO.OUT)

setup()
print "LED off"
GPIO.output(23,GPIO.LOW)

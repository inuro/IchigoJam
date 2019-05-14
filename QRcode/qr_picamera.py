#!/usr/bin/python
# -*- coding: utf-8 -*-

# based on https://github.com/Momijinn/scanner_QRCode/blob/master/scanner_QRCode_picamera.py
#

import time
import picamera
import io
import serial

import cv2
import numpy as np
import zbar
import PIL.Image

#initialize serial port
ser = serial.Serial('/dev/serial0',115200)

#initialize camera
camera = picamera.PiCamera()
camera.resolution = (800, 800)
time.sleep(2)
stream = io.BytesIO()

#initialize QR_Code
scanner = zbar.ImageScanner()
scanner.parse_config('enable')

for foo in camera.capture_continuous(stream, "jpeg", use_video_port=True):
    #picamera
    stream.seek(0)
    frame = stream.getvalue() #get 1frame
    stream.seek(0)
    stream.truncate()

    #chagne openCV
    data = np.fromstring(frame, dtype=np.uint8)
    img = cv2.imdecode(data, 1)

    #grayscale
    img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    #Binarization
    tresh = 100
    max_pixel = 255
    ret, img = cv2.threshold(img, tresh, max_pixel, cv2.THRESH_BINARY)

    #picture change PIL
    pil_img = PIL.Image.fromarray(img)
    width, height = pil_img.size
    raw = pil_img.tobytes()
    image = zbar.Image(width, height, 'Y800', raw)

    #result
    scanner.scan(image)
    for symbol in image:
        print('detected')
        #clear IchigoJam 
        ser.write('cls\nnew\n'.encode())
        ser.flush()
        time.sleep(0.5)
        #send data
        data=symbol.data.decode('utf-8').encode('shift_jis','ignore')
        print(symbol.data)	
        #ser.write(data.decode('utf-8').encode('shift_jis','ignore'))
        for c in data:
            ser.write(c)
            time.sleep(0.02)
        ser.flush()
        time.sleep(0.1)
        ser.write('\n'.encode())
        time.sleep(0.1)
        ser.write('run\n'.encode())
        ser.flush()

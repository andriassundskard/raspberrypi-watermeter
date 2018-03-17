# Graph your water usage

Using RaspberryPi to graph detailed water usage

## Hardware

* Raspberry Pi Zero W  
* Official Raspberry Pi Power Adapter 5V 2.5A  
* Raspberry Pi Camera Board v2.1  
* [ZeroView](https://thepihut.com/products/zeroview)  
* 16GB Micro SD  

## Software

[Raspian](https://www.raspbian.org/)  
[nginx](https://nginx.org/en/)  
[ImageMagick](https://www.imagemagick.org/)  
[tesseract-ocr](https://github.com/tesseract-ocr/)  
[RRDtool](https://oss.oetiker.ch/rrdtool/)  

## Installation

Follow https://www.raspberrypi.org/documentation/installation/ for installation of Raspian.  

Install the needed software by typing the following in a terminal window.  
```bash
sudo su -
apt-get update
apt-get install nginx imagemagick tesseract-ocr rrdtool
```

## Configuration

### Raspian

Configure RaspberryPi with camera support. You migth also want to enable SSH in order to get easy access to it later.  

### RRDtool

Configure RRD database that expects values between 0 and 1000 every minute.  

```bash
rrdtool create water.rrd \
    --start now-1d \
    --step 1m \
    DS:usage:GAUGE:5m:0:1000 \
    RRA:AVERAGE:0.5:1m:90d \
    RRA:AVERAGE:0.5:1h:18M \
    RRA:AVERAGE:0.5:1d:10y \
```

## Running

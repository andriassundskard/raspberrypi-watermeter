#!/usr/bin/env bash

# Get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Working directory is $DIR"

# Take picture
echo "Taking picture"
$DIR/on.py
raspistill -o $DIR/water.jpg --nopreview --exposure auto --timeout 1
$DIR/off.py
sudo cp $DIR/water.jpg /var/www/html/debug/

# Optimize image
echo "Optimizing image"
convert $DIR/water.jpg \
	-crop 1000x200+1660+1080 +repage \
	-normalize \
	-threshold 55% \
	-fill skyblue -stroke none \
	-draw "rectangle 0,0 1000,35" \
	-draw "rectangle 0,160 1000,200" \
	-draw "rectangle 108,0 161,200" \
	-draw "rectangle 237,0 288,200" \
	-draw "rectangle 362,0 413,200" \
	-draw "rectangle 487,0 538,200" \
	-draw "rectangle 607,0 658,200" \
	-draw "rectangle 727,0 778,200" \
	-draw "rectangle 847,0 903,200" \
	-draw "rectangle 972,0 1000,200" \
	$DIR/water_edited.jpg
sudo cp $DIR/water_edited.jpg /var/www/html/debug/

# Do OCR
#echo "OCR scanning"
#convert $DIR/water_edited.jpg -density 300 -depth 8 -strip -background white -alpha off $DIR/water_edited.tiff
#tesseract $DIR/water_edited.tiff stdout digits

# Clean
echo "Cleaning"
rm -f $DIR/water.jpg
rm -f $DIR/water_edited.jpg
rm -f $DIR/water_edited.tiff


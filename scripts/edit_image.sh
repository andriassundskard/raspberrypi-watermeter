#!/usr/bin/env bash
convert water.jpg \
	-colorspace gray \
	-rotate -2 \
	-crop 2630x600+700+1200 +repage \
	-normalize \
	-brightness-contrast 30x10 \
	-fuzz 10% -fill white -opaque gray \
	-resize 1000x1000 \
	water_edited.jpg
#convert water_edited.jpg -density 300 -depth 8 -strip -background white -alpha off water_edited.tiff
#tesseract water_edited.tiff stdout digits
sudo cp water_edited.jpg /var/www/html/debug/

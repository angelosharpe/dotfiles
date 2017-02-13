#!/bin/bash
IMAGE=/tmp/i3lock.png

scrot $IMAGE

## V1 - blur
#BLURTYPE="0x8"
#convert $IMAGE -blur $BLURTYPE $IMAGE

# v2
convert $IMAGE -scale 10% -scale 1000% $IMAGE
[[ -f $1 ]] && convert $IMAGE $1 -gravity center -composite -matte $IMAGE

i3lock -i $IMAGE
rm $IMAGE

return 1

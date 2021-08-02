#!/bin/bash

#This script will need user added varables to resize and reposition the mplayer screen

echo "Example usage:"
echo "./debug_screen_size.sh -i 102760454 -w 300 -h 500 -x 500 -y 10"

while getopts i:w:h:x:y: option
do
case "${option}"
in
i) DEVICEID=${OPTARG};;
w) width=${OPTARG};;
h) height=${OPTARG};;
x) xaxis=${OPTARG};;
y) yaxis=${OPTARG};;
esac
done

#will be used to auto find the mplayer instance
#DEVICEID=`xdotool search --onlyvisible --name mplayer`

#hardcoded mplayer instance (DEVICEID)
#DEVICEID=104857606 #change this


#This will set the window position
xdotool windowsize $DEVICEID $width $height

#This will set the window resolution
xdotool windowmove $DEVICEID $xaxis $yaxis

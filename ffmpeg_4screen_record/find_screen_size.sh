#!/bin/bash
#This script will display the geometry and and position of a window in real time, this ill help -
#to find the hardcoded variables needed for placing streams on each corner of the stream
 

while :
do
	xdotool getwindowfocus getwindowgeometry | head -3
	sleep 0.3
	clear
done

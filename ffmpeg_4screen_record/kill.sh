#!/bin/bash
#kills all the processes from the mainscript and removes the files that weren't moved


x=1
while [ $x -le 10 ]
do	
	#variables
	GNOME_TERMS=`xdotool search  -class gnome-terminal | head -1 | tail -1`
	#TERMS=`xdotool search  -class terminal | head -1 | tail -1`
	MPLAYER=`xdotool search  -class MPlayer | head -1 | tail -1`
	
	#kills the processes sequentially
	xdotool windowkill $GNOME_TERMS
	#xdotool windowkill $TERMS
	xdotool windowkill $MPLAYER
	
	rm *.mp4
	rm *.txt
	
	x=$(( $x + 1 ))	
done

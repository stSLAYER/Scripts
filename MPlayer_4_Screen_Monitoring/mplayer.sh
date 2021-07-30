#!/bin/bash

#This script will hardcode the device id and screen size/placemnt.

#note, add a feature to autorun the 'find id' command then input them as the device ID is always changing

#test stream:
#mplayer rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov

###################################################

#	Variables | CHANGE THESE	#

###################################################

#	Camera ID	#
#Use this command to find the camera ID 
#xdotool search --onlyvisible --name mplayer

CAMERA1ID=125829126
CAMERA2ID=123731974
CAMERA3ID=130023430
CAMERA4ID=127926278

#	Camera 1 resolution and position	#
#USE THE SCRIPT ./debug_screen_size.sh to play around with different resolutions before inputting them here

CAMERA1W=350	#width
CAMERA1H=350	#height
CAMERA1X=300	#X-axis
CAMERA1Y=0	#Y-axis

#	Camera 2 resolution and position	#

CAMERA2W=350	#width
CAMERA2H=350	#height
CAMERA2X=655	#X-axis
CAMERA2Y=440	#Y-axis

#	Camera 3 resolution and position	#

CAMERA3W=350	#width
CAMERA3H=350	#height
CAMERA3X=655	#X-axis
CAMERA3Y=0	#Y-axis

#	Camera 4 resolution and position	#

CAMERA4W=350	#width
CAMERA4H=350	#height
CAMERA4X=300	#X-axis
CAMERA4Y=440	#Y-axis


###################################################

#	Commands to apply the variables | DO NOT CHANGE		#

###################################################

#	Camera 1	#

#This will set the window position
xdotool windowsize $CAMERA1ID $CAMERA1W $CAMERA1H

#This will set the window resolution
xdotool windowmove $CAMERA1ID $CAMERA1X $CAMERA1Y

###################################################


###################################################

#	Camera 2	#

#This will set the window position
xdotool windowsize $CAMERA2ID $CAMERA2W $CAMERA2H

#This will set the window resolution
xdotool windowmove $CAMERA2ID $CAMERA2X $CAMERA2Y

###################################################

###################################################

#	Camera 3	#

#This will set the window position
xdotool windowsize $CAMERA3ID $CAMERA3W $CAMERA3H

#This will set the window resolution
xdotool windowmove $CAMERA3ID $CAMERA3X $CAMERA3Y

###################################################

###################################################

#	Camera 4	#

#This will set the window position
xdotool windowsize $CAMERA4ID $CAMERA4W $CAMERA4H

#This will set the window resolution
xdotool windowmove $CAMERA4ID $CAMERA4X $CAMERA4Y

###################################################

#!/bin/bash

#########################################################################################################################################################

#	Script Function		#

#########################################################################################################################################################

# This script will start the RTSP stream of 4 camera's using MPlayer, each stream will be launched via an sh script,
# it will then note the Window ID of each stream and save it to a file called camera.txt then it  willpull each line-
# from camera.txt and use them as variables called CAMERA$ID, each variable has been hardcoded with a specific-
# resolution and screen position so that 4 streams are perfectly on each screen quadrant

# test stream:
# mplayer rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov

# Find Window ID manually
# xdotool search --onlyvisible --class MPlayer

#########################################################################################################################################################


#########################################################################################################################################################

#	Script installation		#

# There are a few requirements to get the script to function, it's not entirely plug and play.
# step 1: create 4 terminal profiles through gnome-terminal preferences, name each profile sequentially, eg. mplayer1, mplayer2, etc 
# step 2: each RTSP stream will be launched via an sh script, change the location of the sh script under the "Launching RTSP streams" heading
# step 3: change the contents of each mplayer.sh script to make sure the stream is running on the correct IP

#	optional	#
# step 4: if you decide not to use mplayer, change the MPlayer variable in the "Fetching Camera ID's"

#########################################################################################################################################################


#########################################################################################################################################################

#	Launching RTSP streams	#

#########################################################################################################################################################

echo "Opening Camera 1"
gnome-terminal --window-with-profile=mplayer1 -- sh /home/$USER/Desktop/test_stream/mplayer1.sh	#CHANGE LOCATION & CONTENTS OF mp.player1.sh

echo "Opening Camera 2"
gnome-terminal --window-with-profile=mplayer2 -- sh /home/$USER/Desktop/test_stream/mplayer2.sh	#CHANGE LOCATION & CONTENTS OF mp.player2.sh

echo "Opening Camera 3"
gnome-terminal --window-with-profile=mplayer3 -- sh /home/$USER/Desktop/test_stream/mplayer3.sh	#CHANGE LOCATION & CONTENTS OF mp.player3.sh

echo "Opening Camera 4"
gnome-terminal --window-with-profile=mplayer4 -- sh /home/$USER/Desktop/test_stream/mplayer4.sh	#CHANGE LOCATION & CONTENTS OF mp.player4.sh

sleep 25 #change variable if the resolutions are not syncing

#########################################################################################################################################################



#########################################################################################################################################################

#	Saving Window ID's to camera.txt | Asigning each line to a variable 	#

#########################################################################################################################################################

echo "Fetching Camera ID's"
xdotool search --onlyvisible --class MPlayer  > camera.txt 	#if you're not using MPlayer, change the class variable in this command

#echo "Asigning Camera 1"
CAMERA1ID=`cat /home/$USER/Desktop/MPlayer_4_Screen_Monitoring/camera.txt| head -1 | tail -1`

#echo "Asigning Camera 2"
CAMERA2ID=`cat /home/$USER/Desktop/MPlayer_4_Screen_Monitoring/camera.txt| head -2 | tail -1`

#echo "Asigning Camera 3"
CAMERA3ID=`cat /home/$USER/Desktop/MPlayer_4_Screen_Monitoring/camera.txt| head -3 | tail -1`

#echo "Asigning Camera 4"
CAMERA4ID=`cat /home/$USER/Desktop/MPlayer_4_Screen_Monitoring/camera.txt| head -4 | tail -1`

#########################################################################################################################################################



#########################################################################################################################################################

#	Variables | Based on the current connected screen 	#

#########################################################################################################################################################

#	Camera 1 resolution and position	#
# USE THE SCRIPT ./debug_screen_size.sh to play around with different resolutions before inputting them here

CAMERA1W=950	#width
CAMERA1H=500	#height
CAMERA1X=1370	#X-axis
CAMERA1Y=0	#Y-axis

#	Camera 2 resolution and position	#

CAMERA2W=950	#width
CAMERA2H=500	#height
CAMERA2X=2330	#X-axis
CAMERA2Y=0	#Y-axis

#	Camera 3 resolution and position	#

CAMERA3W=950	#width
CAMERA3H=510	#height
CAMERA3X=1370	#X-axis
CAMERA3Y=565	#Y-axis

#	Camera 4 resolution and position	#

CAMERA4W=950	#width
CAMERA4H=510	#height
CAMERA4X=2330	#X-axis
CAMERA4Y=565	#Y-axis


#########################################################################################################################################################

#	Commands to apply the variables | DO NOT CHANGE		#

#########################################################################################################################################################

#	Camera 1	#

#This will set the window position
xdotool windowsize $CAMERA1ID $CAMERA1W $CAMERA1H

#This will set the window resolution
xdotool windowmove $CAMERA1ID $CAMERA1X $CAMERA1Y

#########################################################################################################################################################


#########################################################################################################################################################

#	Camera 2	#

#This will set the window position
xdotool windowsize $CAMERA2ID $CAMERA2W $CAMERA2H

#This will set the window resolution
xdotool windowmove $CAMERA2ID $CAMERA2X $CAMERA2Y

#########################################################################################################################################################

#########################################################################################################################################################

#	Camera 3	#

#This will set the window position
xdotool windowsize $CAMERA3ID $CAMERA3W $CAMERA3H

#This will set the window resolution
xdotool windowmove $CAMERA3ID $CAMERA3X $CAMERA3Y

#########################################################################################################################################################

#########################################################################################################################################################

#	Camera 4	#

#This will set the window position
xdotool windowsize $CAMERA4ID $CAMERA4W $CAMERA4H

#This will set the window resolution
xdotool windowmove $CAMERA4ID $CAMERA4X $CAMERA4Y

#########################################################################################################################################################

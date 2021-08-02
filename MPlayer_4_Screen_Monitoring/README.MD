# What does this script do?

<h2> mplayer-startup.sh </h2>

This script will be used to open up 4 RTSP streams and align them anywhere on the screen. 
Each stream is adjustable, the user can adjust both the resolution and the position of the stream, 
by default it is set to fit each quadrant of a 1080p monitor. The script uses mplayer to load the streams
but any other media player can be used on the condition that some changes are made to the script, which are highlighted.
The script offers full automation once setup correctly, once the streams have been opened, the window ID's will be saved into a file
called 'camera.txt', this makes it so that the user doesn't have to manually input the window ID everytime the script is to be used.
</br>

<h2> debug_screen_size.sh </h2>

This script makes use of -flags and is used to easily debug the size and position of individual stream, it comes in handy when working on unfamiliar
screen resolutions, or if the user wants a specific resolution for a specific stream, once the user gets the correct variables using the debugging script
it can then be harcoded into the main script for a permanent adjustment.

<h3> Usage for debug_screen.sh </h3>
Example: </br>
  ./debug_screen_size.sh -i 102760454 -w 300 -h 500 -x 500 -y 10
</br>
 FLAGS  </br>
 
-i  window ID (use the command 'xdotool search --onlyvisible --class mplayer' to find the window ID's) </br>
-w  resolution width </br>
-h  resolution height </br>
-x  X-axis </br>
-y  Y-axis </br>

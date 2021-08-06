#!/bin/bash

$USER=`whoami`

################################################################################################
#	opens 4 camera streams through 4 terminals | records in 10 second segments
################################################################################################
	
	#ffmpeg stream record camera 1
	gnome-terminal --tab --title="cam1" --command="ffmpeg -rtsp_transport tcp -i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov -c copy -f segment -segment_time 10 camera1_%d.mp4"
	
	#ffmpeg stream record camera 2
	gnome-terminal --tab --title="cam2" --command="ffmpeg -rtsp_transport tcp -i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov -c copy -f segment -segment_time 10 camera2_%d.mp4"
	
	#ffmpeg stream record camera 3
	gnome-terminal --tab --title="cam3" --command="ffmpeg -rtsp_transport tcp -i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov -c copy -f segment -segment_time 10 camera3_%d.mp4"
	
	#ffmpeg stream record camera 4
	gnome-terminal --tab --title="cam4" --command="ffmpeg -rtsp_transport tcp -i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov -c copy -f segment -segment_time 10 camera4_%d.mp4"

#############################################################################################

# FFMPEG LOOP | Hide terminal | move recording to archive/ | move archive to cloud_storage/	#

#############################################################################################

while :
do	
	#hide terminals
	CAMERA_TERM=`xdotool search --onlyvisible --class gnome-terminal | head -1 | tail -1`
	xdotool windowminimize $CAMERA_TERM
	#
	
	#checks for the archive/,camera_stream/ and cloud_storage/ directories, creates them if there is non
	mkdir -p archive
	mkdir -p /home/$USER/Desktop/cloud_storage
	mkdir -p /home/$USER/Desktop/ffmpeg_4screen_record/camera_streams
	mkdir -p /home/$USER/Desktop/ffmpeg_4screen_record/camera_streams/camera_1
	mkdir -p /home/$USER/Desktop/ffmpeg_4screen_record/camera_streams/camera_2
	mkdir -p /home/$USER/Desktop/ffmpeg_4screen_record/camera_streams/camera_3
	mkdir -p /home/$USER/Desktop/ffmpeg_4screen_record/camera_streams/camera_4
	#
	
	#checks to see if the archive/ and camera_streams/ dirs are greater than a certain size in MB, if it is, it gets moved to cloud_storage
	ARCHIVE_TIME=`date +%F+%T | nawk '{gsub(/:/,"-")};1' | nawk '{gsub(/+/,"-")};1'`
	if [ $(du -m -s archive/ | cut -f1) -gt 4 ] ; then
	  mv archive/ /home/$USER/Desktop/cloud_storage/archive_$ARCHIVE_TIME
	fi

	if [ $(du -m -s camera_streams/ | cut -f1) -gt 4 ] ; then
	  mv camera_streams/ /home/$USER/Desktop/cloud_storage/camera_streams_$ARCHIVE_TIME
	fi
	#
	
	#moves the screen_*.mp4 recordings into /archive 
	CURRENT_TIME=`date +%F+%T | nawk '{gsub(/-/,"")};1' | nawk '{gsub(/:/,"-")};1' | nawk '{gsub(/+/,"-")};1'`
	mv /home/$USER/Desktop/ffmpeg_4screen_record/screen_*.mp4 /home/imraan/Desktop/ffmpeg_4screen_record/archive/
	sleep 1
	#
	
	#records the screen in N second increments and adds a date and time to each recording
	ffmpeg -f x11grab -s 1920x1080 -r 25 -i :0.0+1366,0 -t 00:00:05 /home/$USER/Desktop/ffmpeg_4screen_record/screen_$CURRENT_TIME.mp4 
	sleep 1
	#
	
	#moves the cam1_*.mp4 file to /camera_streams/camera_1/
	mv /home/imraan/Desktop/ffmpeg_4screen_record/camera1_*.mp4 /home/$USER/Desktop/ffmpeg_4screen_record/camera_streams/camera_1
	
	#moves the cam2_*.mp4 file to /camera_streams/camera_2/
	mv /home/imraan/Desktop/ffmpeg_4screen_record/camera2_*.mp4 /home/$USER/Desktop/ffmpeg_4screen_record/camera_streams/camera_2
	
	#moves the cam3_*.mp4 file to /camera_streams/camera_3/
	mv /home/imraan/Desktop/ffmpeg_4screen_record/camera3_*.mp4 /home/$USER/Desktop/ffmpeg_4screen_record/camera_streams/camera_3
	
	#moves the cam4_*.mp4 file to /camera_streams/camera_4/
	mv /home/imraan/Desktop/ffmpeg_4screen_record/camera4_*.mp4 /home/$USER/Desktop/ffmpeg_4screen_record/camera_streams/camera_4
	#
	
################################################################################################		

done







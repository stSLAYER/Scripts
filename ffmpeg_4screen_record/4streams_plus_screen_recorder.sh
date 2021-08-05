#!/bin/bash

# ffmpeg -f x11grab -s 1920x1080 -r 25 -i :0.0+1366,0 -t 00:00:10 /home/imraan/Desktop/ffmpeg_4screen_record/screen_0.mp4
# /home/imraan/Desktop/ffmpeg_4screen_record


#############################################################################################

# FFMPEG LOOP	| move recording to archive | move archive to cloud_storage | Hide terminal	#

#############################################################################################

while :
do	
	#checks for the archive directory, creates one if there is non
	mkdir -p archive
	mkdir -p /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams
	mkdir -p /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams/camera_1
	mkdir -p /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams/camera_2
	mkdir -p /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams/camera_3
	mkdir -p /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams/camera_4
	
	#checks to see if archive dir is greater than a certain size in MB, if it is, it gets moved to cloud_storage
	ARCHIVE_TIME=`date +%F+%T | nawk '{gsub(/:/,"-")};1' | nawk '{gsub(/+/,"-")};1'`
	if [ $(du -m -s archive/ | cut -f1) -gt 4 ] ; then 
  		mv archive/ /home/imraan/Desktop/cloud_storage/archive_$ARCHIVE_TIME
	fi
	
	#zip the archive file and adds a date to it
	#ARCHIVE_TIME=`date +%F+%T | nawk '{gsub(/:/,"-")};1' | nawk '{gsub(/+/,"-")};1'`
	#cd /home/imraan/Desktop/cloud_storage/ && zip -r /home/imraan/Desktop/cloud_storage/archive_$ARCHIVE_TIME.zip archive  && rm -r /home/imraan/Desktop/cloud_storage/archive && cd /home/imraan/Desktop/ffmpeg_4screen_record


	#HIDE_TERM=`xdotool search --onlyvisible --class terminal | head -1 | tail -1`
	#xdotool windowminimize $HIDE_TERM
	
	CURRENT_TIME=`date +%F+%T | nawk '{gsub(/-/,"")};1' | nawk '{gsub(/:/,"-")};1' | nawk '{gsub(/+/,"-")};1'`
	mv /home/imraan/Desktop/ffmpeg_4screen_record/screen_*.mp4 /home/imraan/Desktop/ffmpeg_4screen_record/archive/
	sleep 1

	ffmpeg -f x11grab -s 1920x1080 -r 25 -i :0.0+1366,0 -t 00:00:05 /home/imraan/Desktop/ffmpeg_4screen_record/screen_$CURRENT_TIME.mp4 
	sleep 2

done






#!/bin/bash

# ffmpeg -f x11grab -s 1920x1080 -r 25 -i :0.0+1366,0 -t 00:00:10 /home/imraan/Desktop/ffmpeg_4screen_record/screen_0.mp4
# /home/imraan/Desktop/ffmpeg_4screen_record

# This will stream and save every segmented second:
# ffmpeg -rtsp_transport tcp -i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov -c copy -f segment -segment_time 5 stream_cam1_%d.mp4

# to play the stream:
# ffplay -rtsp_transport tcp rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov


################################################################################################
#	opens 4 camera streams in 4 terminals
################################################################################################
	#ffmpeg stream record camera 1
	gnome-terminal --tab --title="cam1" --command="ffmpeg -rtsp_transport tcp -i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov -c copy -f segment -segment_time 10 cam1_%d.mp4"
	
	#ffmpeg stream record camera 2
	gnome-terminal --tab --title="cam2" --command="ffmpeg -rtsp_transport tcp -i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov -c copy -f segment -segment_time 10 cam2_%d.mp4"
	
	#ffmpeg stream record camera 3
	gnome-terminal --tab --title="cam3" --command="ffmpeg -rtsp_transport tcp -i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov -c copy -f segment -segment_time 10 cam3_%d.mp4"
	
	#ffmpeg stream record camera 4
	gnome-terminal --tab --title="cam4" --command="ffmpeg -rtsp_transport tcp -i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov -c copy -f segment -segment_time 10 cam4_%d.mp4"

#helps with getting the terminal ID's
sleep 3

################################################################################################
#	Create 1 dir | Create 4 sub dirs inside main dir  
################################################################################################

while :
do
	#save terminal ID's to a file
	xdotool search --onlyvisible --class gnome-terminal > hide_terms.txt
	#Variable
	CAMERA_TERM=`cat hide_terms.txt| head -1 | tail -1`
	#read from hide_terms.txt in order to hide based on ID
	xdotool windowminimize $CAMERA_TERM
	# creates main dir and sub dir
	mkdir -p /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams
	mkdir -p /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams/camera_1
	mkdir -p /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams/camera_2
	mkdir -p /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams/camera_3
	mkdir -p /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams/camera_4
	

################################################################################################
	
	
################################################################################################
	# Move cam_* to corresponding file | Hide Gnome-terminals
################################################################################################
	


	
	#moves the cam1_*.mp4 file to camera_streams/camera_1
	mv /home/imraan/Desktop/ffmpeg_4screen_record/cam1_*.mp4 /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams/camera_1
	
	#moves the cam2_*.mp4 file to camera_streams/camera_2
	mv /home/imraan/Desktop/ffmpeg_4screen_record/cam2_*.mp4 /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams/camera_2
	
	#moves the cam3_*.mp4 file to camera_streams/camera_3
	mv /home/imraan/Desktop/ffmpeg_4screen_record/cam3_*.mp4 /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams/camera_3
	
	#moves the cam4_*.mp4 file to camera_streams/camera_4
	mv /home/imraan/Desktop/ffmpeg_4screen_record/cam4_*.mp4 /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams/camera_4

done
################################################################################################







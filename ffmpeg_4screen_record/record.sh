#!/bin/bash

# ffmpeg -f x11grab -s 1920x1080 -r 25 -i :0.0+1366,0 -t 00:00:10 /home/imraan/Desktop/ffmpeg_4screen_record/screen_0.mp4
# /home/imraan/Desktop/ffmpeg_4screen_record

# This will stream and save every segmented second:
# ffmpeg -rtsp_transport tcp -i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov -c copy -f segment -segment_time 5 stream_cam1_%d.mp4

# to play the stream:
# ffplay -rtsp_transport tcp rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov



################################################################################################


#	Create 1 dir | Create 4 sub dirs inside main dir  


################################################################################################

while :
do
	# creates main dir and sub dir
	mkdir -p /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams
	mkdir -p /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams/camera_1
	mkdir -p /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams/camera_2
	mkdir -p /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams/camera_3
	mkdir -p /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams/camera_4
	
	#ffmpeg stream record camera 1
	gnome-terminal --tab --title="cam1" --command="ffmpeg -rtsp_transport tcp -i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov -c copy -f segment -segment_time 10 cam_1_%d.mp4"
	
	#ffmpeg stream record camera 2
	gnome-terminal --tab --title="cam1" --command="ffmpeg -rtsp_transport tcp -i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov -c copy -f segment -segment_time 10 cam_2_%d.mp4"
	
	#ffmpeg stream record camera 3
	gnome-terminal --tab --title="cam1" --command="ffmpeg -rtsp_transport tcp -i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov -c copy -f segment -segment_time 10 cam_3_%d.mp4"
	
	#ffmpeg stream record camera 4
	gnome-terminal --tab --title="cam1" --command="ffmpeg -rtsp_transport tcp -i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov -c copy -f segment -segment_time 10 cam_4_%d.mp4"

	
	#moves the cam_1_*.mp4 file to camer_streams/camera_1
	mv /home/imraan/Desktop/ffmpeg_4screen_record/cam_1_*.mp4 /home/imraan/Desktop/ffmpeg_4screen_record/camera_streams/camera_1

done








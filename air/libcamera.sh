#!/bin/bash

gst-launch-1.0 libcamerasrc ! \
    video/x-raw,width=1280,height=720,framerate=60/1 ! \
    videoconvert ! \
    v4l2h264enc bitrate=6000000 ! \
    video/x-h264,profile=high ! \
    h264parse ! \
    rtph264pay config-interval=1 pt=96 ! \
    udpsink host=localhost port=5602

#!/bin/bash

gst-launch-1.0 libcamerasrc ! \
    video/x-raw,width=1280,height=720,framerate=60/1 ! \
    videoconvert ! \
    v4l2h264enc name=rpi_v4l2_encoder extra-controls="controls,video_bitrate=6000000" ! \
    "video/x-h264,level=(string)4,profile=constrained-baseline" ! \
    h264parse ! \
    rtph264pay config-interval=1 pt=96 ! \
    udpsink host=localhost port=5600

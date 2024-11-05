gst-launch-1.0 libcamerasrc ! \
 video/x-raw,width=1280,height=720,format=NV12,framerate=30/1,interlace-mode=progressive,colorimetry=bt709 ! \
 v4l2h264enc name=rpi_v4l2_encoder extra-controls="controls,repeat_sequence_header=1,h264_profile=1,h264_level=11,video_bitrate=6000000,h264_i_frame_period=5,generate_access_unit_delimeters=1,h264_minimum_qp_value=5,h264_maximum_qp_value=51" ! \
"video/x-h264,level=(string)4,profile=constrained-baseline" ! queue ! h264parse config-interval=-1 ! rtph264pay config-interval=1 pt=96 ! udpsink host=127.0.0.1 port=5600

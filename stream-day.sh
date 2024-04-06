#!/bin/sh
TOKEN=
libcamera-vid --inline --nopreview -t 0 --width 1280 --height 960 --framerate 10 --codec h264 --awb cloudy --sharpness 1.0 -b 1000000 -o - | ffmpeg -re -framerate 10 -i - -f lavfi -i anullsrc -c:v copy -f flv "rtmp://a.rtmp.youtube.com/live2/$TOKEN"

#!/bin/sh
raspivid -t 0 -w 640 -h 480 -fps 30 -b 1000000 -o - | ffmpeg -re -framerate 30 -i - -f lavfi -i anullsrc -c:v copy -f flv rtmp://a.rtmp.youtube.com/live2/[TOKEN]

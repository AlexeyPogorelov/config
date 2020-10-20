#!/bin/bash

RESOLUTION=xrandr | grep \* | awk '{print $1}'

ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0 -f pulse -ac 2 -i default -c:v libx264 -pix_fmt yuv420p -c:a ac3 -ab 320k $HOME/`date +%H%M%d%m%Y`_output.mp4


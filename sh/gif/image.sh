ffmpeg -video_size $3x$4 -f x11grab -i :0.0+$1,$2 -framerate 1 -vframes 1 -y ./test.jpg


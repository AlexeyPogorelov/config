ffmpeg -i $1 -vf vidstabdetect=shakiness=10:accuracy=15:result="$1_mytransforms.trf" -f null -

ffmpeg -i $1 -vf vidstabtransform=zoom=1:input="$1_mytransforms.trf":interpol="bicubic":relative=1 -vcodec libx264 -tune film -acodec copy -preset slow stabilized.mp4


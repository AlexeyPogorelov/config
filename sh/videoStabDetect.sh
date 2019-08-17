#!/bin/bash
FILES=./*.mp4
for f in $FILES
do
  echo "Processing $f file..."

  BASENAME=${f##*/}
  BASE_WITHOUT_EXT=${BASENAME%.*}
  OUTPUT=("${BASE_WITHOUT_EXT}.trf")

  # take action on each file. $f store current file name
  ffmpeg -i $f -vf vidstabdetect=shakiness=10:accuracy=15:result=$OUTPUT -f null -
done


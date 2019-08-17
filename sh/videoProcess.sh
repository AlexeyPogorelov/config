#!/bin/bash

function usage(){
  echo usage:
  echo $0' <input video file>'
}

# exactly one argument required
if [ $# -ne 1 ]
then
  usage
  exit 1
fi

INFILE=$1
if [ ! -f $INFILE ]
then
  echo 'Input file does not exist or is not a regular file'
  exit 2
fi

BASENAME=${1##*/}
EXT=${1##*.}
BASE_WITHOUT_EXT=${BASENAME%.*}
STABFILE=("${BASE_WITHOUT_EXT}.trf")
LUTFILE=("${BASE_WITHOUT_EXT}.cube")
OUT_NAME=("${BASE_WITHOUT_EXT}_processed.mp4")

ffmpeg -i $INFILE -vf "vidstabtransform=zoom=1:input=$STABFILE:interpol=bicubic:relative=1,unsharp,lut3d=$LUTFILE" -vcodec libx264 -tune film -acodec copy -preset slow -s 1920x1080 $OUT_NAME


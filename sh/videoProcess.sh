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
OUT_DIR=("ffmpeg")

if [ ! -f $STABFILE ]
then
  echo 'Creating stab detect file'
  ffmpeg -y -i $INFILE -vf \
    vidstabdetect=shakiness=10:accuracy=15:result=$STABFILE -f null -
fi;

if [ -f $LUTFILE ]
  LUT_OPTIONS="lut3d=$LUTFILE"
then
else
  LUT_OPTIONS=""
fi;

if [ ! -d $OUT_DIR ]
then
  echo 'Creating output directory'
  mkdir $OUT_DIR
fi;

STAB_OPTIONS="vidstabtransform=zoom=1:input=$STABFILE:interpol=bicubic:relative=1,"
UNSHARP_OPTIONS="unsharp=5:5:0.8:3:3:0.4,"

ffmpeg -y -i $INFILE -vf \
  "$STAB_OPTIONS $UNSHARP_OPTIONS $LUT_OPTIONS" \
  -vcodec libx264 -crf 18 -tune film -preset slow \
  -acodec copy \
  -s 1920x1080 "$OUT_DIR/$OUT_NAME"


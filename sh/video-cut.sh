#!/bin/bash

function usage(){
  echo usage:
  echo ' input video file,'
  echo ' start time <hh:mm:ss>,'
  echo ' duration <hh:mm:ss>'
}

if [ $# -ne 3 ]
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

START_TIME=$2
DURATION=$3
BASENAME=${1##*/}
EXT=${1##*.}
BASE_WITHOUT_EXT=${BASENAME%.*}
OUT_NAME=("${BASE_WITHOUT_EXT}_cut.${EXT}")

ffmpeg -ss $START_TIME -t $DURATION -i $INFILE \
-vcodec copy -acodec copy \
$OUT_NAME

# -filter_complex "[0:v]setpts=0.9*PTS;[0:a]atempo=1.1" \


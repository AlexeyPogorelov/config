#!/bin/bash

# choose pulseaudio sink via dmenu
# changes default sink and moves all streams to that sink

# declare sinkName=$(pacmd info | grep 'Default sink' | awk '{print $4}')
# declare sinkNumber=$(pacmd info | grep "sink:.*$sinkName" | awk '{print $2}')

declare sinks=`pacmd list-sinks | sed -n -e 's/.*device.description[[:space:]]=[[:space:]]"\(.*\)"/\1/p'`
declare index=`pacmd list-sinks | sed -n -e 's/.*[[:space:]]index:[[:space:]]\([[:digit:]]\)/\1/p'`

choices=$(paste -d '_' <(echo "$sinks") <(echo "$index"))

chosen=$(echo -e $choices | dmenu -nb '#1d2021' -nf '#928374' -sb '#d79921' -sf '#1d2021' -fn 'monospace-20' -i -l 180 -p "AUDIO")

# pacmd "set-default-sink ${index}"
# for app in $(pacmd list-sink-inputs | sed -n -e 's/index:[[:space:]]\([[:digit:]]\)/\1/p');
# do
# pacmd "move-sink-input $app $index"
# done

set-default-sink $index


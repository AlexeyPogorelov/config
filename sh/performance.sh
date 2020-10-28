#!/bin/bash
while [ "$select" != "powersave" -a "$select" != "performance" ];
do
    select=$(echo -e 'powersave\nperformance' | dmenu -nb '#1d2021' -nf '#928374' -sb '#d79921' -sf '#1d2021' -fn 'monospace-20' -i -l 180 -p "Performance")
        [ -z "$select"  ] && exit 0
      done
      [ "$select" = "powersave"  ] && sudo cpupower frequency-set -g powersave
      [ "$select" = "performance"  ] && sudo cpupower frequency-set -g performance


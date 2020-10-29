#!/bin/bash
while [ "$select" != "mute" -a "$select" != "unmute" -a "$select" != "powersave" -a "$select" != "performance" ];
do
    select=$(echo -e 'mute\nunmute\npowersave\nperformance' | dmenu -nb '#1d2021' -nf '#928374' -sb '#d79921' -sf '#1d2021' -fn 'monospace-20' -i -l 180 -p "Performance")
        [ -z "$select"  ] && exit 0
      done
      [ "$select" = "mute"  ] && killall -SIGUSR1 dunst
      [ "$select" = "unmute"  ] && killall -SIGUSR2 dunst
      [ "$select" = "powersave"  ] && gnome-terminal -e "sudo cpupower frequency-set -g powersave"
      [ "$select" = "performance"  ] && gnome-terminal -e "sudo cpupower frequency-set -g performance"


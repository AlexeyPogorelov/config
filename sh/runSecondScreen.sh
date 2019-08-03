#!/bin/bash
xrdb -merge <(echo "Xft.dpi: 96")
xrandr --output eDP1 --mode 1440x900 --output HDMI1 --auto --left-of eDP1
i3 reload


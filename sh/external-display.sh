#!/bin/bash
xrdb -merge <(echo "Xft.dpi: 96")

# This is your default laptop screen, detect by running `xrandr`
INTERNAL_OUTPUT="eDP1"

# choices will be displayed in dmenu
choices="laptop\nexternal\ndual\nclone\n720 laptop\n720 external\n1080 external"

# Your choice in dmenu will determine what xrandr command to run
chosen=$(echo -e $choices | dmenu -nb '#1d2021' -nf '#928374' -sb '#d79921' -sf '#1d2021' -fn 'monospace-20' -i -l 180 -p "DISPLAY")

# This is used to determine which external display you have connected
if [ `xrandr | grep HDMI1 | grep -c ' connected '` -eq 1 ]; then
  EXTERNAL_OUTPUT="HDMI1"
fi
if [ `xrandr | grep DP1 | grep -c ' connected '` -eq 2 ]; then
  EXTERNAL_OUTPUT="DP1"
fi
if [ `xrandr | grep DP2 | grep -c ' connected '` -eq 1 ]; then
  EXTERNAL_OUTPUT="DP2"
fi

case "$chosen" in
  external) xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto --primary ;;
  laptop) xrandr --output $INTERNAL_OUTPUT --auto --primary --output $EXTERNAL_OUTPUT --off ;;
  clone) xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT ;;
  dual) xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --right-of $INTERNAL_OUTPUT --primary ;;
  720\ laptop) xrandr --output $INTERNAL_OUTPUT --mode 1280x720 --primary --output $EXTERNAL_OUTPUT --off ;;
  720\ external) xrandr --output $EXTERNAL_OUTPUT --mode 1280x720 --primary --output $INTERNAL_OUTPUT --off ;;
  1080\ external) xrandr --output $EXTERNAL_OUTPUT --mode 1920x1080 --primary --output $INTERNAL_OUTPUT --off ;;
esac

i3 reload

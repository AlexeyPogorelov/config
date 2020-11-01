#!/bin/bash
while [ "$select" != "cancel" -a "$select" != "logout" -a "$select" != "poweroff" -a "$select" != "reboot"  ];
do
    select=$(echo -e 'cancel\nlogout\npoweroff\nreboot\nhibernate' | dmenu -nb '#1d2021' -nf '#928374' -sb '#d79921' -sf '#1d2021' -fn 'monospace-20' -i -l 180 -p "POWER")
        [ -z "$select"  ] && exit 0
      done
      [ "$select" = "cancel"  ] && exit 0
      [ "$select" = "logout"  ] && i3-msg exit
      [ "$select" = "poweroff"  ] && gnome-terminal -e "sudo shutdown -h now "
      [ "$select" = "reboot"  ] && gnome-terminal -e "sudo reboot"
      [ "$select" = "hibernate"  ] && gnome-terminal -e "sudo systemctl hibernate"


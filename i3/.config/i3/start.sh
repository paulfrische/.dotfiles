#!/bin/bash

MONITOR1=DP-1
MONITOR2=HDMI-0

xrandr --output $MONITOR1 --left-of $MONITOR2
xrandr --output $MONITOR1 --primary

nitrogen --restore &

pkill picom
pkill redshift-gtk
picom &
redshift-gtk &

echo "---" >> ~/polybar.log
pkill polybar
MONITOR=$MONITOR1 polybar bar 2>&1 | tee -a ~/polybar.log & disown
MONITOR=$MONITOR2 polybar bar 2>&1 | tee -a ~/polybar.log & disown

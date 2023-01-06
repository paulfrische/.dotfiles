#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar workspaces & # 2>&1 | tee -a /tmp/polybar1.log & disown
        MONITOR=$m polybar title & # 2>&1 | tee -a /tmp/polybar1.log & disown
        MONITOR=$m polybar right & # 2>&1 | tee -a /tmp/polybar1.log & disown
        echo $m
    done
else
    polybar workspaces main 2>&1 | tee -a /tmp/polybar1.log & disown
fi

echo "Bars launched..."

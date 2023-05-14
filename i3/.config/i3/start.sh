xrandr --output DP-1 --left-of HDMI-0
xrandr --output DP-1 --primary

pkill picom
picom &
mpd &
setxkbmap eu

nitrogen --restore &

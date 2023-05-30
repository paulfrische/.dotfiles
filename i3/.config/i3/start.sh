xrandr --output DP-1 --left-of HDMI-0
xrandr --output DP-1 --primary

nitrogen --restore &

pkill picom
pkill redshift-gtk
picom &
mpd &
setxkbmap eu
redshift-gtk &

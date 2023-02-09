#!/bin/bash

/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
dbus-update-activation-environment --all &
/usr/bin/gnome-keyring-daemon -s -d -l --unlock --components=ssh,secrets,pkcs11 &
# xset s 900 900 &
xset r rate 300 50 &
picom -b &
dunst -conf /home/leiswatch/.config/dunst/dunstrc &
# nitrogen --restore &
feh --bg-scale /home/leiswatch/Pictures/1028709.jpg &
/home/leiswatch/.config/polybar/launch.sh --blocks &

redshift -t 6500:3500 -l 54.3520:18.6466 &
nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=35" &
sleep 1;
/usr/share/discord/Discord --start-minimized &
sleep 1;
/usr/bin/slack %U -u &
sleep 1;
flameshot &
sleep 1;
mintupdate-launcher &
sleep 1;
nm-applet &

#!/bin/bash

picom -b &
/home/leiswatch/.config/polybar/launch.sh --bspwm &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
dbus-update-activation-environment --all &
/home/leiswatch/.config/bspwm/scripts/gnome-keyring.sh &
dunst -config /home/leiswatch/.config/dunst/dunstrc &
xset r rate 300 50 &
xset dpms 0 0 1800 &
feh --bg-scale /home/leiswatch/Pictures/Wallpapers/617304.jpg &
redshift -t 6500:3500 -l 54.3520:18.6466 &
nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=35" &

nm-applet &
sleep 1;
flameshot &
sleep 1;
/usr/bin/slack %U -u &
sleep 1;
/opt/Mullvad\ VPN/mullvad-vpn %U &
sleep 1;
megasync &
sleep 1;
/usr/share/discord/Discord --start-minimized &

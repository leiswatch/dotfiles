#!/bin/bash

xss-lock --transfer-sleep-lock -- i3lock -i /home/leiswatch/Pictures/Wallpapers/2279198.png --nofork &
picom --config /home/leiswatch/.config/picom/picom.conf &
nitrogen --restore &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
dbus-update-activation-environment --all &
/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh &
dbus-launch dunst --config /home/leiswatch/.config/dunst/dunstrc &
xset r rate 300 50 &
xset s 480 dpms 600 600 600 &

nm-applet &
blueman-applet &
flameshot &
/usr/bin/slack %U -u &
/opt/Mullvad\ VPN/mullvad-vpn %U &
megasync &
/usr/share/discord/Discord --start-minimized &
# redshift -t 6500:3500 -l 54.3520:18.6466 &
# nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=35" &

/home/leiswatch/.config/polybar/launch.sh --bspwm &

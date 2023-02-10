#!/bin/bash

nm-applet &
sleep 2
flameshot &
sleep 2
megasync &
sleep 2
/usr/bin/slack %U -u &
sleep 2
/usr/share/discord/Discord --start-minimized &
sleep 2
/opt/Mullvad\ VPN/mullvad-vpn %U &
sleep 2
nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=35" &

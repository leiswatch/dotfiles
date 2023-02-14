#!/bin/bash

nm-applet &
flameshot &
megasync &
/usr/bin/slack %U -u &
/usr/share/discord/Discord --start-minimized &
/opt/Mullvad\ VPN/mullvad-vpn %U &
nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=35" &

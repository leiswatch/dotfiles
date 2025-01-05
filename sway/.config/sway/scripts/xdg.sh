#!/usr/bin/env bash
sleep 3

killall -q xdg-desktop-portal-hyprland
killall -q xdg-desktop-portal-gtk
killall -q xdg-document-portal
killall -q xdg-desktop-portal

while pgrep -u $UID -f 'xdg-desktop-portal|xdg-document-portal|xdg-desktop-portal-gtk|xdg-desktop-portal-hyprland' >/dev/null; do sleep 1; done

(/usr/lib/xdg-desktop-portal &) &>/dev/null
(/usr/lib/xdg-document-portal &) &>/dev/null
(/usr/lib/xdg-desktop-portal-gtk &) &>/dev/null
(/usr/lib/xdg-desktop-portal-hyprland &) &>/dev/null

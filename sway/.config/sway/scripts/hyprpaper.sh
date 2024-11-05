#!/usr/bin/env bash
killall -q hyprpaper

# Wait until the processes have been shut down
while pgrep -u $UID -x hyprpaper >/dev/null; do sleep 1; done

(/bin/hyprpaper &) &> /dev/null

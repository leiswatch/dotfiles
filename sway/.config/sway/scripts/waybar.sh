#!/usr/bin/env bash
killall -q waybar

# Wait until the processes have been shut down
while pgrep -u $UID -x waybar >/dev/null; do sleep 1; done

(/bin/waybar &) &> /dev/null

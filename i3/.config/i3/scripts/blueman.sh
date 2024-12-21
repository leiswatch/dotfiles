#!/usr/bin/env bash

killall -q blueman-applet

# Wait until the processes have been shut down
while pgrep -u $UID -x blueman-applet >/dev/null; do sleep 1; done

sleep 3

(/bin/blueman-applet &)  &> /dev/null

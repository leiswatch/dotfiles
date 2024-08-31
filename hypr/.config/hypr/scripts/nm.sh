#!/usr/bin/env bash

killall -q nm-applet

# Wait until the processes have been shut down
while pgrep -u $UID -x nm-applet >/dev/null; do sleep 1; done

(/bin/nm-applet &)  &> /dev/null

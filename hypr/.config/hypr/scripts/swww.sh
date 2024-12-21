#!/usr/bin/env bash
killall -q swww-daemon

# Wait until the processes have been shut down
while pgrep -u $UID -x swww-daemon >/dev/null; do sleep 1; done

(/bin/swww-daemon &) &> /dev/null

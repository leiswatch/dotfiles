#!/usr/bin/env bash

killall -q picom

# Wait until the processes have been shut down
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done

(/bin/picom &)  &> /dev/null

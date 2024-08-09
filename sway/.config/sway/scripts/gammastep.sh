#!/usr/bin/env bash

killall -q gammstep

# Wait until the processes have been shut down
while pgrep -u $UID -x gammastep >/dev/null; do sleep 1; done

(/bin/gammastep-indicator &)  &> /dev/null

#!/usr/bin/env bash

killall -q nitrogen

# Wait until the processes have been shut down
while pgrep -u $UID -x nitrogen >/dev/null; do sleep 1; done

(/bin/nitrogen --restore &)  &> /dev/null

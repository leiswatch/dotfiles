#!/usr/bin/env bash

killall -q swaync

# Wait until the processes have been shut down
while pgrep -u $UID -x swaync >/dev/null; do sleep 1; done

(/bin/swaync &)  &> /dev/null

#!/usr/bin/env bash

killall -q copyq

# Wait until the processes have been shut down
while pgrep -u $UID -x copyq >/dev/null; do sleep 1; done

(/bin/copyq --start-server)  &> /dev/null

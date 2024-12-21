#!/usr/bin/env bash

killall -q flameshot

# Wait until the processes have been shut down
while pgrep -u $UID -x flameshot >/dev/null; do sleep 1; done

(/bin/flameshot &)  &> /dev/null

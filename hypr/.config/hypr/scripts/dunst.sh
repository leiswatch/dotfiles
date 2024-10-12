#!/usr/bin/env bash

killall -q dunst

# Wait until the processes have been shut down
while pgrep -u $UID -x dunst >/dev/null; do sleep 1; done

(/bin/dunst &)  &> /dev/null

#!/usr/bin/env bash
killall -q hypridle

# Wait until the processes have been shut down
while pgrep -u $UID -x hypridle >/dev/null; do sleep 1; done

(/bin/hypridle &)  &> /dev/null

#!/usr/bin/env bash
killall -q ags

# Wait until the processes have been shut down
while pgrep -u $UID -x ags >/dev/null; do sleep 1; done

(/bin/ags &) &> /dev/null

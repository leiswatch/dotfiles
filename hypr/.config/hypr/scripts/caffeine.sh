#!/usr/bin/env bash

killall -q caffeine

# Wait until the processes have been shut down
while pgrep -u $UID -x caffeine >/dev/null; do sleep 1; done

(/bin/caffeine start -d &)  &> /dev/null

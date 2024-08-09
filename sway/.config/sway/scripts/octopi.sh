#!/usr/bin/env bash

killall -q octopi-notifier

# Wait until the processes have been shut down
while pgrep -u $UID -x octopi-notifier >/dev/null; do sleep 1; done

(/bin/octopi-notifier &)  &> /dev/null

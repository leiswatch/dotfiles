#!/usr/bin/env bash

killall -q caffeine-ng

# Wait until the processes have been shut down
while pgrep -u $UID -x --full "caffeine-ng" >/dev/null; do sleep 1; done

(/bin/caffeine start -a &)  &> /dev/null

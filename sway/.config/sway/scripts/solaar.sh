#!/usr/bin/env bash

killall -q solaar

# Wait until the processes have been shut down
while pgrep -u $UID -x solaar >/dev/null; do sleep 1; done

(/bin/solaar -w hide &)  &> /dev/null

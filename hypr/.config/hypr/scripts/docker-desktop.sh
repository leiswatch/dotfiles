#!/usr/bin/env bash

killall -q "Docker Desktop"

# Wait until the processes have been shut down
while pgrep -u $UID -x "Docker Desktop" >/dev/null; do sleep 1; done

sleep 10

(/opt/docker-desktop/bin/docker-desktop &)  &> /dev/null

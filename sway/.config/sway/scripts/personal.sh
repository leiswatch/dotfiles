#!/usr/bin/env bash

sleep_until() {
    try=0
    focused=$(focus $(pgrep -f "$1"))

    while [[ "$focused" -eq 0 ]] && [[ "$try" -lt 20 ]]; do
        sleep 0.1
        try=$((try + 1))
        focused=$(focus $(pgrep -f "$1"))
    done
}

focus() {
    t=$(swaymsg "[pid=$1]" focus)

    success=$(echo "$t" | jq -r '.[0].success')

    # Check the value of success
    if [ "$success" == "true" ]; then
        return 0
    fi

    return 1
}

swaymsg workspace 9 && swaymsg exec "spotify"

sleep_until "spotify"

swaymsg workspace 3 && swaymsg exec "kitty -e $HOME/.local/bin/tx -T kitty"

sleep_until "kitty"

swaymsg workspace 1 && swyamsg exec "firefox"

sleep_until "firefox"

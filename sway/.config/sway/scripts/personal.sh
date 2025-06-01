#!/usr/bin/env bash

sleep_until() {
    until focus $(pgrep -f "$1"); do
        sleep 0.1
    done
}

focus() {
    t=$(swaymsg "[pid=$1]" focus)
    echo "$t"
    echo "$1"

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

swaymsg workspace 1 && swaymsg exec "librewolf"

sleep_until "librewolf"

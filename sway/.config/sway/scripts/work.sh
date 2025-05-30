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

swaymsg workspace 2 && swaymsg exec "google-chrome-stable"

sleep_until "chrome"

swaymsg workspace 8 && swaymsg exec "slack"

sleep_until "slack"

swaymsg workspace 3 && swaymsg exec "kitty -1 -e $HOME/.local/bin/tx"

sleep_until "kitty"

swaymsg workspace 1

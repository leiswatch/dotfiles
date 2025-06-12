#!/usr/bin/env bash

text=$(curl -s "https://wttr.in/$1?m&format=1" | sed s/+//g)

if [[ -n "$text" && "$text" != *"Unknown location"* ]]; then
    text=$(echo "$text" | sed -E "s/\s+/ /g")
    tooltip=$(curl -s "https://wttr.in/$1?m&format=4")

    if [[ -n "$tooltip" ]]; then
        tooltip=$(echo "$tooltip" | sed -E "s/\s+/ /g")
        echo "{\"text\":\"$text\", \"tooltip\":\"$tooltip\"}"
        exit
    fi
fi

echo "{\"text\":\"\", \"tooltip\":\"\"}"

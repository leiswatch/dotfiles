#!/bin/bash

# Arbitrary but unique message tag
msgTag="myvolume"

# Query amixer for the current volume and whether or not the speaker is muted
volume="$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer -D pulse sget Master))"
mute="$(amixer -D pulse sget Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"
if [[ $volume == 0 || "$mute" == "off" ]]; then
    # Show the sound muted notification
    dunstify -a "changeVolume" --timeout=750  -u critical -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag "󰖁 Volume muted"
else
    # Show the volume notification
    dunstify -a "changeVolume" --timeout=750 -u critical -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" "󰕾  Volume: ${volume}"
fi

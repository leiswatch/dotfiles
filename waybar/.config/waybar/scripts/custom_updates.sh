#!/usr/bin/env bash

get_total_updates() { UPDATES=$(fakeroot -- yay -Qu | wc -l); }

get_total_updates

if ((UPDATES > 0)); then
    echo "$UPDATES"
elif ((UPDATES == 0)); then
    echo "None"
fi

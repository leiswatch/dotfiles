#!/usr/bin/env bash

dir="$HOME/.config/rofi/launchers"
theme='style-vpn'

move_sink_inputs() {
    sink="$1"
    [ -n "$sink" ] || return 1

    sink_inputs=$(pactl list sink-inputs) || return 1

    while read -r sink_input; do
        index=$(echo "$sink_input" | grep -oP "\d+$")
        pactl move-sink-input "$index" "$sink" || return 1
    done < <(echo "$sink_inputs" | grep "Sink Input")
}

list_sinks() {
    sinks=$(pactl list sinks | sort | grep Description | awk -F ":" '{ print $2 }') || return 1
    echo "$sinks" | sed -e "s/\t/\ /g" | sed "s/^[ \t]*//"
}

select_sink() {
    sink="$(list_sinks | rofi -i -dmenu -theme "${dir}/${theme}.rasi" -msg "Sinks")" || return 1
    sink="$(pactl list sinks | grep "$sink" --before-context 1 | grep Name | awk -F ":" '{ print $2 }' | awk '$1=$1')"
    [ -n "$sink" ] || return 1

    pactl set-default-sink "$sink" || return 1
    move_sink_inputs "$sink" || return 1
}

case "$1" in
	list) list_sinks || exit 1;;
    current);;
	*) select_sink || exit 1;;
esac

exit 0

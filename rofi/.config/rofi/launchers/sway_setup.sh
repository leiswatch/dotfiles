#!/usr/bin/env bash

dir="$HOME/.config/rofi/launchers"
theme='style-vpn'

personal() {
    sh "$HOME"/.config/sway/scripts/personal.sh
}

work() {
    sh "$HOME"/.config/sway/scripts/work.sh
}

choosesetup() {
    choice=$(printf "Personal\\nWork" | rofi -i -dmenu -theme "${dir}/${theme}.rasi" -msg "Sway setup:")
    case "$choice" in
    Personal) personal ;;
    Work) work ;;
    esac
}

choosesetup

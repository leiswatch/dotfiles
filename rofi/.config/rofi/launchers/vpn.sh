#!/usr/bin/env bash
set -E
set -e
set -u
set -o pipefail

readonly PROGNAME=$(basename "$0")
readonly ARGS=("$@")

declare CONNECTION_LIST=""
declare CONNECTION_STATE=false
declare MENU_TITLE=""
declare PICKED_ENTRY=""

usage() {
	cat <<-EOF
		usage: $PROGNAME

		    Creates a rofi menu for VPN connections.

		         -h      show this help

	EOF
	return 0
}

dir="$HOME/.config/rofi/launchers"
theme='style-vpn'

parse_args() {
	while getopts "h" argument; do
		case "$argument" in
		h)
			usage
			exit 0
			;;
		*)
			usage
			exit 1
			;;
		esac
	done
	shift "$((OPTIND - 1))"
	return 0
}

determine_connection_list() {
	local active_connection=""
	local available_connections=""

	active_connection=$(nmcli --mode tabular --terse connection show --active | grep vpn | cut -d ':' -f1) || true
	if [[ $active_connection ]]; then
		CONNECTION_LIST=$active_connection
		CONNECTION_STATE=true
		return 0
	fi

	available_connections=$(nmcli --mode tabular --terse connection show | grep vpn | cut -d ":" -f1) || true
	if [[ $available_connections ]]; then
		CONNECTION_LIST=$available_connections
		CONNECTION_STATE=false
		return 0
	fi
	return 1
}

determine_menu_title() {
	if [[ -z $CONNECTION_LIST ]]; then
		MENU_TITLE="No VPN connections configured"
		return 0
	fi

	if [[ $CONNECTION_STATE == true ]]; then
		MENU_TITLE="VPN connections - Active"
		return 0
	else
		MENU_TITLE="VPN connections - Inactive"
		return 0
	fi
}

generate_rofi_menu() {
	PICKED_ENTRY=$(echo -e "$CONNECTION_LIST" | rofi -dmenu -mesg "$MENU_TITLE" -theme "${dir}/${theme}.rasi")

	return 0
}

activate_connection() {
	nmcli connection up "$PICKED_ENTRY"
	return 0
}

deactivate_connection() {
	nmcli connection down "$PICKED_ENTRY"
	return 0
}

main() {
	if [[ "${#ARGS[@]}" -gt 0 ]]; then
		parse_args "${ARGS[@]}"
	fi

	determine_connection_list
	determine_menu_title
	generate_rofi_menu

	if [[ "$CONNECTION_STATE" == false ]] && [[ -n "$PICKED_ENTRY" ]]; then
		activate_connection
	fi
	if [[ "$CONNECTION_STATE" == true ]] && [[ -n "$PICKED_ENTRY" ]]; then
		deactivate_connection
	fi

	exit 0
}

main

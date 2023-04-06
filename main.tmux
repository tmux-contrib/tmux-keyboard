#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=1090
source "${CURRENT_DIR}/scripts/helpers.sh"

# shellcheck disable=1090
keyboard_layout="#(${CURRENT_DIR}/scripts/keyboard.sh)"
keyboard_layout_pattern="\#{keyboard_layout}"

tmux_update_option() {
	local option="$1"
	local option_value
	local new_option_value

	option_value="$(tmux_get_option "$option")"
	new_option_value="$(tmux_interpolate "$option_value" "$keyboard_layout_pattern" "$keyboard_layout")"

	tmux_set_option "$option" "$new_option_value"
}

main() {
	tmux_update_option "status-right"
	tmux_update_option "status-left"
}

main

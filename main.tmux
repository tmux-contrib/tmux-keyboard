#!/bin/bash

# tmux-keyboard plugin entry point.
#
# This plugin provides a #{keyboard_layout} format string that displays
# the current keyboard layout in the tmux status bar.
#
# Usage:
#   Add #{keyboard_layout} to your status-left or status-right option.
#
# Example:
#   set -g status-right "#{keyboard_layout} | %H:%M"

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=scripts/core.sh
source "${CURRENT_DIR}/scripts/core.sh"

keyboard_layout="#(${CURRENT_DIR}/scripts/tmux-keyboard.sh)"
keyboard_layout_pattern="\#{keyboard_layout}"

# Update a tmux option by interpolating the keyboard layout pattern.
#
# Retrieves the current value of the specified tmux option, replaces any
# occurrences of #{keyboard_layout} with the actual keyboard layout command,
# and sets the option to the new value.
#
# Globals:
#   keyboard_layout - The tmux command string to get keyboard layout
#   keyboard_layout_pattern - The pattern to replace (#{keyboard_layout})
# Arguments:
#   $1 - The name of the tmux option to update (e.g., "status-right")
# Returns:
#   0 on success
tmux_update_option() {
	local option="$1"
	local option_value
	local new_option_value

	option_value="$(tmux_get_option "$option")"
	new_option_value="$(tmux_interpolate "$option_value" "$keyboard_layout_pattern" "$keyboard_layout")"

	tmux_set_option "$option" "$new_option_value"
}

# Main entry point for the plugin.
#
# Initializes the keyboard layout plugin by updating the status-right
# and status-left options to interpolate the keyboard_layout pattern.
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   0 on success
main() {
	tmux_update_option "status-right"
	tmux_update_option "status-left"
}

main

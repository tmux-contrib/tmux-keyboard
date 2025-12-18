#!/bin/bash

# Get the current keyboard layout name.
#
# Retrieves the currently active keyboard layout from the system.
# Supports both macOS and Linux platforms.
#
# On macOS:
#   Reads from the HIToolbox preferences plist to get the current
#   keyboard layout name from AppleSelectedInputSources.
#
# On Linux:
#   Uses setxkbmap to query the current keyboard symbols configuration.
#
# Globals:
#   None
# Arguments:
#   None
# Outputs:
#   The current keyboard layout name to stdout
# Returns:
#   0 on success
# Dependencies:
#   - macOS: defaults, grep, sed
#   - Linux: setxkbmap, awk
main() {
	if [ "$(uname)" == "Darwin" ]; then
		defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep -E -w 'KeyboardLayout Name' | sed -E 's/^.+ = "?([^\"]+)\"?;$/\1/'
	elif [ "$(uname)" == "Linux" ]; then
		setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}'
	fi
}

main

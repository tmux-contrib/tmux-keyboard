#!/bin/bash

main() {
	if [ "$(uname)" == "Darwin" ]; then
		defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep -E -w 'KeyboardLayout Name' | sed -E 's/^.+ = "?([^\"]+)\"?;$/\1/'
	elif [ "$(uname)" == "Linux" ]; then
		setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}'
	fi
}

main

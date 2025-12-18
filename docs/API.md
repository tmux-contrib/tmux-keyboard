# tmux-keyboard API Documentation

This document describes the public API for the tmux-keyboard plugin.

## Table of Contents

- [Overview](#overview)
- [Format Strings](#format-strings)
- [Core Functions](#core-functions)
  - [tmux_get_option](#tmux_get_option)
  - [tmux_set_option](#tmux_set_option)
  - [tmux_interpolate](#tmux_interpolate)
- [Plugin Functions](#plugin-functions)
  - [main (tmux-keyboard.sh)](#main-tmux-keyboardsh)
  - [tmux_update_option](#tmux_update_option)

---

## Overview

The tmux-keyboard plugin displays the current keyboard layout in the tmux status bar.
It supports both macOS and Linux platforms.

## Format Strings

| Format String       | Description                          |
|---------------------|--------------------------------------|
| `#{keyboard_layout}` | Current keyboard layout name         |

**Usage Example:**
```tmux
set -g status-right "#{keyboard_layout} | %H:%M"
```

---

## Core Functions

Located in `scripts/core.sh`.

### tmux_get_option

Get a tmux option value.

Retrieves the value of a global tmux option. If the option is not set,
returns the provided default value.

```bash
tmux_get_option "option_name" "default_value"
```

**Arguments:**
- `$1` - The name of the tmux option to retrieve
- `$2` - The default value to return if the option is not set

**Outputs:**
- The option value or default value to stdout

**Returns:**
- `0` on success

---

### tmux_set_option

Set a tmux option value.

Sets a global tmux option to the specified value.

```bash
tmux_set_option "option_name" "value"
```

**Arguments:**
- `$1` - The name of the tmux option to set
- `$2` - The value to set the option to

**Returns:**
- `0` on success, non-zero on failure

---

### tmux_interpolate

Interpolate a pattern in content with a value.

Replaces a pattern in the given content string with the specified value.
This is useful for substituting tmux format strings with actual values.

```bash
tmux_interpolate "content with #{pattern}" "#{pattern}" "replacement"
# Output: "content with replacement"
```

**Arguments:**
- `$1` - The content string containing the pattern
- `$2` - The pattern to replace
- `$3` - The value to substitute for the pattern

**Outputs:**
- The content with the pattern replaced by the value

**Returns:**
- `0` on success

---

## Plugin Functions

### main (tmux-keyboard.sh)

Located in `scripts/tmux-keyboard.sh`.

Get the current keyboard layout name.

Retrieves the currently active keyboard layout from the system.
Supports both macOS and Linux platforms.

```bash
./scripts/tmux-keyboard.sh
# Output: "U.S." (or current layout name)
```

**Platform Behavior:**
- **macOS:** Reads from HIToolbox preferences plist
- **Linux:** Uses setxkbmap to query keyboard symbols

**Arguments:**
- None

**Outputs:**
- The current keyboard layout name to stdout

**Returns:**
- `0` on success

**Dependencies:**
- macOS: `defaults`, `grep`, `sed`
- Linux: `setxkbmap`, `awk`

---

### tmux_update_option

Located in `main.tmux`.

Update a tmux option by interpolating the keyboard layout pattern.

Retrieves the current value of the specified tmux option, replaces any
occurrences of `#{keyboard_layout}` with the actual keyboard layout command,
and sets the option to the new value.

```bash
tmux_update_option "status-right"
```

**Arguments:**
- `$1` - The name of the tmux option to update (e.g., "status-right")

**Returns:**
- `0` on success

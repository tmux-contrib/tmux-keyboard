# tmux-keyboard

A tmux plugin that displays the current keyboard layout in the status bar.

## Installation

```tmux
# configure the tmux plugins manager
set -g @plugin "tmux-plugins/tpm"

# official plugins
set -g @plugin 'tmux-contrib/tmux-keyboard'
```

## Usage

Add the `#{keyboard_layout}` format string to your status bar:

```tmux
set -g status-right "#{keyboard_layout} | %H:%M"
```

### Format Strings

| Format String        | Description                |
|----------------------|----------------------------|
| `#{keyboard_layout}` | Current keyboard layout    |

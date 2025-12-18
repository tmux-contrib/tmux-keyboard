# tmux-keyboard

A tmux plugin that displays the current keyboard layout in the status bar.

## Features

- Display the current keyboard layout name
- Cross-platform support (macOS and Linux)
- Lightweight with no external dependencies

## Requirements

- **macOS:** None (uses built-in `defaults` command)
- **Linux:** `setxkbmap`

## Installation

### Using TPM

Add the following line to your `~/.tmux.conf`:

```tmux
set -g @plugin 'tmux-contrib/tmux-keyboard'
```

Then press `prefix` + <kbd>I</kbd> to install.

### Manual

Clone the repository:

```bash
git clone https://github.com/tmux-contrib/tmux-keyboard ~/.tmux/plugins/tmux-keyboard
```

Add to your `~/.tmux.conf`:

```tmux
run-shell ~/.tmux/plugins/tmux-keyboard/main.tmux
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

## Documentation

See [docs/API.md](docs/API.md) for the full API documentation.

## License

[MIT](LICENSE)

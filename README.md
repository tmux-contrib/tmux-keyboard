# tmux-keyboard

Show your current keyboard layout in the tmux status bar — supports macOS and Linux.

## Installation

Add this plugin to your `~/.tmux.conf`:

```tmux
set -g @plugin 'tmux-contrib/tmux-keyboard'
```

And install it by running `<prefix> + I`.

## Usage

Add the `#{keyboard_layout}` format string to your status bar:

```tmux
set -g status-right "#{keyboard_layout} | %H:%M"
```

### Format Strings

| Format String        | Description                |
|----------------------|----------------------------|
| `#{keyboard_layout}` | Current keyboard layout    |

## Development

### Prerequisites

Install dependencies using [Nix](https://nixos.org/):

```sh
nix develop
```

Or install manually: `bash`, `tmux`, `bats`

### Running Tests

```sh
bats tests/
```

### Debugging

Enable trace output with the `DEBUG` environment variable:

```sh
DEBUG=1 /path/to/tmux-keyboard/scripts/tmux_keyboard.sh
```

## License

MIT

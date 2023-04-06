# tmux-keyboard

This plugin displays the current keyboard layout.

## Installation

This is a plugin for [tmux plugin
manager](https://github.com/tmux-plugins/tpm). You can install it by adding the
following line in your tmux config.

```shell
set -g @plugin 'tmux-contrib/tmux-keyboard'
```

## Getting Started

You can use the `#{keyboard_layout}` variable in your existing status line.

```shell
set-option -g status-right '#{keyboard_layout}'
```

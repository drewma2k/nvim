# Neovim

## Features:
  - Install LSPs, Linters, DAPs, with `mason.nvim`
  - Automatic default configuration of installed LSPs
  - Autocomplete with `blink.cmp`
  - Fully-Featured Java / SpringBoot config with `nvim-java`

## Requirements
- `ripgrep` for fuzzy-finding
- Any [NerdFont](https://www.nerdfonts.com) for icon support
- CSI-u support (TAB vs CTRL-i)

## Post-Installation

### TreeSitter grammars
Install with `:TSInstall <language>`

### Language Servers
Use `:LspInstall` and select a server for the filetype you are currently editing.

## Configuration

### Keybinds
Keybinds are configured in `/lua/config/key-mapping.lua`

## Goals
- Be as lightweight as possible
- Provide essential IDE features

## Troubleshooting
- CSI-u was very difficult to enable, here is how I did it for the record:
- both TAB and C-I must be mapped as per `:h CTRL-I`
- iterm must be configured to send CSI-u
- iterm must be configured with "Apps can change how keys are reported"
  - otherwise, escape was not working in insert mode and sending literal "u27"
- tmux must have `set -s extended-keys on`

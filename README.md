# Nvim configuration
[dashboard](screenshots/dashboard.png)
[screenshot1](screenshots/screenshot1.png)
[screenshot2](screenshots/screenshot2.png)

## Features:
  - Minimal UI; icons are kept to a tasteful minimum (this is a cli tool after all)
  - Automatic default configuration of installed LSPs
  - Useable with default vim colorschemes
  - Minimal statusbar that works out of the box with any colorscheme
  - base16 colorschemes included, modified to leave telescope alone
  - which-key for keybind discovery
  - completion with `cmp`

## Requirements
- `fortune` and `cowsay` are required for default dashboard
- `ripgrep` for fuzzy-finding words
- Any [NerdFont](https://www.nerdfonts.com) for icon support

## Installation
```
git clone https://github.com/drewma2k/nvim ~/.config/nvim
nvim +PackerSync
```

## Post-Installation

### TreeSitter grammars
Install with `:TSInstall <language>`

### Language Servers
Use `:LspInstall` and select a server for the filetype you are currently editing.

## Configuration

### Colorscheme
base16 colorschemes are included for best integration with terminal colors.
colorscheme is configured in `/lua/nvim_settings.lua`

### Keybinds
Keybinds are configured in `/lua/config/key-mapping.lua`

### Plugins
Plugins are added in `/lua/plugin/init.lua`.
Plugins with small configurations are configured in the above mentioned file, 
while those with larger configurations have a dedicated file in `/lua/config/plugin/`

### LSP
LSPs installed by `:LspInstall` are automatically configured with nvim-lspconfig.
Custom configurations are done in a dedicated file in `/lua/config/lsp/`

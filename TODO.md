# TODO

## General
- stable install from scratch (yaml cli for nvim-java, neorg ts parser...)
- keybind logical groups
- set messagesopt? use noise to hide hit enter prompts?
  - messageopt still flashes cmd output even with wait:0
- do I really need a plugin for statuscol
- colors in css files

## Python
- make debugpy work without having to install it into the virtual env of the
  code
- make pylsp work without activating project venv shell
- better python lsp configuration, a la lazyvim

## Plugins
- consider nvim-surround / mini.surround
- try vGit plugin
- pick one picker: telescope vs fzf-lua (both installed; only telescope is wired)

## Cleanup
- key-mapping.lua: replace top-level `pcall(require,...)` early-returns (dap line 3-6, telescope line 55-58) with localized pcalls — failures currently drop every keymap below
- autocmds.lua: switch LSP `document_highlight` from `CursorMoved` to `CursorHold` (updatetime=250 already set)
- autocmds.lua: `vim.highlight.on_yank` → `vim.hl.on_yank` (deprecated in 0.11)
- settings.lua: dedupe `ignorecase`/`smartcase` (set on lines 24-25 and again 47-48)
- settings.lua: drop dead vim-plug-era globals — `vim.g.go_*`, `vim.g.polyglot_disabled`, `vim.g.table_mode_syntax`, `vim.g.db_ui_*`, `vim.g.markdown_folding`
- settings.lua: drop `vim.opt.tags = './.tags'` unless ctags is still in use
- settings.lua: revisit `vim.opt.shell = '/bin/zsh'` — env shell is fish, so this is an override; either comment why or remove
- settings.lua: replace the Bogiefile augroup (51-56) with `vim.filetype.add({ filename = { Bogiefile = 'yaml' } })`
- key-mapping.lua: delete unused `colors` prototype function (180-198) or wire it to a key
- add `.luarc.json` at repo root to silence lua-ls `undefined global 'vim'` noise
- consider splitting `lua/plugins/ui.lua` (~595 LOC) into smaller files by concern

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

## Modernization review (2026-06)

### High priority (broken / deprecated)
- lsp.lua:48 — drop per-call `vim.lsp.buf.hover` border wrapper; use `vim.o.winborder = 'single'` (0.11) and/or `vim.diagnostic.config({ float = { border = ... } })`
- lsp.lua:78 — `vim.diagnostic.open_float` `source = 'always'` is silently ignored; use `source = true`
- lsp.lua:89 — mason-lspconfig `automatic_installation` deprecated; use `ensure_installed` + `automatic_enable`
- lsp.lua:102 — verify `vim.lsp.config('*', opts)` actually merges capabilities to servers; consider setting `vim.lsp.config['*']` before `automatic_enable`
- conform.lua:6 — `stylelua` typo, should be `stylua` (Lua format currently no-ops)
- settings.lua:32 — `completeopt = 'menu,menuone,noselect,noinsert'`: `noselect` + `noinsert` contradict; drop `noinsert`

### Medium priority (modernization)
- evaluate folke/snacks.nvim migration to replace alpha + dressing + fidget + statuscol + indent-blankline
- ui.lua:93 — dressing.nvim is in maintenance; switch to snacks.input or noice
- consolidate file explorers: oil + nvim-tree both loaded; pick one (snacks.explorer / mini.files / neo-tree are more active than nvim-tree)
- ui.lua:147 — replace `tabline.vim` with bufferline.nvim or a custom tabline function, or drop
- git.lua + mini.lua — gitsigns + mini.diff + codediff + diffview overlap; pick one hunk-sign source
- completion.lua:13 — drop `vim-snippets` / snipmate loader; friendly-snippets covers it
- statuscol.nvim — 0.11 native `statuscolumn` is capable; reconsider plugin need
- key-mapping.lua:155 — `<leader>cp` calls `require('CopilotChat')` but no AI plugin enabled; install or remove keymap (CodeCompanion/Avante are current trends)
- delete disabled plugin specs instead of `enabled = false`: noice, markview, rest.nvim, mdx, conjure, videre, markdown-plus, copilot.lua

### Low priority (polish)
- settings.lua:96 — drop `vim.g.polyglot_disabled` (vim-polyglot not installed)
- consolidate the three `LspAttach` autocmds (settings.lua folding, settings.lua semantic-tokens, lsp.lua keymaps) into one
- settings.lua:125 — `vim.opt.path = ".,,**"` slows `gf`/`:find` on large repos; probably unused with telescope/fzf-lua
- move or delete `lua/wip/` (vscode_maven, test_jdtls, ai_diagnostics)
- init.lua / lazy.lua / key-mapping.lua — `mapleader` set in two places; keep only the one in lazy.lua (before plugins load)
- settings.lua:114-116 — LspAttach uses `vim.wo` (window-fragile); prefer `vim.opt_local` or `nvim_set_option_value` with explicit win
- enable native inlay hints (`vim.lsp.inlay_hint.enable(true)`) with a toggle keymap
- try `vim.diagnostic.config({ virtual_lines = ... })` (0.11 LSP-Lens-style virtual lines)

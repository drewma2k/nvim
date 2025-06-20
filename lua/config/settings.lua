-- General Settings
vim.opt.grepprg='rg --vimgrep --no-heading --smart-case'
vim.o.wrap = false

vim.o.conceallevel=2
vim.o.concealcursor="ni"

--Set highlight on search
vim.o.hlsearch = false

--Relative Number
vim.o.relativenumber = true

--Make line numbers default
vim.wo.number = true

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect,noinsert'

-- show statusbar on all windows
vim.o.laststatus = 2

-- dont show messages like -- INSERT --
vim.opt.showmode = false

-- autoindent
vim.opt.autoindent = true

-- disable mouse
vim.opt.mouse = ''

-- match uppercase in search
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- custom filetypes
vim.cmd [[
  augroup Bogie
    autocmd!
    autocmd BufNewFile,BufRead Bogiefile setfiletype yaml
  augroup end
]]

-- tab settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- mark column 80, max length of lines
vim.o.colorcolumn = '80'

-- ctags files
vim.opt.tags = './.tags'

-- vim-go settings
vim.g.go_metalinter_command = "golangci-lint"

vim.opt.shell = '/bin/zsh'
vim.opt.cursorline = true

-- disable some features of vim-go that are covered by native lsp
vim.g.go_gopls_enabled = 0
vim.g.go_code_completion_enabled = 0

-- vim-dadbod-ui use nerdfonts
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_use_nerd_fonts = 1

-- shortmess
-- disable start screen
vim.opt.shortmess = vim.opt.shortmess + 'I'

-- change directory when switching buffers etc
-- vim.opt.autochdir = true

-- Use system clipboard for yanking and pasting (BAD IDEA)
-- vim.opt.clipboard = 'unnamedplus'

vim.opt.splitbelow = true

-- disable for markdown because indent is broken
-- :Format conflicts for java
vim.g.polyglot_disabled = { 'markdown', 'java' }

vim.g.table_mode_syntax = 0

-- folding
vim.opt.foldenable = true
vim.opt.foldminlines = 1
vim.opt.foldignore = ""
vim.g.markdown_folding = 0 -- use treesitter folding for markdown
vim.opt.foldmethod='expr'
vim.opt.foldexpr='v:lua.vim.treesitter.foldexpr()'
vim.opt.foldtext=''

-- lsp folding; requires nightly
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client:supports_method('textDocument/foldingRange') then
			vim.wo.foldmethod = 'expr'
			vim.wo.foldexpr = 'v:lua.vim.lsp.foldexpr()'
			vim.wo.foldtext = ""
		end
	end,
})

vim.opt.foldlevel = 99

vim.opt.wildmode = 'longest:full,full'

vim.opt.path = ".,,**"

-- disable lsp syntax highlighting
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		client.server_capabilities.semanticTokensProvider = nil
	end,
});

-- diff
vim.opt.diffopt="internal,filler,closeoff,indent-heuristic,linematch:60,algorithm:histogram"

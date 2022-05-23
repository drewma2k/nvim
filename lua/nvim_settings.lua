-- General Settings
vim.o.wrap = false

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = 'a'

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

--Set colorscheme
--vim.o.termguicolors = true
--vim.cmd [[colorscheme onedark]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'


-- run commands
vim.cmd[[highlight clear SignColumn]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder ctermbg=none]]
vim.cmd [[autocmd! ColorScheme * highlight NormalFloat ctermbg=none]]
vim.cmd [[colorscheme default]]
vim.cmd [[highlight link FloatBorder NormalFloat]]
vim.cmd [[highlight Pmenu ctermbg=darkgrey ctermfg=white cterm=none]]
vim.cmd [[highlight PmenuSel ctermbg=white ctermfg=DarkGrey]]

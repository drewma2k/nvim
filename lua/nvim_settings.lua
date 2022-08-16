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
vim.cmd [[highlight clear SignColumn]]
vim.cmd [[highlight VertSplit cterm=none]]
vim.cmd [[highlight Pmenu ctermbg=darkgrey ctermfg=white cterm=none]]
vim.cmd [[highlight PmenuSel ctermbg=white ctermfg=DarkGrey]]
vim.cmd [[colorscheme base16-eighties]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

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

vim.cmd [[
  augroup Bogie
    autocmd!
    autocmd BufNewFile,BufRead Bogiefile setfiletype yaml
  augroup end
]]

-- tab settings
vim.o.tabstop=4
vim.o.shiftwidth=4

-- mark column 80, max length of lines
vim.o.colorcolumn = '80'

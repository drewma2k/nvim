-- local ok, base = pcall(require, 'base16-colorscheme')
-- if not ok then
-- 	return
-- end

-- local ok, colors = pcall(require, 'colors')
-- if not ok then
-- 	return
-- end


-- set colorscheme, lua way
-- base.setup(colors['solarized-dark'])

-- better default highlight groups
-- vim.cmd[[hi Pmenu ctermbg=darkgrey ctermfg=white]]
-- vim.cmd[[hi PmenuSel ctermbg=grey ctermfg=lightgrey]]
-- vim.cmd[[hi ColorColumn ctermbg=darkgrey]]
-- vim.cmd[[hi clear SignColumn]]
-- vim.cmd[[hi SignColumn guibg=darkgrey]]
-- vim.cmd[[hi LineNr guibg=darkgrey]]
-- vim.cmd[[hi TelescopeNormal ctermbg=black]]
-- vim.cmd[[hi WhichKeyFloat ctermbg=black]]

--Set colorscheme
-- vim.cmd [[colorscheme base16-eighties]]
-- vim.cmd [[colorscheme defaultplus]]
-- vim.cmd[[colorscheme base16-solarized-dark]]
-- vim.cmd[[colorscheme solarized]]

-- temporary fix for diff
-- vim.cmd[[hi DiffAdd gui=inverse]]
-- vim.cmd[[hi DiffDelete gui=inverse]]
-- vim.cmd[[hi DiffText gui=inverse]]
-- vim.cmd[[hi DiffChange gui=inverse]]
-- vim.cmd[[hi NormalFloat guibg=None]] -- for floats with border

-- brighter signcol and number col
-- vim.api.nvim_set_hl(0, 'SignColumn', {bg=colors['solarized-dark']['base01']})
-- vim.api.nvim_set_hl(0, 'LineNr', {bg=colors['solarized-dark']['base01']})
-- vim.api.nvim_set_hl(0, 'LineNr', {bg=colors['solarized-dark']['base01']})
-- vim.api.nvim_set_hl(0, 'DiagnosticSignHint', {bg=colors['solarized-dark']['base01']})
-- vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', {bg=colors['solarized-dark']['base01']})
-- vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', {bg=colors['solarized-dark']['base01']})
-- vim.api.nvim_set_hl(0, 'DiagnosticSignError', {bg=colors['solarized-dark']['base01']})

-- local ok, onedark = pcall(require, 'onedark')
-- if not ok then
-- 	return
-- end
-- onedark.load()
-- vim.cmd[[set termguicolors]]

-- everforest transparent
-- vim.cmd[[let g:everforest_transparent_background=2]]
-- vim.cmd[[colorscheme everforest]]
-- vim.cmd[[hi CursorLine guibg=none gui=underline]]
-- vim.cmd[[hi ColorColumn guibg=none gui=underline]]
-- vim.cmd[[hi StatusLine gui=underline]]
-- vim.cmd[[hi StatusLineNC gui=underline]]
vim.cmd[[colorscheme moonfly]]

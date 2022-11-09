local ok, _ = pcall(require, 'base16-colorscheme')
if not ok then
	return
end

-- better default highlight groups
vim.cmd[[hi Pmenu ctermbg=darkgrey ctermfg=white]]
vim.cmd[[hi PmenuSel ctermbg=grey ctermfg=lightgrey]]
vim.cmd[[hi ColorColumn ctermbg=darkgrey]]
vim.cmd[[hi clear SignColumn]]
vim.cmd[[hi TelescopeNormal ctermbg=black]]
vim.cmd[[hi WhichKeyFloat ctermbg=black]]

--Set colorscheme
vim.cmd [[colorscheme base16-eighties]]
-- vim.cmd [[colorscheme defaultplus]]

-- temporary fix for diff
vim.cmd[[hi DiffAdd gui=inverse]]
vim.cmd[[hi DiffRemove gui=inverse]]
vim.cmd[[hi DiffText gui=inverse]]

local ok, _ = pcall(require, 'base16-colorscheme')
if not ok then
	return
end

--Set colorscheme
vim.cmd [[colorscheme base16-eighties]]

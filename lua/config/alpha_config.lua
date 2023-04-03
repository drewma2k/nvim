local ok, alpha = pcall(require, 'alpha')
if not ok then
	return
end
local ok, dashboard = pcall(require, 'alpha.themes.dashboard')
if not ok then
	return 
end

-- menu
dashboard.section.buttons.val = {
  -- dashboard.button("SPC f f", "  Find file", "<cmd>Telescope find_files<cr>"),
  dashboard.button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
  dashboard.button("SPC f w", "  Find Word  ", ":Telescope live_grep<CR>"),
  dashboard.button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>"),
  dashboard.button("SPC s s", "  Settings", ":e ~/.config/nvim/ | :cd %:p:h <CR>"),
}

alpha.setup(dashboard.opts)

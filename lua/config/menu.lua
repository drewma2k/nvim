local ok, menu = pcall(require, "menu")
-- if not ok then
-- 	return
-- end

-- Keyboard users
vim.keymap.set("n", "<C-CR>", function()
  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  menu.open(options, { mouse = false, border = true})
end, {})

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  menu.open(options, { mouse = true })
end, {})

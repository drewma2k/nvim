local ok, outline = pcall(require, "outline")
if not ok then
  return
end

vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "toggle Outline"})
outline.setup()

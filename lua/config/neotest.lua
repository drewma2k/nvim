local ok, neotest = pcall(require, "neotest")
if not ok then
  return
end
neotest.setup({
  adapters = {
    require("neotest-python")
		-- 	({
		-- 	python = "/Users/yde639/.venv/bin/python",
		-- 	runner = "/Users/yde639/.venv/bin/pytest"
		-- })
  },
	{
		output = {
			open_on_run = true
		}
	}
})

vim.keymap.set("n", "<leader>tr", "<cmd>Neotest run<CR>", { desc = "Run tests" })
vim.keymap.set("n", "<leader>td", function ()
	require("neotest").run.run({strategy = "dap"})
end, { desc = "Run test" })

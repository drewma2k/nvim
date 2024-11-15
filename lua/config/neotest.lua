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

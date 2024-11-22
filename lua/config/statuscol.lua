local ok, statuscol = pcall(require, 'statuscol')
if not ok then
	return
end
local ok, builtin = pcall(require, 'statuscol.builtin')
if not ok then
	return
end


statuscol.setup({
	ft_ignore = {
		'NvimTree', 'help', 'alpha', 'Trouble', 'mason', 'Outline'
	},
	segments = {
		-- {
		-- 	sign = {
		-- 		name = { 'Marks_*' },
		-- 		maxwidth = 1,
		-- 		colwidth = 1,
		-- 		auto = false
		-- 	},
		-- 	click = 'v:lua.ScSa'
		-- },
		-- { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
		{
			CLICK = "v:lua.ScSa",
			sign = {
				name = { ".*" },
				condition = { true, builtin.not_empty },
				click = "v:lua.ScLa",
			}
		},
		{
			sign = {
				-- name = { 'GitSigns' },
				namespace = { 'gitsign' },
				maxwidth = 1,
				colwidth = 1,
				auto = false,
			},
			click = 'v:lua.ScSa'
		},
		{
			text = { builtin.lnumfunc, " " },
			condition = { true, builtin.not_empty },
			click = "v:lua.ScLa",
		},
	},
})

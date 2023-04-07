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
		'NvimTree', 'help', 'alpha', 'Trouble', 'mason'
	},
	segments = {
		{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
		{
			click = "v:lua.ScSa",
			sign = {
				name = { ".*" },
				condition = { true, builtin.not_empty },
				click = "v:lua.ScLa",
			}
		},
		{
			text = { builtin.lnumfunc, " " },
			condition = { true, builtin.not_empty },
			click = "v:lua.ScLa",
		},
		{
			sign = {
				name = { 'GitSigns' },
				maxwidth = 1,
				colwidth = 1,
				auto = false,
			},
			click = 'v:lua.ScSa'
		}
	},
})

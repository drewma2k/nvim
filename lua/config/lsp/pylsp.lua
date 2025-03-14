local mypy_config = {enabled = true}
if vim.env.VIRUTAL_ENV ~= nil then
	mypy_config = {
		enabled = true,
		overrides = {'--follow-untyped-imports', true, "--python-executable", vim.env.VIRTUAL_ENV .. "/bin/python"}
	}
end
return {
	settings = {
		pylsp = {
			plugins = {
				pylsp_mypy=mypy_config,
				flake8 = {
					enabled = false
				},
				rope_autoimport = {
					enabled = false
				},
				ruff = {
					enabled = true
				},
				pycodestyle = {
					enabled = false
				},
				black = {
					enabled = true
				},
				pylint = {
					enabled = false
				},
				jedi_hover = {
					enabled = true
				},
			}
		}
	}
}

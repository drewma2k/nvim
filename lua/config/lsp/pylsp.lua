return {
	-- cmd = { '/Users/yde639/.venv/bin/pylsp' },
	settings = {
		pylsp = {
			plugins = {
				flake8 = {
					enabled = false
				},
				rope_autoimport = {
					enabled = false
				},
				ruff = {
					enabled = false
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

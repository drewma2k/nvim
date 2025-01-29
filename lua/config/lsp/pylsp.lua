return {
	-- cmd = { '/Users/yde639/.venv/bin/pylsp' },
	settings = {
		pylsp = {
			plugins = {
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

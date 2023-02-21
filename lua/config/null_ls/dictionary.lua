local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local HOVER = methods.internal.HOVER

local insert_def = function (meaning, strings)
	for i, definition in ipairs(meaning.definitions) do
		local def = definition.definition
		if string.len(def) > 60 then
			local sub1 = string.sub(def, 0, string.len(def) / 2)
			local sub2 = string.sub(def, string.len(def) / 2 + 1, string.len(def) - 1)
			def = string.format("%s-\n\t\t %s", sub1, sub2)
		end
		table.insert(strings, string.format('\t%s: %s', i, def))
	end
end

local f = function(_, done)
	local cword = vim.fn.expand("<cword>")
	local send_definition = function(def)
		done(def)
	end

	require("plenary.curl").request({
		url = "https://api.dictionaryapi.dev/api/v2/entries/en/" .. cword,
		method = "get",
		callback = vim.schedule_wrap(function(data)
			if not (data and data.body) then
				send_definition("no definition available")
				return
			end

			local ok, decoded = pcall(vim.json.decode, data.body)
			if not ok or not (decoded and decoded[1]) then
				send_definition("no definition available")
				return
			end

			local strings = {}
			table.insert(strings, '----------------------------------------')
			for _, meaning in pairs(decoded[1].meanings) do
				table.insert(strings, meaning['partOfSpeech'])
				insert_def(meaning, strings)
				table.insert(strings, '----------------------------------------')
			end
			send_definition(strings)
		end),
	})
end

return h.make_builtin({
	name = "dictionary",
	method = HOVER,
	filetypes = { "org", "text", "markdown" },
	generator = {
		fn = f,
		async = true,
	},
	meta = {
		url = "https://dictionaryapi.dev/api/v2/entries/en/",
		description = "Shows the first available definition for the current word under the cursor.",
		notes = {
			"Depends on Plenary's `curl` module, which itself depends on having `curl` installed and available on your `$PATH`.",
		},
	},
})

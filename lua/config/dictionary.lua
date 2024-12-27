local M = {}

local function get_def(word)
	local cmd = 'dict -d wn ' .. word.. " 2<&1"
	local results = {}
	local output = io.popen(cmd)
	if output == nil then
		return results
	end
	for line in output:lines() do
		table.insert(results, line)
	end
	if (string.sub(results[1], 1, 2) == "No") then
		if results[2] then
			local suggestions = {}
			for suggestion in string.gmatch(results[2], "%w+") do
				table.insert(suggestions, suggestion)
			end
			local new_word = suggestions[2]
			if not (new_word == word) then
				return get_def(new_word)
			end
		end
	end
	return results
end

function M.def()
	local cword = vim.fn.expand("<cword>")
	get_def(cword)
end

return M


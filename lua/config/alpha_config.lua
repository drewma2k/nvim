local ok, alpha = pcall(require, 'alpha')
if not ok then
	return
end
local ok, dashboard = pcall(require, 'alpha.themes.dashboard')
if not ok then
	return
end

local ascii = require('ascii').art.planets.planets.saturn
local hl = {}
local rowhls = {}
for i = 1, #ascii do
	for c = 1, #ascii[1] do
		-- if ascii[i]:sub(c, c) ~= "8" then
		if (";:-.,"):find(ascii[i]:sub(c, c), 1, true) then
			table.insert(rowhls, { "TSRainbowYellow", c-1, c })
		else
			table.insert(rowhls, { "DiagnosticInfo", c-1, c })
		end
	end
	if rowhls ~= {} then
		table.insert(hl, rowhls)
		rowhls = {}
	end
end
dashboard.section.header.val = ascii
dashboard.section.header.opts.hl = hl


alpha.setup(dashboard.opts)

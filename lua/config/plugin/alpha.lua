local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")


-- header fortune | cowsay
-- local prefix = os.getenv("HOMEBREW_PREFIX")
-- local cmd = string.format('%s/bin/fortune | %s/bin/cowsay', prefix, prefix)
-- local handle = io.popen(cmd)
-- local line
-- local strings = {}
--
-- if handle then
--   line = handle:read("*l")
-- end
--
-- while line ~= nil do
--   table.insert(strings, line)
--   if handle then
--     line = handle:read("*l")
--   end
-- end
--
-- dashboard.section.header.val = strings


-- menu
dashboard.section.buttons.val = {
  dashboard.button("SPC f f", "  Find file", "<cmd>Telescope find_files<cr>"),
  dashboard.button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
  dashboard.button("SPC f w", "  Find Word  ", ":Telescope live_grep<CR>"),
  dashboard.button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>"),
  dashboard.button("SPC s s", "  Settings", ":e ~/.config/nvim/ | :cd %:p:h <CR>"),
}

alpha.setup(dashboard.opts)

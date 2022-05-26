local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")


-- header fortune | cowsay
local handle = io.popen("/opt/homebrew/bin/fortune | /opt/homebrew/bin/cowsay")
local line
local strings = {}

if handle then
  line = handle:read("*l")
end

while line ~= nil do
  table.insert(strings, line)
  if handle then
    line = handle:read("*l")
  end
end

dashboard.section.header.val = strings


-- menu
dashboard.section.buttons.val = {
  dashboard.button("SPC f f", "  Find file", "<cmd>Telescope find_files<cr>"),
  dashboard.button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
  dashboard.button("SPC f w", "  Find Word  ", ":Telescope live_grep<CR>"),
  dashboard.button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>"),
  dashboard.button("SPC t h", "  Themes  ", ":Telescope themes<CR>"),
  dashboard.button("SPC s s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
}

alpha.setup(dashboard.opts)

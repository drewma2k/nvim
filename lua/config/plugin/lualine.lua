-- LUALINE
-- customize auto theme
local custom_auto_theme = require('lualine.themes.auto')

for mode, components in pairs(custom_auto_theme) do
  for component, _ in pairs(components) do
    if component ~= 'a' then
      custom_auto_theme[mode][component] = 'StatusLine'
      -- custom_auto_theme[mode][component].fg = ''
      -- custom_auto_theme[mode][component].bg = bg
      -- custom_auto_theme[mode][component].gui = 'bold,reverse'
    end
  end
  custom_auto_theme[mode].z = custom_auto_theme[mode].b
end
local mode = {
  function()
    return ""
  end,
  padding = { left = 0, right = 0 },
  cond = nil,
}
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_auto_theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'NvimTree' },
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {
      mode,
    },
    lualine_b = {
      {
        'filename',
        path = 0,

      },
      'branch',
      {
        'diagnostics',
        colored = false,
        diagnostics_color = {
          -- Same values as the general color option can be used here.
          error = { bg = "lightgrey", fg = 'red', gui = 'bold' }, --'DiagnosticError', -- Changes diagnostics' error color.
          warn  = { bg = "lightgrey", fg = 'darkorange', gui = 'bold' }, --'DiagnosticWarn',  -- Changes diagnostics' warn color.
          info  = { bg = "lightgrey", fg = 'blue', gui = 'bold' }, --'DiagnosticInfo',  -- Changes diagnostics' info color.
          hint  = { bg = "", fg = '', gui = 'bold,reverse' }, --'DiagnosticHint',  -- Changes diagnostics' hint color.
        }
      },
    },
    lualine_c = {
    },
    lualine_x = {
      {
        'fileformat',
        symbols = {
          unix = "",
          dos = "",
          mac = "",
        },
      },
      {
        'filetype',
        colored = false,
        color = 'StatusLine'
      }
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        path = 1,

      },
    },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'nvim-tree', 'quickfix' }
}

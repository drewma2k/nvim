local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

local ok, copilot_chat = pcall(require, "CopilotChat")
if not ok then
  return
end

copilot.setup({
  panel = {
    enabled = true,
    auto_refresh = true,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<C-l>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 18.x
  server_opts_overrides = {},
})

copilot_chat.setup({
    window = {
      width = 0.25,
    },
    mappings = {
      reset = {
        normal = ""
      }
    }
  })

vim.keymap.set("n", "<leader>cp", function ()
  copilot_chat.open({
      window = {
        -- layout = "float"
				width = 0.33
      }
    })
end)

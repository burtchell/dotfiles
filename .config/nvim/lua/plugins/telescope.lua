-- https://github.com/nvim-telescope/telescope.nvim

-- exit if plugin not found
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    mappings = {
      n = {
        [";;"] = actions.close
      },
    },
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--ignore", "-L", "--hidden", "--files" },
    }
  }
}

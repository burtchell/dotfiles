-- https://github.com/nvim-telescope/telescope.nvim

-- exit if plugin not found
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

vim.api.nvim_set_keymap("n", "<C-p>", ":lua require('telescope.builtin').find_files()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })

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
    },
    git_files = {
      find_command = { "rg", "--ignore", "-L", "--hidden", "--files" },
    },
    live_grep = {
      find_command = { "rg", "--ignore", "-L", "--hidden", "--files" },
    }
  }
}

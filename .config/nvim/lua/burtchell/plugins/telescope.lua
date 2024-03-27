-- https://github.com/nvim-telescope/telescope.nvim

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local telescope = require("telescope")
    local telescope_actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          n = {
            [";;"] = telescope_actions.close
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
    })

    vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>")
    vim.keymap.set("n", "<C-t>", "<cmd>Telescope live_grep<cr>")
  end
}

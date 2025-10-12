-- https://github.com/nvim-telescope/telescope.nvim

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- TODO: unable to search files on WSL with this extension
    -- {
    --   "nvim-telescope/telescope-fzf-native.nvim",
    --   build = "make",
    --   config = function()
    --     require("telescope").load_extension("fzf")
    --   end,
    -- },
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          -- patterns to be ignored by all search functions
          ".git",
          "node_modules",
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          additional_args = function(opts)
            -- live_grep doesn't have an accessible hidden field like find_files, so we can just pass an arg
            return {"--hidden"}
          end
        },
      },
    })

    vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>")
    vim.keymap.set("n", "<C-t>", "<cmd>Telescope live_grep<cr>")
  end
}

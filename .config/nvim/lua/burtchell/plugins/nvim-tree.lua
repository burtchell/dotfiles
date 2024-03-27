-- https://github.com/nvim-tree/nvim-tree.lua

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local nvim_tree = require("nvim-tree")

    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true

    -- OR setup with some options
    nvim_tree.setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
        side = "right",
        number = false,
        relativenumber = false,
        signcolumn = "yes",
      },
      renderer = {
        group_empty = false,
        indent_markers = {
          enable = false,
          icons = {
            corner = "└ ",
            edge = "│ ",
            item = "│ ",
            none = "  ",
          },
        },
        icons = {
          git_placement = "before",
          webdev_colors = true,
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "~",
              staged = "✓",
              unmerged = "",
              renamed = "",
              untracked = "U",
              deleted = "-",
              ignored = "◌",
            },
          },
        },
      },
      filters = {
        dotfiles = false,
        custom = { ".DS_Store" },
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 400,
      },
      actions = {
        open_file = {
          quit_on_open = true,
          resize_window = true,
        },
      },
    })

    vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>")
  end
}

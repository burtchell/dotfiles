-- https://github.com/lewis6991/gitsigns.nvim

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>gd", "<cmd>Gitsigns diffthis<CR>", mode = "n", desc = "Git-diff current file" },
  },
  config = function()
    local gitsigns = require("gitsigns")

    gitsigns.setup({
      signcolumn = true,
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      current_line_blame = false,
    })
  end,
}

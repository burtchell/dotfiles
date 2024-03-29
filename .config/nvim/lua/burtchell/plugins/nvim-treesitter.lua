-- https://github.com/nvim-treesitter/nvim-treesitter
-- provides better per-language color highlighting than nvim/vim defaults 
-- seperate from an LSP

return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
  },

  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "csv",
        "css",
        "cuda",
        "dockerfile",
        "fish",
        "godot_resource",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "toml",
        "vim",
        "yaml",
      },
      auto_install = false,
      highlight = {
        enable = false,
        disable = {}, -- manually disable some languages
        additional_vim_regex_highlighting = true,
      },
      -- indent = {
      --   enable = true,
      -- },
    })
  end
}

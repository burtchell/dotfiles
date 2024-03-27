-- https://github.com/shaunsingh/nord.nvim

return {
  "shaunsingh/nord.nvim",
  priority = 1000,  -- ensure this loads first
  config = function()
    vim.cmd([[colorscheme nord]])
  end,
}
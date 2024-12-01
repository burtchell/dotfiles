-- https://github.com/shaunsingh/nord.nvim

-- return {
--   "shaunsingh/nord.nvim",
--   priority = 1000,  -- ensure this loads first
--   config = function()
--     vim.cmd([[colorscheme nord]])
--   end
-- }

-- https://github.com/ellisonleao/gruvbox.nvim

return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme gruvbox]])
  end
  -- opts = ...
}
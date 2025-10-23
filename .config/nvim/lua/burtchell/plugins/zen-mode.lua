-- https://github.com/folke/zen-mode.nvim

return {
  "folke/zen-mode.nvim",
  -- opts = {
  -- },
  config = function()
    local zen_mode = require("zen-mode")
    zen_mode.setup({
      width = 120,
    })
  end
}

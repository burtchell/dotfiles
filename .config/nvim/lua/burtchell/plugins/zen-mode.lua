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
    vim.keymap.set("n", "<leader>z", ":ZenMode<CR>")
  end
}

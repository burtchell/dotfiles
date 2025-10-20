# https://github.com/MeanderingProgrammer/render-markdown.nvim

return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  config = function()
    local render_md = require("render-markdown")
    render_md.setup({
      enabled = false,
      code = {
        style = "normal",
        border = "thick",
      }
    })

    vim.keymap.set("n", "<leader>r", ":RenderMarkdown toggle<CR>")
    -- vim.keymap.set("n", "<leader>p", ":RenderMarkdown preview")
  end
}

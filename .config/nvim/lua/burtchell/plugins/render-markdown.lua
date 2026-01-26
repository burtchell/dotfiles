-- https://github.com/MeanderingProgrammer/render-markdown.nvim

return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  keys = {
    { "<leader>r", "<cmd>RenderMarkdown toggle<CR>", mode = "n", desc = "Toggle Markdown Rendering" },
  },
  opts = {},
  config = function()
    local render_md = require("render-markdown")
    render_md.setup({
      enabled = false,
      heading = {
        sign = false,
        position = 'inline',
        -- icons = { 'H1 ', 'H2 ', 'H3 ', 'H4 ', 'H5 ', 'H6 ' },
        backgrounds = {
          '',
          '',
          '',
          '',
          '',
          '',
        },
      },
      code = {
        style = "normal",
        border = "thick",
      }
    })
  end
}

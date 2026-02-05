-- https://github.com/akinsho/bufferline.nvim

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',

  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        style_preset = bufferline.style_preset.minimal,
        color_icons = true,
      },
      highlights = {
        -- see :help bufferline-highlights

        -- the color of the path of a buffer with a duplicate filename
        duplicate_selected = {
          italic = true,
        },
        duplicate_visible = {
          italic = true,
        },
        duplicate = {
          italic = true
        },

        modified = {
          fg = { attribute = "fg", highlight = "TabLine" },
        },
        modified_selected = {
          fg = { attribute = "fg", highlight = "Normal" },
        },
        modified_visible = {
          fg = { attribute = "fg", highlight = "TabLine" },
        },

        indicator_selected = {
          fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
      }
    })
  end
}

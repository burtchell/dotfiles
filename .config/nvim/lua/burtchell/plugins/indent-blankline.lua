-- https://github.com/lukas-reineke/indent-blankline.nvim_set_keymap

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local ibl = require("ibl")

    ibl.setup({
      scope = {
        enabled = false,  -- disable highlighting variable scope
      },
      indent = {
        -- char = "│"
        char = "▏"
        -- char = "▎"
      }
    })
  end
}


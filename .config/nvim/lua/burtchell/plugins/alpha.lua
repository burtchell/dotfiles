-- https://github.com/goolord/alpha-nvim

return {
  "goolord/alpha-nvim",

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                __                ]],
      [[  ___   __  __ /\_\    ___ ___    ]],
      [[ / _ `\/\ \/\ \\/\ \  / __` __`\  ]],
      [[/\ \/\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
      [[\ \_\ \_\ \___/  \ \_\ \_\ \_\ \_\]],
      [[ \/_/\/_/\/__/    \/_/\/_/\/_/\/_/]],
    }
    dashboard.section.buttons.val = {
      dashboard.button("f", "Find file", ":Telescope find_files <CR>"),
      dashboard.button("n", "Browse filetree", ":NvimTreeToggle <CR>"),
      dashboard.button("e", "New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("t", "Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "Configuration", ":e ~/.config/nvim/init.lua <CR>"),
      dashboard.button("q", "Quit Neovim", ":qa<CR>"),
    }

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true

    alpha.setup(dashboard.opts)
  end
}

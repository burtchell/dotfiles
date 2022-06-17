-- entry point for nvim
-- store all other files in ./lua/ and require them here

require "options"
require "keymaps"
require "packer_config"
require "colorscheme"

-- lsp
require "lsp"

-- plugins
require "plugins.telescope"
require "plugins.nvim-tree"
require "plugins.cmp"
require "plugins.treesitter"
require "plugins.gitsigns"

-- entry point for nvim
-- store all other files in ./lua/ and require them here

require "options"
require "keymaps"
require "packer_config"
require "colorscheme"
require "autocommands"

-- run impatient early to speed up nvim launch
require "plugins.impatient"

-- lsp
require "lsp"

-- plugins
require "plugins.telescope"
require "plugins.nvim-tree"
require "plugins.cmp"
require "plugins.treesitter"
require "plugins.gitsigns"
require "plugins.autopairs"
require "plugins.comment"
require "plugins.bufferline"
require "plugins.indent-blankline"
require "plugins.lualine"
require "plugins.alpha"
require "plugins.toggleterm"

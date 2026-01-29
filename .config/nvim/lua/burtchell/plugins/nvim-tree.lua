-- https://github.com/nvim-tree/nvim-tree.lua

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
  keys = {
    { "<C-n>", "<cmd>NvimTreeToggle<CR>", mode = "n", desc = "Toggle Filetree" },
  },
	config = function()
		local nvim_tree = require("nvim-tree")

		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- OR setup with some options
		nvim_tree.setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 36,
				side = "right",
				number = false,
				relativenumber = false,
				signcolumn = "yes",
			},
			renderer = {
				group_empty = false,
				indent_markers = {
					enable = false,
					icons = {
						corner = "└ ",
						edge = "│ ",
						item = "│ ",
						none = "  ",
					},
				},
				icons = {
					-- git_placement = "before",
					git_placement = "signcolumn",
					webdev_colors = true,
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "~",
							staged = "=",
							unmerged = "",
							renamed = "r",
							untracked = "u",
							deleted = "-",
							ignored = "o",
						},
					},
				},
			},
			filters = {
				dotfiles = false,
				custom = { ".DS_Store" },
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 400,
			},
			actions = {
				open_file = {
					quit_on_open = true,
					resize_window = true,
				},
			},
		})
	end,
}

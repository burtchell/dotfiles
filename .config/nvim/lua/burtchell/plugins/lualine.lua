-- https://github.com/nvim-lualine/lualine.nvim

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local lualine = require("lualine")

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = "E:", warn = "W:" },
			colored = false,
			update_in_insert = false,
			always_visible = false,
		}

		local diff = {
			"diff",
			colored = false,
			symbols = { added = "+", modified = "~", removed = "-" }, -- changes diff symbols
			cond = hide_in_width,
		}

		local branch = {
			"branch",
			icons_enabled = false,
		}

    -- overwrite color change in middle section when switching modes
    local custom_gruvbox = require'lualine.themes.gruvbox_dark'
    custom_gruvbox.insert.c = custom_gruvbox.normal.c
    custom_gruvbox.visual.c = custom_gruvbox.normal.c
    custom_gruvbox.replace.c = custom_gruvbox.normal.c
    custom_gruvbox.command.c = custom_gruvbox.normal.c
    custom_gruvbox.inactive.c = custom_gruvbox.normal.c

		lualine.setup({
			options = {
				icons_enabled = true,
				theme = custom_gruvbox, -- "auto",
				component_separators = { left = "", right = "|" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "undotree", "diff" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { branch },
				lualine_c = { "filename" },
				lualine_x = { diff, diagnostics },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}

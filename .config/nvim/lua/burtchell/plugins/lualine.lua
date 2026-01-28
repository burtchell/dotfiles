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
			symbols = { error = " ", warn = " " },
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

		local fileformat = {
			"fileformat",
			symbols = {
				unix = "", -- e712
				dos = "", -- e70f
				mac = "", -- e711
			},
		}

		local filetype = {
			"filetype",
			colored = false,
			icons_enabled = true,
			icon_only = true,
			icon = nil,
		}

		local branch = {
			"branch",
			icons_enabled = false,
			-- icon = "",
		}

		local location = {
			"location",
			padding = { left = 0, right = 0 },
		}

		-- local spaces = function()
		-- 	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
		-- end

		lualine.setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { branch, diagnostics },
				lualine_c = { "filename" },
				-- lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_x = { diff },
				lualine_y = { "progress" },
				lualine_z = { location },
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

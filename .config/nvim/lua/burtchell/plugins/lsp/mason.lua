-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
-- LSP manager

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "clangd",  -- c/c++ lsp
        "tsserver",  -- js and ts
        "html",
        "cssls",
        "pyright",
        "lua_ls",
      },
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "clang-format",
        "prettier", -- js/ts/html/css/etc. formatter
        "stylua", -- lua formatter
        "black", -- python formatter
        "pylint", -- python linter
        "eslint_d", -- js linter
      }
    })
  end
}

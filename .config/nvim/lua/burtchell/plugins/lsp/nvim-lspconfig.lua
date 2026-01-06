-- https://github.com/neovim/nvim-lspconfig

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    vim.diagnostic.config({
      signs = false,
      -- signs = {
      --   text = {
      --     [vim.diagnostic.severity.ERROR] = 'x',
      --     [vim.diagnostic.severity.WARN] = '!',
      --     [vim.diagnostic.severity.HINT] = 'i',
      --     [vim.diagnostic.severity.INFO] = '?',
      --   },
      -- },
      virtual_text = false, -- disable in-line virtual text
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
      },
    })

    -- attempted to set bg highlight of sign-column diagnostics to none but it overrided the fg color too
    -- vim.api.nvim_set_hl(0, "DiagnosticSignError", { bg = nil })
    -- vim.api.nvim_set_hl(0, "DiagnosticSignWarn",  { bg = nil })
    -- vim.api.nvim_set_hl(0, "DiagnosticSignInfo",  { bg = nil })
    -- vim.api.nvim_set_hl(0, "DiagnosticSignHint",  { bg = nil })

    -- manually config any special LSP servers
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            -- make the language server recognize "vim" global
            globals = { "vim", "require" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}


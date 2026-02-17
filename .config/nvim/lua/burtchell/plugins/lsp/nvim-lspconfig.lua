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
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = 'E',
          [vim.diagnostic.severity.WARN] = 'W',
          [vim.diagnostic.severity.HINT] = 'H',
          [vim.diagnostic.severity.INFO] = 'I',
        },
      },
      virtual_text = false, -- disable in-line virtual text
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      -- float = {
      --   focusable = false,
      --   style = "minimal",
      --   border = "rounded",
      --   source = true,
      --   header = "",
      --   prefix = "",
      -- },
    })

    -- default highlights don't have a transparent bg. linking with highlights somehow fixes this
    vim.api.nvim_set_hl(0, "DiagnosticSignError", { link = "DiagnosticError" })
    vim.api.nvim_set_hl(0, "DiagnosticSignWarn",  { link = "DiagnosticWarn" })
    vim.api.nvim_set_hl(0, "DiagnosticSignInfo",  { link = "DiagnosticInfo" })
    vim.api.nvim_set_hl(0, "DiagnosticSignHint",  { link = "Comment" })

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


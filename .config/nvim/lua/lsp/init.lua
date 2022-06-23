-- entry point for nvim lsp configuration
-- run :LspInstallInfo and press i over extensions to install them

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "lsp.configs"
require("lsp.handlers").setup()
-- require("lsp.null-ls")

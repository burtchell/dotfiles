-- require each file in ./settings/
-- run :LspInstallInfo to choose servers to install

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

-- add all servers here:
local servers = {
  "jsonls",
  "sumneko_lua",
  "tsserver",
  "cssls",
  "cssmodules_ls",
  "html",
  "emmet_ls",
  "pyright"
}

lsp_installer.setup {
	ensure_installed = servers
}

for _, server in pairs(servers) do
  -- apply global configs (in lsp.handlers) to all installed servers
	local opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}

  -- if server has a settings file, apply those settings as well
	local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings." .. server)
	if has_custom_opts then
	 	opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end

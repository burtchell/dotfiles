-- applies global and individual lsp settings, if they exist (in ./settings/)
-- run :LspInstallInfo to choose servers to install

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

-- get installed servers and convert to a table
local servers = lsp_installer.get_installed_servers()
local server_table = {}
for idx in pairs(servers) do
  local server = servers[idx].name
  table.insert(server_table, server)
end

-- initialize lsp_installer
lsp_installer.setup()

for _, server in pairs(server_table) do
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

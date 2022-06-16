local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end
-- list all server you wanted to install
-- if you need to customize server settings, create a config inside settings/[lsp].lua
-- the script will detect settings use it to setup the server
local servers = {
  "tsserver",
  "sumneko_lua",
  "elixirls",
  "bashls",
  "gopls"
}
-- auto install LSP
lsp_installer.setup {
  ensure_installed = servers,
}

--
-- config servers
--

local on_attach = require("user.lsp.handlers").on_attach
local lsp_flags = require("user.lsp.handlers").flags

-- auto complete
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local options = {}
for _, lsp in ipairs(servers) do
  options = {
    on_attach = function(client, bufnr)
      -- disable formatting capabilities
      if (client.name == "tsserver") then
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        client.resolved_capabilities.publish_diagnostics = false
      end

      on_attach(client, bufnr)
    end,
    flags = lsp_flags,
    capabilities = capabilities,
  }

  -- auto detect settings
  local exists, extended = pcall(require, "user.lsp.settings." .. lsp)
  if exists then
    options = vim.tbl_deep_extend("force", extended, options)
  end

  lspconfig[lsp].setup(options)
end

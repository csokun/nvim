local ok, mason = pcall(require, "mason")
if not ok then
  return
end

local mason_config_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_config_ok then
  return
end

-- list all server you wanted to install
-- if you need to customize server settings, create a config inside settings/[lsp].lua
-- the script will detect settings use it to setup the server
local servers = {
  "tsserver",
  "emmet_ls",
  "lua_ls",
  "eslint",
  "elixirls",
  "bashls",
  "pyright",
  "gopls",
  "html",
  "rust_analyzer",
  "tailwindcss",
  "clangd",
  "solc",
  "jsonls",
  "yamlls",
  "dockerls"
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

--
-- config servers
--
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

local on_attach = require("user.lsp.handlers").on_attach
local lsp_flags = require("user.lsp.handlers").flags

-- auto complete
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local options = {}
for _, lsp in ipairs(servers) do
  options = {
    on_attach = function(client, bufnr)
      -- disable formatting capabilities
      if (client.name == "tsserver" or client.name == "jsonls" or client.name == "eslint") then
        client.server_capabilities.documentFormattingProvider = false;
        client.server_capabilities.documentRangeFormattingProvider = false;
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

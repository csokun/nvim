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
  "html",
  "tailwindcss",
  -- "rust_analyzer",
  -- "clangd",
  -- "pyright",
  -- "gopls",
  -- "solc",
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
  -- auto detect settings
  local exists, extended = pcall(require, "user.lsp.settings." .. lsp)
  if exists then
    options[lsp] = extended
  end
end

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = options[server_name]
    }
  end,
})

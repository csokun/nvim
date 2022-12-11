local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  sources = {
    diagnostics.eslint_d,
    code_actions.eslint_d,
    formatting.beautysh,
    formatting.prettier.with {
      extra_filetypes = { "toml", "solidity" },
      extra_args = { "--single-quote", "--jsx-single-quote" },
    },
  },
}

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end
-- ref. https://www.reddit.com/r/neovim/comments/qckrnp/share_your_prettier_and_eslint_formatting_setup/
local formatting = null_ls.builtins.formatting
--local diagnostics = null_ls.builtins.diagnostics
-- local code_actions = null_ls.builtins.code_actions

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  sources = {
    --diagnostics.eslint,
    -- code_actions.eslint,
    formatting.prettier.with {
      extra_filetypes = { "toml", "solidity" },
    }
  },
  -- on_attach = function(client, bufnr)
  --   if client.supports_method("textDocument/formatting") then
  --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = augroup,
  --       buffer = bufnr,
  --       callback = function()
  --         print("null-ls")
  --         vim.lsp.buf.formatting_sync(nil, 2000)
  --       end
  --     })
  --   end
  -- end
}

require "user.lsp.diagnostic"
require "user.lsp.lsp-installer"
require "user.lsp.null-ls"
require "user.lsp.lsp_signature"

-- auto format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  group = augroup,
  callback = function()
    vim.lsp.buf.formatting_sync(nil, 1000)
  end
})

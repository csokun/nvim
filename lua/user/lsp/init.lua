require "user.lsp.diagnostic"
require "user.lsp.lsp-installer"
-- require "user.lsp.null-ls"

-- auto format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.formatting_sync(nil, 100)
  end
})

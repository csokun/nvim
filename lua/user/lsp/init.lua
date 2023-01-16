require "user.lsp.diagnostic"
require "user.lsp.mason"
require "user.lsp.null-ls"
require "user.lsp.lsp_signature"
--require "user.lsp.lspsaga"

-- auto format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  group = augroup,
  callback = function()
    vim.lsp.buf.format({ async = false })
  end
})

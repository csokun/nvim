local M = {}
local illuminate_status_ok, illuminate = pcall(require, 'illuminate')
local nmap = require("user.utils").nmap
local opts = { noremap = true, silent = true }
-- diagnostic
nmap { '<space>e', vim.diagnostic.open_float, opts }
nmap { '[d', vim.diagnostic.goto_prev, opts }
nmap { ']d', vim.diagnostic.goto_next, opts }
nmap { '<space>q', vim.diagnostic.setloclist, opts }

if illuminate_status_ok then
  vim.g.Illuminate_ftblacklist = { 'alpha', 'NvimTree' }
  nmap { '<a-n>', function() illuminate.next_reference { wrap = true } end, { noremap = true } }
  nmap { '<a-p>', function() illuminate.next_reference { reverse = true, wrap = true } end, { noremap = true } }
end

M.on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  nmap { 'gD', vim.lsp.buf.declaration, bufopts }
  nmap { 'gd', vim.lsp.buf.definition, bufopts }
  nmap { 'gi', vim.lsp.buf.implementation, bufopts }
  nmap { 'gl', "<cmd>Telescope diagnostics<cr>", bufopts }
  nmap { '<C-t>', "<cmd>Telescope lsp_document_symbols<cr>", bufopts }
  nmap { '<C-k>', vim.lsp.buf.signature_help, bufopts }
  nmap { '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts }
  nmap { '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts }
  nmap { '<space>D', vim.lsp.buf.type_definition, bufopts }
  nmap { '<space>f', function() vim.lsp.buf.format { async = false } end, bufopts }
  nmap { '<leader>ca', function() vim.lsp.buf.code_action() end, bufopts }
  if illuminate_status_ok then
    illuminate.on_attach(client)
  end
end

M.flags = {
  debounce_text_changes = 150,
}

return M

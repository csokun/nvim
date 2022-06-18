local M = {}

local nmap = require("user.utils").nmap
local opts = { noremap = true, silent = true }

nmap { '<space>e', vim.diagnostic.open_float, opts }
nmap { '[d', vim.diagnostic.goto_prev, opts }
nmap { ']d', vim.diagnostic.goto_next, opts }
nmap { '<space>q', vim.diagnostic.setloclist, opts }

M.on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  nmap { 'gD', vim.lsp.buf.declaration, bufopts }
  nmap { 'gd', vim.lsp.buf.definition, bufopts }
  nmap { 'K', vim.lsp.buf.hover, bufopts }
  nmap { 'gi', vim.lsp.buf.implementation, bufopts }
  --nmap { '<C-k>', vim.lsp.buf.signature_help, bufopts }
  nmap { '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts }
  nmap { '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts }
  nmap {
    '<space>wl',
    function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    bufopts
  }
  nmap { '<space>D', vim.lsp.buf.type_definition, bufopts }
  nmap { '<space>rn', vim.lsp.buf.rename, bufopts }
  nmap { '<space>ca', vim.lsp.buf.code_action, bufopts }
  --nmap { 'gr', vim.lsp.buf.references, bufopts }
  nmap { '<space>f', vim.lsp.buf.formatting, bufopts }
end

M.flags = {
  debounce_text_changes = 150,
}

return M

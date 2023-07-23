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

local format_is_enabled = true
vim.api.nvim_create_user_command('KickstartFormatToggle', function()
  format_is_enabled = not format_is_enabled
  print('Setting autoformatting to: ' .. tostring(format_is_enabled))
end, {})

-- Create an augroup that is used for managing our formatting autocmds.
--      We need one augroup per client to make sure that multiple clients
--      can attach to the same buffer without interfering with each other.
local _augroups = {}
local get_augroup = function(client)
  if not _augroups[client.id] then
    local group_name = 'kickstart-lsp-format-' .. client.name
    local id = vim.api.nvim_create_augroup(group_name, { clear = true })
    _augroups[client.id] = id
  end

  return _augroups[client.id]
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
  -- Create an autocmd that will run *before* we save the buffer.
  --  Run the formatting command for the LSP that has just attached.
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = get_augroup(client),
    buffer = bufnr,
    callback = function()
      if not format_is_enabled then
        return
      end

      vim.lsp.buf.format {
        async = false,
        filter = function(c)
          return c.id == client.id
        end,
      }
    end,
  })
end

M.flags = {
  debounce_text_changes = 150,
}

return M

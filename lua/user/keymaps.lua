-- modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',
local map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ","

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Visual Block --
map("n", "<esc><esc>", "<cmd>nohlsearch<cr>") -- double ESC to disable search highlight

-- stay in indent mode
map("v", ">", ">gv")
map("v", "<", "<gv")

-- -- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")

map("v", "p", "'_dP")

map("n", "<C-\\>", "<cmd>vsplit<cr>")

-- CTRL+W, S -> Horizontal split
-- CTRL+W, v -> Vertical split
-- CTRL+W, Q -> close buffer
--map('n', '<C-q>', '<cmd>wq!<CR>')

-- telescope
map("n", "<C-p>", "<cmd>Telescope find_files<cr>")
map("n", "<C-f>", "<cmd>Telescope live_grep<cr>")
map("n", "<C-b>", "<cmd>Telescope buffers<cr>")
map("n", "gr", "<cmd>Telescope lsp_references<cr>")
map("n", "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>")

-- nvim-tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<cr>")
map("n", "<A-g>", "<cmd>LazyGit<cr>")

map("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>')
map("n", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>')
map("v", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>')

-- maximize
map("n", "<F3>", '<cmd>:MaximizerToggle<CR>')
map("v", '<F3>', '<cmd>:MaximizerToggle<CR>gv')
map("i", '<F3>', '<C-o>:MaximizerToggle<CR>')

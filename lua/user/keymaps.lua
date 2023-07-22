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
  vim.keymap.set(mode, lhs, rhs, options)
end

-- leader=SPACE
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map({ 'n', 'v' }, '<Space>', '<Nop>')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")

-- Visual Block --
map("n", "<esc><esc>", "<cmd>nohlsearch<cr>") -- double ESC to disable search highlight

-- stay in indent mode
map("v", ">", ">gv")
map("v", "<", "<gv")

-- -- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move select text down" })
map('x', "K", ":move '<-2<CR>gv-gv", { desc = "Move select text up" })

map("v", "p", "'_dP")

map("n", "|", "<cmd>vsplit<cr>", { desc = "Split buffer vertical" })
map("n", "_", "<cmd>split<cr>", { desc = "Split horizontal" })

map('n', "W", ":close<CR>")

-- nvim-tree
map("n", "<leader>tn", "<cmd>NvimTreeFocus<cr>", { desc = "Jump to nvim tree" })
map("n", "<leader>n", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle nvim-tree" })
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Toggle azyGit" })

-- maximize
map("n", "<F3>", '<cmd>:MaximizerToggle<CR>')
map("v", '<F3>', '<cmd>:MaximizerToggle<CR>gv')
map("i", '<F3>', '<C-o>:MaximizerToggle<CR>')

-- toggle relative line number
map("n", "<leader>ln", ":set invrelativenumber<CR>")

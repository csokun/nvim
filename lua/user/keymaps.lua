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

-- leader=SPACE
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")

map("v", "p", "'_dP")

map("n", "|", "<cmd>vsplit<cr>")
map("n", "_", "<cmd>split<cr>")

map('n', "W", ":bd<CR>")

-- telescope
map("n", "<leader>tp", "<cmd>Telescope find_files<cr>")
map("n", "<leader>tg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>tb", "<cmd>Telescope buffers<cr>")

-- nvim-tree
map("n", "<leader>tn", "<cmd>NvimTreeFocus<cr>")
map("n", "<leader>n", "<cmd>NvimTreeToggle<cr>")
map("n", "<leader>lg", "<cmd>LazyGit<cr>")

-- maximize
map("n", "<F3>", '<cmd>:MaximizerToggle<CR>')
map("v", '<F3>', '<cmd>:MaximizerToggle<CR>gv')
map("i", '<F3>', '<C-o>:MaximizerToggle<CR>')

-- toggle relative line number
map("n", "<leader>ln", ":set invrelativenumber<CR>")

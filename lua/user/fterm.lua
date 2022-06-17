local status_ok, fterm = pcall(require, "FTerm")
if not status_ok then
  return
end

fterm.setup {
  border     = 'double',
  dimensions = {
    height = 0.4,
    width = 0.6,
  },
}

-- keybindings
vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

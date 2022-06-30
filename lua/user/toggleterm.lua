local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
  return
end
local prefer_shell = function()
  if vim.fn.executable("zsh") == 1 then
    return "zsh"
  end
  return vim.o.shell
end

-- https://github.com/akinsho/toggleterm.nvim
toggleterm.setup {
  open_mapping = [[tt]],
  shell = prefer_shell()
}

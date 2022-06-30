local ok, bufferline = pcall(require, "bufferline")
if not ok then
  return
end

bufferline.setup {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    }
  }
}

-- keymapping
local nmap = require("user.utils").nmap
local opts = { noremap = true, silent = true }

nmap { '[b', [[<CMD>:BufferLineCycleNext<CR>]], opts }
nmap { 'b]', [[<CMD>:BufferLineCyclePrev<CR>]], opts }
nmap { '<TAB>', [[<CMD>:BufferLinePick<CR>]], opts }

local ok, close_buffer = pcall(require, "close_buffers")
if not ok then
  return
end
local bufferline_ok, bufferline = pcall(require, "bufferline")

close_buffer.setup {
  filetype_ignore = { 'NvimTree' },
  preserve_window_layout = { 'this' },
  next_buffer_cmd = function(windows)
    if bufferline_ok then bufferline.cycle(1) end
    local bufnr = vim.api.nvim_get_current_buf()

    for _, window in ipairs(windows) do
      vim.api.nvim_win_set_buf(window, bufnr)
    end
  end
}

-- keymapping
local nmap = require("user.utils").nmap
local opts = { noremap = true, silent = true }

nmap { "<C-w>", function() close_buffer.delete({ type = 'this' }) end, opts }

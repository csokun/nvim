-- colortheme
local onedark_status_ok, onedark = pcall(require, "onedark")
if onedark_status_ok then
  onedark.setup({ style = "darker" })
  onedark.load()
end

-- indent-blankline
local indent_blankline_ok, indent_blankline = pcall(require, "indent_blankline")
if indent_blankline_ok then
  indent_blankline.setup {
    show_current_context = true,
  }
end

-- lualine
local lualine_ok, lualine = pcall(require, "lualine")
if lualine_ok then
  lualine.setup({
    theme = "onedark"
  })
end

-- transparent background
vim.cmd [[hi Normal guibg=none ctermbg=none]]
vim.cmd [[hi LineNr guibg=none ctermbg=none]]
vim.cmd [[hi Folded guibg=none ctermbg=none]]
vim.cmd [[hi NonText guibg=none ctermbg=none]]
vim.cmd [[hi SpecialKey guibg=none ctermbg=none]]
vim.cmd [[hi VertSplit guibg=none ctermbg=none]]
vim.cmd [[hi SignColumn guibg=none ctermbg=none]]
vim.cmd [[hi EndOfBuffer guibg=none ctermbg=none]]
vim.cmd [[hi NvimTreeNormal guibg=none ctermbg=none]]
vim.cmd [[hi NvimTreeEndOfBuffer guibg=none ctermbg=none]]

-- colortheme
local onedark_status_ok, onedark = pcall(require, "onedark")
if onedark_status_ok then
  onedark.setup({ style = "darker" })
  onedark.load()
end

-- indent-blankline
local indent_blankline_ok, indent_blankline = pcall(require, "indent_blankline")
if indent_blankline_ok then
  vim.opt.list = true
  vim.opt.listchars:append "space:⋅"
  vim.opt.listchars:append "eol:↴"

  vim.cmd [[highlight IndentBlanklineContextChar guifg=#E5C07B gui=nocombine ]]
  vim.cmd [[highlight IndentBlanklineContextStart guisp=#E5C07B gui=underline ]]

  indent_blankline.setup {
    space_char_blankline = " ",
    show_current_context_start = false,
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

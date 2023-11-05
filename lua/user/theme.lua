-- colortheme
local onedark_status_ok, onedark = pcall(require, "onedark")
if onedark_status_ok then
  onedark.setup({ style = "darker" })
  onedark.load()
end

-- indent-blankline
local ibl_ok, ibl = pcall(require, "ibl")
if ibl_ok then
  vim.opt.list = true
  vim.opt.listchars:append "space:⋅"
  vim.opt.listchars:append "eol:↴"

  local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
  }

  local hooks = require "ibl.hooks"
  -- create the highlight groups in the highlight setup hook, so they are reset
  -- every time the colorscheme changes
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
  end)

  vim.g.rainbow_delimiters = { highlight = highlight }

  ibl.setup {
    whitespace = { highlight = { "Whitespace", "NonText" } },
    scope = {
      highlight = highlight,
      show_start = false,
      show_end = false
    },
    -- space_char_blankline = " ",
    -- show_current_context_start = false,
    -- show_current_context = true,
  }
  hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
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
vim.cmd [[hi CopilotSuggestion guifg=#555555 ctermfg=8]]

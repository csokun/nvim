local icons = {
  Error = "",
  Warning = "",
  Information = "",
  Question = "",
  Hint = "",
}

local signs = {
  { name = "DiagnosticSignError", text = icons.Error },
  { name = "DiagnosticSignWarn", text = icons.Warning },
  { name = "DiagnosticSignHint", text = icons.Hint },
  { name = "DiagnosticSignInfo", text = icons.Information },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  -- disable virtual text
  virtual_text = false,
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    scope = "cursor",
    style = "minimal",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

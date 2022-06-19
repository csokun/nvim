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

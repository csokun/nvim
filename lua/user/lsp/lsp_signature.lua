local status_ok, signature = pcall(require, "lsp_signature")
if not status_ok then
  return
end
local config = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  auto_close_after = 1, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  floating_window_above_cur_line = false,
  wrap = true, -- allow doc/signature text wrap inside floating_window
  handler_opts = {
    border = "rounded"
  },
  toggle_key = '<C->'
}
signature.setup(config)

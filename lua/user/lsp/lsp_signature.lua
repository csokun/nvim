local status_ok, signature = pcall(require, "lsp_signature")
if not status_ok then
  return
end
local config = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  handler_opts = {
    border = "rounded"
  }
}
signature.setup(config)

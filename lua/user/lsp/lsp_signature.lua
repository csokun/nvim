local status_ok, signature = pcall(require, "lsp_signature")
if not status_ok then
  return
end
local config = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded"
  }
}
signature.setup(config)

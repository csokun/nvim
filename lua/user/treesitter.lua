local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "elixir",
    "erlang",
    "lua",
    "go",
    "heex",
    "eex",
    "surface",
    "dockerfile",
    "make",
    "css",
    "toml",
    "yaml",
    "tsx",
    "solidity",
    "python",
    "typescript",
    "markdown",
    "javascript"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- indentation based on treesitter for the = operator
  indent = {
    enable = true,
    disable = { "yaml" }
  },
}

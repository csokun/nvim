require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { 
    "elixir", 
    "erlang",
    "lua", 
    "rust", 
    "c",
    "cpp",
    "c_sharp",
    "go",
    "heex",
    "eex",
    "dockerfile",
    "make",
    "php",
    "ruby",
    "css",
    "toml",
    "yaml",
    "tsx",
    "python",
    "dart",
    "typescript",
    "javascript"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
}

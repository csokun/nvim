-- bootstrap
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = nil
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- explorer
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  -- git
  use "kdheepak/lazygit.nvim"
  use { "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end }

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim"
  use "ray-x/lsp_signature.nvim"
  use "b0o/schemastore.nvim"
  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- nvim-cmp
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"

  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "onsails/lspkind-nvim"

  -- telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-ui-select.nvim"

  use { "folke/trouble.nvim", config = function() require("trouble").setup() end }

  -- DAP
  use "mfussenegger/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  use "nvim-telescope/telescope-dap.nvim"
  use { "leoluz/nvim-dap-go", config = function() require('dap-go').setup() end }

  -- editing enhancement
  use { "numToStr/FTerm.nvim", event = "CursorHold" }
  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup() end, after = 'nvim-cmp' }
  use { "filipdutescu/renamer.nvim", config = function() require("renamer").setup() end }
  use { "numToStr/Comment.nvim", config = function() require("Comment").setup() end }
  use { 'phaazon/hop.nvim', branch = 'v1' }
  use "towolf/vim-helm"

  -- AI
  use "github/copilot.vim"

  -- theme
  use "navarasu/onedark.nvim"
  use "nvim-lualine/lualine.nvim"
  use { "akinsho/bufferline.nvim", tag = "v2.*" }
  use "lukas-reineke/indent-blankline.nvim"
  use { "j-hui/fidget.nvim", after = "lualine.nvim", config = function() require("fidget").setup() end }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)

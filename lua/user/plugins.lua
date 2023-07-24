-- bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local options = {
  "wbthomason/packer.nvim", -- Have packer manage itself
  "nvim-lua/plenary.nvim",  -- Useful lua functions used ny lots of plugins

  -- explorer
  "kyazdani42/nvim-web-devicons",
  "kyazdani42/nvim-tree.lua",

  -- git
  "kdheepak/lazygit.nvim",
  {
    "lewis6991/gitsigns.nvim",
    config = function() require("gitsigns").setup() end
  },

  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  "b0o/schemastore.nvim",
  "ray-x/lsp_signature.nvim",
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    version = 'v0.9.0',
    run = ":TSUpdate"
  },

  -- nvim-cmp
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",

  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "onsails/lspkind-nvim",
  "rafamadriz/friendly-snippets",

  -- telescope
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  { "folke/trouble.nvim",    config = function() require("trouble").setup() end },
  {
    "someone-stole-my-name/yaml-companion.nvim",
    config = function() require('telescope').load_extension("yaml_schema") end
  },
  "towolf/vim-helm",

  -- DAP
  "mfussenegger/nvim-dap",
  "theHamsta/nvim-dap-virtual-text",
  "rcarriga/nvim-dap-ui",
  "nvim-telescope/telescope-dap.nvim",
  {
    "leoluz/nvim-dap-go",
    config = function() require('dap-go').setup() end
  },

  -- editing enhancement
  "numToStr/FTerm.nvim",
  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup() end, after = 'nvim-cmp' },
  { "numToStr/Comment.nvim", config = function() require("Comment").setup() end },
  { 'phaazon/hop.nvim',      version = 'v2*' },
  "kazhala/close-buffers.nvim",
  "szw/vim-maximizer",
  {
    "chentoast/marks.nvim",
    event = "BufReadPre",
    config = function()
      require("marks").setup {}
    end,
  },

  -- AI
  "github/copilot.vim",

  -- theme
  "navarasu/onedark.nvim",
  "nvim-lualine/lualine.nvim",
  { "akinsho/bufferline.nvim", version = "v3.*" },
  "lukas-reineke/indent-blankline.nvim",
  "RRethy/vim-illuminate"
}

require("lazy").setup(options)

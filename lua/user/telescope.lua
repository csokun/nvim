local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local trouble_status_ok, trouble = pcall(require, "trouble.providers.telescope")
if not trouble_status_ok then
  return
end

local actions = require "telescope.actions"
local builtin = require "telescope.builtin"
local themes = require "telescope.themes"

telescope.setup {
  defaults = {
    selection_caret = " ",
    path_display = { "smart" },

    file_ignore_patterns = {
      ".git",
      "node_modules"
    },

    mappings = {
      i = {
        ["<esc>"] = actions.close,

        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,
        ["<C-t>"] = trouble.open_with_trouble,
      },
      n = {
        ["<C-t>"] = trouble.open_with_trouble,
      },
    },
  },

  pickers = {
    find_files = {
      previewer = false,
      theme = "dropdown"
    },
    lsp_code_actions = {
      theme = "cursor"
    },
    code_action = {
      theme = "cursor"
    },
    buffers = {
      previewer = false,
      theme = "dropdown"
    },
    lsp_workspace_diagnostics = {
      theme = "dropdown"
    }
  },

  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  }
}

-- telescope
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(
    themes.get_dropdown {
      winblend = 10,
      previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>ss', function()
  builtin.lsp_document_symbols(
    themes.get_dropdown {
      winblend = 10,
      previewer = false,
    }
  )
end, { desc = '[S]earch [S]Symbol' })

-- load extensions
telescope.load_extension("ui-select")

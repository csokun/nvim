local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local trouble_status_ok, trouble = pcall(require, "trouble.providers.telescope")
if not trouble_status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {

    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,
        ["<C-t>"] = trouble.open_with_trouble,
      },
      n = {
        ["<C-t>"] = trouble.open_with_trouble,
      }
    }
  }
}

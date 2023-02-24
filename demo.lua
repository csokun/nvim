local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local sorters = require "telescope.sorters"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local job = { "ls" }
local job_options = {
  entry_maker = function(entry)
    local table = {
      ordinal = "",
      display = entry
    }
    return table
  end
}

local options = {
  finder = finders.new_oneshot_job(job, job_options),
  sorter = sorters.get_generic_fuzzy_sorter(),
  attach_mappings = function(prompt_bufnr, map)
    actions.select_default:replace(function()
      actions.close(prompt_bufnr)
      local selection = action_state.get_selected_entry()
      print(vim.inspect(selection))
      -- vim.api.nvim_put({ selection.display }, "", false, true)
    end)
    return true
  end,
}

local picker = pickers.new(options)
picker:find()

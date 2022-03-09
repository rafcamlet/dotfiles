local sidebar = require 'sidebar-nvim'

local workspaces = require("workspaces")

local get_workspaces = function()
  local result = {}

  for _, v in ipairs(workspaces.get()) do
    table.insert(result, v.name)
  end

  return result
end

local Workspaces = {}

local workspaces_section = {
  title = "Workspaces",
  icon = nil,
  setup = function()
    Workspaces = get_workspaces()
  end,
  update = function()
    Workspaces = get_workspaces()
  end,
  draw = function()
    return table.concat(Workspaces, "\n")
  end,
  bindings = {
    e = function(line)
      local name = Workspaces[line + 1]
      if name then
        vim.cmd 'wincmd p'
        workspaces.open(name)
      end
    end
  }
}


sidebar.setup {
  disable_default_keybindings = 0,
  bindings = nil,
  open = true,
  side = "right",
  initial_width = 35,
  hide_statusline = false,
  update_interval = 1000,
  sections = {
    -- "todos",
    "git",
    "diagnostics",
    -- "buffers",
    -- "files",
    workspaces_section,
    -- "symbols",
  },
  section_separator = {'', '----', ''},
  containers = {
    attach_shell = "/bin/sh", show_all = true, interval = 5000,
  },
  datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
  todos = { ignored_paths = { "~" } },
  disable_closing_prompt = false
}

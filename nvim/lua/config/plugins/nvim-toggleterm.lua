local Terminal  = require('toggleterm.terminal').Terminal
local Path = require 'plenary.path'

local path = vim.fn.tempname()

local Vifm = Terminal:new {
  cmd = ('vifm --choose-files "%s"'):format(path),
  direction = "float",
  float_opts = {
    border = "curved",
    width = vim.o.columns,
    height = vim.o.lines - 5,
  },
  close_on_exit = true,
  on_close = function()
    data = Path:new(path):read()
    vim.schedule(function()
      vim.cmd('e ' .. data)
    end)
  end
}

local function toggle_vifm()
  Vifm:toggle()
end

vim.cmd 'command! Vifm lua require"config.plugins.nvim-toggleterm".toggle_vifm()'

return {
  toggle_vifm = toggle_vifm
}

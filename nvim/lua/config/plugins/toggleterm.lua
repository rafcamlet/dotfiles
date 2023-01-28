require("toggleterm").setup {
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  direction = 'vertical'
}

vim.g.terminal_color_8 = '#595959'
vim.cmd 'tnoremap <c-]> <c-\\><c-n>'

local Terminal = require('toggleterm.terminal').Terminal
local Path = require 'plenary.path'

local path = vim.fn.tempname()

local Vifm = Terminal:new {
  cmd = ('vifm %s --choose-files "%s"'):format(vim.fn.getcwd(), path),
  direction = "float",
  float_opts = {
    border = "curved",
    width = vim.o.columns,
    height = vim.o.lines - 5,
  },
  close_on_exit = true,
  on_close = function()
    data = Path:new(path):read()
    if not data or data == '' then return end
    vim.schedule(function()
      vim.cmd('e ' .. data)
    end)
  end
}

vim.api.nvim_create_user_command('Vifm', function() Vifm:toggle() end, {})

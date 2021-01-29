require('plenary.reload').reload_module('init')

local vimp = require('vimp')
vimp.unmap_all()

require 'config/colors'
require 'config/projects'
require 'config/telescope'
require 'config/finders'
require 'config/treesitter'
require 'config/completion'
require 'config/lsp'

require('tabline').setup()
require('jumper').setup()

vim.cmd([[command! -nargs=1 Boss :call luaeval("require'boss'.eval(_A)", <q-args>)]])

require 'luapad'.config{
  context = {
    hl_color = require('helpers').hl_color,
  }
}

-- Temp settings ↓

local dap = require('dap')

dap.adapters.ruby = {
  type = 'executable';
  command = 'node';
  args = {'/home/r2d2/.config/nvim/bundle/vimspector/gadgets/linux/cust_vscode-ruby/dist/debugger/main.js'};
}

dap.configurations.ruby = {
  {
    type = 'ruby';
    request = 'launch';
    name = 'Rails';
    cwd = '/home/r2d2/projects/milabo',
    program = 'bin/rails';
    args = {'s'};
  },
}




require 'simple-wiki'.setup {
  path = '~/Dropbox/wiki',
  link_key_mapping = '<c-]>'
}

vimp.map_command('Wiki', require "simple-wiki".index)
vimp.nnoremap({'override'}, '-', require "simple-wiki".index)
vimp.nnoremap({'override'}, '_', require "simple-wiki".search)

local ruby_helpers = require 'ruby_helpers'
vimp.map_command('RubyOpenStyle', ruby_helpers.open_style)
vimp.nnoremap({'override'}, '<space>s', ruby_helpers.open_style)

local tabinator = require'tabinator'
tabinator.setup()
vimp.nnoremap({'override'}, '<space>ot', tabinator.find)


vimp.map_command('C', function()
  vim.lsp.diagnostic.clear(vim.api.nvim_get_current_buf())
end)

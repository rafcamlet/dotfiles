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

local ruby_helpers = require 'ruby_helpers'
vimp.map_command('RubyOpenStyle', ruby_helpers.open_style)
vimp.nnoremap('<space>s', ruby_helpers.open_style)

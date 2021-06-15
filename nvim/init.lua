local config_file = require'config/helpers'.config_file

config_file 'keybindings'
config_file 'settings'

require 'config/plugins'
require 'config/lsp'
require 'config/dap'

local config_file = require'config/helpers'.config_file

config_file 'keybindings'
config_file 'settings'

require 'config/plugins'
require 'config/lsp'
require 'config/dap'

vim.cmd [[ au TextYankPost * silent! lua vim.highlight.on_yank {higroup="Visual", timeout=250} ]]

vim.cmd([[command! -nargs=1 Boss :call luaeval("require'boss'.eval(_A)", <q-args>)]])

vim.cmd[[ nnoremap <silent> <f2> :silent! Boss c"lua require'byline'.setup()"<cr>]]
vim.cmd[[ nnoremap <f3> <cmd>Boss c"lua require'byline'.setup()" c"vs"<cr>]]

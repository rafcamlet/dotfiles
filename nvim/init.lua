local config_file = require("config.helpers").config_file

config_file "keybindings"
config_file "settings"

require "config.plugins"

if os.getenv('INSTALL') then return end

require "config.lsp"
require "config.dap"

vim.cmd 'colorscheme onedark'

vim.cmd([[ au TextYankPost * silent! lua vim.highlight.on_yank {higroup="Visual", timeout=250} ]])

vim.cmd([[command! -nargs=1 Boss :call luaeval("require'boss'.eval(_A)", <q-args>)]])

vim.cmd([[ nnoremap <silent> <f2> :silent! Boss c"lua require'byline'.setup()"<cr>]])
vim.cmd([[ nnoremap <f3> <cmd>Boss c"lua require'byline'.setup()" c"vs"<cr>]])

vim.cmd([[nnoremap <c-q> <cmd>lua require'scripts'.quickfix_toggle()<cr>]])

vim.cmd([[nnoremap <space>f <cmd>lua require'scripts'.send_to_tmux()<cr>]])
vim.cmd([[vnoremap <leader>f <cmd>lua require'scripts'.send_to_tmux(true)<cr>]])

vim.cmd([[nnoremap <space>og <cmd>lua require'finders'.git()<cr>]])
vim.cmd([[nnoremap <space>of <cmd>lua require'finders'.grep()<cr>]])
vim.cmd([[nnoremap <space>oo <cmd>lua require'finders'.find()<cr>]])
vim.cmd([[nnoremap <space>oq <cmd>lua require'finders'.find {cwd = vim.fn.fnamemodify(vim.fn.expand('$MYVIMRC'), ':h'), pattern = "(lua\|vim)$" }<cr>]])

vim.cmd([[nmap <leader>t <Plug>PlenaryTestFile]])

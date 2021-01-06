" Use gf to open config files

runtime vim_config/meta.vim
runtime vim_config/plugins.vim
runtime vim_config/plugins_config.vim
runtime vim_config/config.vim
runtime vim_config/keybindings.vim
runtime vim_config/scripts.vim
runtime vim_config/custom_colors.vim

" Lua

lua require 'helpers'
lua require 'init'
lua require 'scripts'
lua require 'ruby_helpers'

"====================================
"---------Testing_new_features-------
"====================================

nnoremap <expr> 8 luaeval('require("scripts").if_qf_open(":cp\<cr>", "8")')
nnoremap <expr> 9 luaeval('require("scripts").if_qf_open(":cn\<cr>", "9")')


nnoremap <nowait> <space>d :SF 
nnoremap <leader>zsh :e ~/.zshrc<cr>

set foldtext=MyFoldText()

" Where is it from?
let g:incsearch#magic = '\v' " very magic


doautocmd User InitVimLoaded

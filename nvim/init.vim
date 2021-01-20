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


nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>da :call vimspector#Launch()<CR>
nnoremap <leader>dd :TestNearest -strategy=jest<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>d? :call AddToWatch()<CR>
nnoremap <leader>dx :call vimspector#Reset()<CR>
nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>

nmap <space><S-h> <Plug>VimspectorStepOut
nmap <space><S-l> <Plug>VimspectorStepInto
nmap <space><S-j> <Plug>VimspectorStepOver
" nmap <leader>d_ <Plug>VimspectorRestart
nmap <space><s-c> :call vimspector#Continue()<CR>

" nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <space><s-b> <Plug>VimspectorToggleBreakpoint
" nmap <leader>de <Plug>VimspectorToggleConditionalBreakpoint


command! Vstart :call vimspector#Launch()<cr>
nnoremap <f5> :call vimspector#Continue()<cr>
nnoremap <expr> 8 luaeval('require("scripts").if_qf_open(":cp\<cr>", "8")')
nnoremap <nowait> 9 vimspector#StepInto()<cr>

nnoremap <expr> 8 luaeval('require("scripts").if_qf_open(":cp\<cr>", "8")')
nnoremap <expr> 9 luaeval('require("scripts").if_qf_open(":cn\<cr>", "9")')

nnoremap <nowait> 9 :call vimspector#StepInto()<cr>

nnoremap <nowait> <space>d :SF
nnoremap <leader>zsh :e ~/.zshrc<cr>

set foldtext=MyFoldText()

" Where is it from?
let g:incsearch#magic = '\v' " very magic


doautocmd User InitVimLoaded

" Use gf to open config files

runtime vim_config/meta.vim
runtime vim_config/plugins.vim
runtime vim_config/plugins_config.vim
runtime vim_config/config.vim
runtime vim_config/keybindings.vim
runtime vim_config/scripts.vim
" runtime vim_config/tabline.vim
" runtime vim_config/projects.vim
runtime vim_config/custom_colors.vim

" Lua

lua require 'projects'
lua require 'init'
lua require 'helper'
lua require 'scripts'
lua require 'regex_jump'
lua require 'jumper'
lua require 'components_tree'
lua require 'tui'
lua require 'colors'

" JSON store:
" vim_config/json/projects.json

" runtime vim_config/status_line.vim

" asdfasdf
"====================================
"---------Testing_new_features-------
"====================================

autocmd FileType qf nnoremap <buffer> <cr> <cr> 

" augroup lua_autogroup
"   autocmd!
"   autocmd FileType lua set errorformat=%*[^:]:%*[^:]:\ %f:%l:\ %m,%f:%l:\ %m
" augroup END

function! EditMigration()
  exec 'edit ' . system("ls -td1 db/migrate/* | head -1")
endfunction
command! EditMigration call EditMigration()

augroup help_autogroup
    autocmd!
    autocmd BufEnter * if &ft == 'help' | silent! wincmd L | end
augroup END

command! VueFind exec 'silent grep "<' . Mixedcase(expand('%:t:r')) . '" -g "*.vue"'
nnoremap <space>u :VueFind<cr>

hi YankHighlighta ctermbg=238
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup = "YankHighlighta", timeout = 300 }

augroup END

nnoremap <tab>fs :FLShow<cr>
nnoremap <tab>fa :FLShow<cr>

nnoremap <space>l :luafile spec/base.lua<cr>

nnoremap <tab>t :TagbarToggle<cr>

nnoremap <nowait> <space>b :e app/assets/stylesheets/base.scss<cr>

nnoremap <nowait> <space>d :SF 
nnoremap <leader>zsh :e ~/.zshrc<cr>

nnoremap ge :CocCommand explorer<CR>

" scrollbind
nnoremap yob :set scb!<cr>


augroup myCmdwinEnter
  autocmd!
  autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
  autocmd CmdwinEnter * nnoremap <buffer> q :q<cr> 
augroup END

command! OpenDict exec 'edit ' . ( !empty(&l:dictionary) ? &l:dictionary : stdpath('config') . '/dict/' . &filetype)

autocmd BufRead,BufNewFile,BufEnter *.vue setlocal filetype=vue
autocmd BufRead,BufNewFile,BufEnter *.vue syntax sync fromstart

set foldtext=MyFoldText()

function! Vifm() abort "{{{
  function! OnExit(...) closure
    bdelete!
  endfunction
  vnew
  setlocal bufhidden=wipe
  call termopen("COLORTERM=tmux-256color vifm -c " . '"vsplit | view!"' . "  --on-choose " . '"nvr --servername ' . v:servername . '  --remote-silent %c " ' . getcwd(), {'on_exit': function('OnExit')})
  IndentGuidesDisable
  startinsert
endfunction "}}}


nnoremap <silent> <space>t :TagbarToggle<cr>

function! TestColor()
  for i in range(1, 255)
    exec 'highlight MyGroup' . i . ' ctermfg=' . i
    call append(line('$'), 'Test TEST test')
    call matchadd('MyGroup' . i, '\%'. i . 'l')
  endfor
endfunction


" Where is it from?
let g:incsearch#magic = '\v' " very magic

inoremap <expr> <c-l> fzf#complete("rg --color=never --no-filename --no-line-number -e '^.*?class +([a-zA-Z0-9:]*) ?.*$' app/models -r '$1' \| sed '/^$/d' \| sort")

doautocmd User InitVimLoaded

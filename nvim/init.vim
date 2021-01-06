" Use gf to open config files

runtime vim_config/meta.vim
runtime vim_config/plugins.vim
runtime vim_config/plugins_config.vim
runtime vim_config/config.vim
runtime vim_config/keybindings.vim
runtime vim_config/scripts.vim
runtime vim_config/custom_colors.vim

" Lua

lua require 'colors'
lua require 'helpers'
lua require 'init'
lua require 'scripts'
lua require 'ruby_helpers'

"====================================
"---------Testing_new_features-------
"====================================

nnoremap <space>s <cmd>RubyOpenStyle<cr>
nnoremap <expr> 8 luaeval('require("scripts").if_qf_open(":cp\<cr>", "8")')
nnoremap <expr> 9 luaeval('require("scripts").if_qf_open(":cn\<cr>", "9")')

inoremap <c-a> <home>
inoremap <c-e> <end>

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-q> <cmd>lua vim.lsp.buf.formatting()<cr>
nnoremap <silent> [g    <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]g    <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<cr>
vnoremap <silent> ga    <cmd>'<,'>lua vim.lsp.buf.range_code_action()<cr>
nnoremap <silent> ge    <cmd>lua vim.lsp.util.show_line_diagnostics()<cr>
command! Rename lua vim.lsp.buf.rename()

augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set ignorecase
    autocmd CmdLineLeave : set smartcase
augroup END

nnoremap <space>j :AnyJump<cr>

autocmd BufEnter * inoremap <expr><silent> <c-j> 
      \ luaeval('(({require"snippets".lookup_snippet_at_cursor()})[2]
      \ or require"snippets".has_active_snippet())
      \ and [[<cmd>lua return snippets_or_what()<cr>]]
      \ or [[<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>]]')
inoremap <c-k> <cmd>lua return require'snippets'.advance_snippet(-1)<CR>

autocmd FileType qf nnoremap <buffer> <cr> <cr> 

function! EditMigration()
  exec 'edit ' . system("ls -td1 db/migrate/* | head -1")
endfunction
command! EditMigration call EditMigration()

augroup help_autogroup
    autocmd!
    autocmd BufEnter * if &ft == 'help' | silent! wincmd L | end
    autocmd BufEnter * if &ft == 'help' | silent! vertical resize 80 | end
augroup END

command! VueFind exec 'silent grep "<' . Mixedcase(expand('%:t:r')) . '" -g "*.vue"'
nnoremap <space>u :VueFind<cr>

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup = "YankHighlight", timeout = 300 }

augroup END

nnoremap <tab>fs :FLShow<cr>
nnoremap <tab>fa :FLShow<cr>

nnoremap <nowait> <space>b :e app/assets/stylesheets/base.scss<cr>

nnoremap <nowait> <space>d :SF 
nnoremap <leader>zsh :e ~/.zshrc<cr>

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

nnoremap <silent> <space>t :TagbarToggle<cr>

function! TestColor()
  for i in range(1, 255)
    exec 'highlight MyGroup' . i . ' ctermfg=' . i
    call append(line('$'), 'Test TEST test ' . i)
    call matchadd('MyGroup' . i, '\%'. i . 'l')
  endfor
endfunction

" Where is it from?
let g:incsearch#magic = '\v' " very magic

inoremap <expr> <c-l> fzf#complete("rg --color=never --no-filename --no-line-number -e '^.*?class +([a-zA-Z0-9:]*) ?.*$' app/models -r '$1' \| sed '/^$/d' \| sort")

doautocmd User InitVimLoaded

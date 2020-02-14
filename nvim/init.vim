" Use gf to open config files

runtime vim_config/meta.vim
runtime vim_config/plugins.vim
runtime vim_config/plugins_config.vim
runtime vim_config/config.vim
runtime vim_config/keybindings.vim
runtime vim_config/scripts.vim
" runtime vim_config/window_script.vim
" runtime vim_config/ruby_lib.vim
" runtime vim_config/custom_start_window.vim
runtime vim_config/tabline.vim
runtime vim_config/standup.vim
runtime vim_config/projects.vim
runtime vim_config/saved_commands.vim

" Lua

" lua/tools.lua
" lua require 'projects'
lua require 'regex_jump'

" JSON store:
" vim_config/json/projects.json

" runtime vim_config/status_line.vim

"====================================
"---------Testing_new_features-------
"====================================
"

nnoremap <space>oa :F '' app/concepts<cr>

function Inc()
  let @x = @x + 1
  return @z . @x
endfunction

nnoremap ge :CocCommand explorer<CR>

" Another FZF float
" let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
" let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
" let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" function! FloatingFZF()
"   let buf = nvim_create_buf(v:false, v:true)
"   call setbufvar(buf, '&signcolumn', 'no')

"   let height = float2nr(10)
"   let width = float2nr(80)
"   let horizontal = float2nr((&columns - width) / 2)
"   let vertical = 1

"   let opts = {
"         \ 'relative': 'editor',
"         \ 'row': vertical,
"         \ 'col': horizontal,
"         \ 'width': width,
"         \ 'height': height,
"         \ 'style': 'minimal'
"         \ }

"   call nvim_open_win(buf, v:true, opts)
" endfunction
" nnoremap <silent> <space>p :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>

" nnoremap <c-t><c-n> :vnew<cr>

" scrollbind
nnoremap yob :set scb!<cr>

" let $FZF_DEFAULT_OPTS='--layout=reverse'
" let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" function! FloatingFZF()
"   let buf = nvim_create_buf(v:false, v:true)
"   call setbufvar(buf, '&signcolumn', 'no')

"   let height = &lines - 3
"   let width = float2nr(&columns - (&columns * 2 / 10))
"   let col = float2nr((&columns - width) / 2)

"   let opts = {
"         \ 'relative': 'editor',
"         \ 'row': 1,
"         \ 'col': col,
"         \ 'width': width,
"         \ 'height': height
"         \ }

"   call nvim_open_win(buf, v:true, opts)
" endfunction

" Floating Term
let s:float_term_border_win = 0
let s:float_term_win = 0
function! FloatTerm()
  " Configuration
  let height = float2nr((&lines - 2) * 0.6)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.6)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
        \ 'relative': 'editor',
        \ 'row': row - 1,
        \ 'col': col - 2,
        \ 'width': width + 4,
        \ 'height': height + 2,
        \ 'style': 'minimal'
        \ }
  let border_buf = nvim_create_buf(v:false, v:true)
  let s:float_term_border_win = nvim_open_win(border_buf, v:true, border_opts)
  " Terminal Window
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  let buf = nvim_create_buf(v:false, v:true)
  let s:float_term_win = nvim_open_win(buf, v:true, opts)
  " Styling
  hi FloatTermNormal term=None guibg=#2d3d45
  call setwinvar(s:float_term_border_win, '&winhl', 'Normal:FloatTermNormal')
  call setwinvar(s:float_term_win, '&winhl', 'Normal:FloatTermNormal')
  terminal
  startinsert
  " Close border window when terminal window close
  autocmd CursorMoved * ++once call nvim_win_close(s:float_term_border_win, v:true)
endfunction
command! FloatTerm call FloatTerm()


augroup VIMRC
    autocmd!
    autocmd BufLeave *.css,*.scss normal! mC
    autocmd BufLeave *.html       normal! mH
    autocmd BufLeave *.js,*.ts    normal! mJ
    autocmd BufLeave *.md         normal! mM
    autocmd BufLeave *.yml,*.yaml normal! mY
    autocmd BufLeave *.vue        normal! mV
    autocmd BufLeave .env*        normal! mE
augroup END

nnoremap <silent> <space>ob :call fzf#vim#grep('rg --column --line-number --no-heading --color=always ' . "\"^\\s+name: '[a-zA-Z-]+?'\"" . ' src/components', 0)<cr>

nnoremap <space>w <esc>:w<cr>
function! HlThis()
  highlight LineMatch term=bold cterm=bold gui=bold ctermfg=red
  if exists('b:line_hl_match')
    call matchdelete(b:line_hl_match)
  end
  let b:line_hl_match = matchadd('LineMatch', '\%' . line('.') . 'l')
endfunction
nnoremap <space>h :call HlThis()<cr>

nnoremap <nowait> <space>s <esc>:syntax sync fromstart<cr>
inoremap kj <esc>`^
nnoremap <c-]> g<c-]>

set pastetoggle=
" autocmd TermOpen,BufEnter term://* startinsert
" autocmd TermOpen,BufEnter FZF* startinsert

augroup myCmdwinEnter
  autocmd!
  autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
  autocmd CmdwinEnter * nnoremap <buffer> q :q<cr> 
augroup END

command! OpenDict exec 'edit ' . ( !empty(&l:dictionary) ? &l:dictionary : stdpath('config') . '/dict/' . &filetype)

function! OnBranch()
  let l:file_path = expand('%')

  function! SplitOnBranch(path, branch)
    exec 'Gvsplit ' . a:branch . ':' . a:path
  endfunction

  let l:buffers = map(range(1, bufnr('$')), 'bufname(v:val)')

  call fzf#run ({
        \ 'source':  'git branch',
        \ 'sink': function('SplitOnBranch',[l:file_path])
        \})
endfunction
command! OnBranch call OnBranch()

function! Test()
  call system('tmux split-window -h -d -p 40 ' . "' source '$HOME/.rvm/scripts/rvm' ; rvm use 2.4.2; rspec " . expand('%')  .  "'")
endfunction
nnoremap <silent> <space><c-t> :call Test()<cr>

autocmd BufRead,BufNewFile,BufEnter *.vue setlocal filetype=vue
autocmd BufRead,BufNewFile,BufEnter *.vue syntax sync fromstart

nnoremap `a `Azt
nnoremap `j `Jzt
nnoremap `k `Kzt
nnoremap `l `Lzt

func! TranslateRegex(pattern) abort
    let pattern = a:pattern

    " escape '@' and '%' (plain in perl regex but special in vim regex)
    let pattern = escape(pattern, '@%')

    " non-capturing group
    let pattern = substitute(pattern, '\v\(\?:(.{-})\)', '%(\1)', 'g')

    " case sensitive
    let pattern = substitute(pattern, '\V(?i)', '\c', 'g')
    let pattern = substitute(pattern, '\V(?-i)', '\C', 'g')

    " minimal matching
    let pattern = substitute(pattern, '\V*?', '{-}', 'g')
    let pattern = substitute(pattern, '\V+?', '{-1,}', 'g')
    let pattern = substitute(pattern, '\V??', '{-0,1}', 'g')
    let pattern = substitute(pattern, '\m{\(.\{-}\)}?', '{-\1}', 'g')

    " zero-length matching
    let pattern = substitute(pattern, '\v\(\?\=(.{-})\)', '(\1)@=', 'g')
    let pattern = substitute(pattern, '\v\(\?!(.{-})\)', '(\1)@!', 'g')
    let pattern = substitute(pattern, '\v\(\?\<\=(.{-})\)', '(\1)@<=', 'g')
    let pattern = substitute(pattern, '\v\(\?\<!(.{-})\)', '(\1)@<!', 'g')
    let pattern = substitute(pattern, '\v\(\?\>(.{-})\)', '(\1)@>', 'g')

    " '\b' word boundary
    let pattern = substitute(pattern, '\C\\b', '(<|>)', 'g')

    " '\B' non-word boundary (just remove it)
    let pattern = substitute(pattern, '\C\\B', '', 'g')

    " vim-regex when magic is \v, '=' '&' is no literally, should change to '\=' and '\&'
    let pattern = escape(pattern, '=&')

    return pattern
endf

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

command! VIFM call system("tmux split-window -h 'COLORTERM=tmux-256color vifm -c " . '"split | view!"' . "  --on-choose " . '"nvr --servername ' . v:servername . '  --remote-silent %c " ' . getcwd() . " && tmux kill-pane'")
nnoremap <silent> <space>v :VIFM<cr>

set spelllang=pl,en

nnoremap <silent> <space>t :TagbarToggle<cr>

let s:hidden_all = 0
function! ToggleHiddenAll()
  if s:hidden_all  == 0
    let s:hidden_all = 1
    set laststatus=0
    IndentGuidesDisable
    call lightline#disable()
    syntax on
    set splitbelow
    LiteDFM
  else
    let s:hidden_all = 0
    set laststatus=2
    LiteDFMClose
    call lightline#enable()
    IndentGuidesEnable
    set splitright
  endif
endfunction

function! ImportJS(path)
  let l:arr1 = split(expand('%'), '/')
  let l:arr2 = split(a:path, '/')
  let size = len(l:arr1) < len(l:arr2) ? len(l:arr1) : len(l:arr2)

  for i in range(size)
    if l:arr1[0] != l:arr2[0] | break | endif
    call remove(l:arr1, 0)
    call remove(l:arr2, 0)
  endfor

  let l:first_part = repeat('../', len(l:arr1) - 1)

  if l:arr2[-1] == 'index.js'
    let l:name = '{}'
    let l:second_part = join(l:arr2[0:-2], '/')
  else
    let l:last = substitute(l:arr2[-1], '\v\.js$', '', '')
    let l:name = l:last
    let l:second_part = join(l:arr2[0:-2] + [l:last], '/')
  end
  call append(line('.'), ["import ". l:name ." from '" . l:first_part . l:second_part . "';"])
endfunction

command! ImportJS call fzf#run({'sink': function('ImportJS')})

nnoremap \z :exec 'normal vimzf'<cr>

" function! GitShow()
"   normal! zz
"   let l:filetype = &filetype
"   let l:path = expand('%')
"   let l:line = line('.')
"   exec 'vnew'
"   call append(0, systemlist('git show origin/production:' . l:path))
"   exec 'setf ' . l:filetype
"   exec 'normal! ' . l:line . 'G'
"   normal! zz
" endfunction
" command! GitShow call GitShow()
" nnoremap <silent> <space>gs :GitShow<cr>

function! TestColor()
  for i in range(1, 255)
    exec 'highlight MyGroup' . i . ' ctermfg=' . i
    call append(line('$'), 'Test TEST test')
    call matchadd('MyGroup' . i, '\%'. i . 'l')
  endfor
endfunction

function! FindClass()
  let l:str = substitute(@+, '::', '( *\n)?(( +class +| +module +)|::)', 'g')
  exec 'Ag ' . l:str
endfunction
command! FindClass call FindClass()

function! STest()
  let s:path = expand('%')
  let s:path = substitute(s:path, '\v\csrc', 'test', '')
  let s:path = substitute(s:path, '\v\c\.js$', '.test.js', '')
  exec 'e ' . s:path
endfunction
command! STest :silent call STest()<cr>

command! RCursor :set guicursor=n-v-c-i:block

" nnoremap s /\%<c-r>=line('.')<cr>l/e<left><left>

let g:incsearch#magic = '\v' " very magic

function! Pisz()
  set textwidth=100
  call lexical#init()
  call pencil#init({'wrap': 'hard'})
  set whichwrap=
  set spelllang=pl,en
endfunction

command! Pisz call Pisz()<cr>

nnoremap ,hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

function! ShowInOtherBranch(branch_name)
  exec 'vnew'
  let l:filename = expand('%:S')
  let l:command = 'git show ' . a:branch_name . ':' . l:filename
  echom l:command
  call append(0, systemlist(l:command))
  exec 'setf ruby'
endfunction

command! -nargs=1 SB :call ShowInOtherBranch(<f-args>)<cr>


function! EditTest()
  let l:path = expand('%')
  let l:path = substitute(l:path, '^app', 'spec', '')
  let l:path = substitute(l:path, '.rb$', '_spec.rb', '')
  exec 'edit ' . l:path
endfunction

command! EditTest call EditTest()

"   function! Insert(str)
"     let l:line =  getline('.')
"     call setline(line('.'), l:line[0:col('.')-2] . a:str . l:line[col('.')-1:])
"   endfunction

function! ResizeMode()
  redraw!
  let l:char = nr2char(getchar())

  if l:char ==? 'h'
    exec 'vertical resize ' . (winwidth(0) * 3/2)
    call ResizeMode()
  elseif l:char ==? 'l'
    exec 'vertical resize ' . (winwidth(0) * 2/3)
    call ResizeMode()
  else
    echo 'Exit ResizeMode'
  end
endfunction
command! ResizeMode call ResizeMode()

augroup leave_window
  autocmd!
  autocmd BufWinLeave * let g:last_buff = bufnr('%')
augroup END

command! Restore exec 'vnew | ' . g:last_buff . 'buff'
nnoremap <tab>t :Restore<cr>

inoremap <expr> <c-l> fzf#complete("rg --color=never --no-filename --no-line-number -e '^.*?class +([a-zA-Z0-9:]*) ?.*$' app/models -r '$1' \| sed '/^$/d' \| sort")

nnoremap <space>sd vip:s/.*//<left><left><left><left>

"Populate Arglist with shell command
command! -nargs=1 PA args `=systemlist(<q-args>)` | argdo e | syntax on

" Open help in full window
command! -nargs=? -complete=help H execute 'help ' . <q-args> . ' | only'

" select last pastet text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

vnoremap <c-g> :<c-u>%s/<c-r>"//<left>
vnoremap <c-d> :s/<c-r>z//<left>

" Show syntax highlighting groups for word under cursor
nnoremap <silent> M :call SynStack()<cr>

function! SynStack()
  if !exists('*synstack')
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"====================================
"------------Scripts-----------------
"====================================


function! DeleteEmptyBuffers()
  let [l:i, l:n; l:empty] = [1, bufnr('$')]
  while l:i <= l:n
    if bufexists(l:i) && buflisted(l:i) && bufwinnr(l:i)<0 && bufname(l:i) ==? ''
      call add(l:empty, l:i)
    endif
    let l:i += 1
  endwhile
  if len(l:empty) > 0
    exe 'bdelete!' join(l:empty)
  endif
endfunction

command! DeleteEmptyBuffers call DeleteEmptyBuffers()

function! AddArgs(cmd)
  call fzf#run ({
        \ 'source': systemlist('fd ' . a:cmd . ' -ptf'),
        \ 'sink':   'argadd',
        \ 'options': '-m'
        \})
endfunction
command! -bang -nargs=? -complete=dir AddArgs call AddArgs(<q-args>)

function! Args()
  call fzf#run({
        \ 'source': argv(),
        \ 'sink': 'e',
        \ 'options': '-m'})
endfunction
command! Args call Args()

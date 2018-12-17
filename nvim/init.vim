" Use gf to open config files

runtime vim_config/meta.vim
runtime vim_config/plugins.vim
runtime vim_config/plugins_config.vim
runtime vim_config/config.vim
runtime vim_config/keybindings.vim
runtime vim_config/scripts.vim
runtime vim_config/window_script.vim
" runtime vim_config/ruby_lib.vim
runtime vim_config/custom_start_window.vim
runtime vim_config/tabline.vim
" runtime vim_config/standup.vim
runtime vim_config/projects.vim

" JSON store:
" vim_config/json/projects.json

" runtime vim_config/status_line.vim

"====================================
"---------Testing_new_features-------
"====================================

function! Fzf_dev(cmd)
  let l:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {} | head -'.&lines.'"'

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': systemlist('fd ' . a:cmd . ' -ptf'),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction
command! -bang -nargs=? -complete=dir F call Fzf_dev(<q-args>)

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

function! GitShow()
  normal! zz
  let l:filetype = &filetype
  let l:path = expand('%')
  let l:line = line('.')
  exec 'vnew'
  call append(0, systemlist('git show origin/production:' . l:path))
  exec 'setf ' . l:filetype
  exec 'normal! ' . l:line . 'G'
  normal! zz
endfunction
command! GitShow call GitShow()
nnoremap <silent> <space>gs :GitShow<cr>

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

vnoremap <s-k> <esc>

function! STest()
  let s:path = expand('%')
  let s:path = substitute(s:path, '\v\csrc', 'test', '')
  let s:path = substitute(s:path, '\v\c\.js$', '.test.js', '')
  exec 'e ' . s:path
endfunction
command! STest :silent call STest()<cr>

command! RCursor :set guicursor=n-v-c-i:block

nnoremap s /\%<c-r>=line('.')<cr>l/e<left><left>

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

function! AddToArgsList()
  let l:buffers = map(range(1, bufnr('$')), 'bufname(v:val)')
  call filter(l:buffers, '!empty(v:val)')

  call fzf#run ({
        \ 'source':  (l:buffers),
        \ 'sink':   'argadd',
        \ 'options': '-m'
        \})
endfunction

function! Args()
  call fzf#run({
        \ 'source': argv(),
        \ 'sink': 'e',
        \ 'options': '-m'})
endfunction
command! Args call Args()

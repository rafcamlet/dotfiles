" Use gf to open config files

runtime vim_config/meta.vim
runtime vim_config/plugins.vim
runtime vim_config/config.vim
runtime vim_config/file_types_config.vim
runtime vim_config/plugins_config.vim
runtime vim_config/keybindings.vim
runtime vim_config/scripts.vim
runtime vim_config/ruby_lib.vim
runtime vim_config/ruby_scripts.vim
runtime vim_config/doppelganger.vim

" Custom colors

hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionMoveHL ctermbg=none ctermfg=cyan
hi agsvResultPattern ctermfg=red


"====================================
"---------Testing_new_features-------
"====================================

set path+=**

nnoremap <silent> + :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> - :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

nnoremap <silent> <leader>ro :exec 'e ' . system('bash', 'find $(pwd) -name routes.rb -print -prune -o -path ./tmp ')<cr>

nnoremap <silent> <leader>gs :Gstatus<cr>


" Fzf shourtcuts
nnoremap <space>ob :Buffers<cr>
nnoremap <space>og :GFiles?<cr>
nnoremap <space>ot  :FZF spec<cr>
nnoremap <space>ojs :FZF app/assets<cr>
nnoremap <space>oc  :FZF app/controllers<cr>
nnoremap <space>om  :FZF app/models<cr>
nnoremap <space>ov  :FZF app/views<cr>
nnoremap <space>os  :FZF app/services<cr>
nnoremap <space>of  :FZF app/form_objects<cr>

"Populate Arglist with shell command
command! -nargs=1 PA args `=systemlist(<q-args>)` | argdo e | syntax on

" Mark to last non blank character
" vnoremap $ g_

" Replace and down
nnoremap <silent> \| <down>:<C-U>exe repeat#run(v:count)<CR>

" Paste from register
nnoremap <space>np "np
nnoremap <space>mp "mp

" Open help in full window
command! -nargs=? -complete=help H execute 'help ' . <q-args> . ' | only'

" vim grep under the cursor
nnoremap gj :vimgrep <cword> *<cr>


" terminal move
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

tnoremap <esc> <c-\><c-n>

" search for visually highlighted text
vnoremap <silent> // y/\V<C-R>"<CR>``:set hls<cr>

" select last pastet text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

vnoremap <c-g> :<c-u>%s/<c-r>"//<left>
vnoremap <c-d> :s/<c-r>z//<left>

" highlight current word without search for next
nnoremap <silent> * :set hls<cr>*``

" repeat last command
noremap <space>w @:<CR>

" Switch between buffers
noremap <tab> :bn<cr>
noremap <S-tab> :bp<cr>

" select last pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" put current time
imap <F3> <C-R>=strftime("%Y-%m-%d %I:%M")<CR>

" moving aroung in command mode
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-0> <home>
cnoremap <c-0> <end>
cnoremap <c-x> <del>
cnoremap <c-v> <c-r>+

imap <silent> <C-L> <CR><Esc>O

" Show syntax highlighting groups for word under cursor
nnoremap <silent> M :call SynStack()<cr>

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"====================================
"------------Scripts-----------------
"====================================


function! DeleteEmptyBuffers()
  let [i, n; empty] = [1, bufnr('$')]
  while i <= n
    if bufexists(i) && buflisted(i) && bufwinnr(i)<0 && bufname(i) == ''
      call add(empty, i)
    endif
    let i += 1
  endwhile
  if len(empty) > 0
    exe 'bdelete!' join(empty)
  endif
endfunction

command! DeleteEmptyBuffers call DeleteEmptyBuffers()

function! K() range " {{{

  let lines = getline(a:firstline, a:lastline)
  let current_filetype = &filetype

  if exists('s:view') && bufloaded(s:view) | exec s:view.'bd!' | endif

  exec 'silent keepalt topleft ' . (len(lines) + 2) . ' split work_window'

  let s:view = bufnr('%')
  set modifiable


  call append(0, lines)
  call append(0, '')
  exec 'setf ' . current_filetype

  setl buftype=nofile
  setl noswapfile
  set  bufhidden=wipe
  set  scrolloff=2

  " setl nonu ro noma
  if (exists('&relativenumber')) | setl norelativenumber | endif

  exec ':2'

  " au BufHidden <buffer> exec s:view . 'bd!'

  " command! -nargs=0 -buffer OpenThis call <sid>open_this()
  " nnoremap <silent> <buffer> <cr> :OpenThis<cr>

endfunction
command! -range K <line1>,<line2>call K()
vnoremap <silent> <c-k> :call K()<cr>

function! T() range
  let lines = getline(a:firstline, a:lastline)
  for l in lines
    echom match(l, '\S')
  endfor

endfunction
command! -range T <line1>,<line2>call T()

function! AddToArgsList()
  let buffers = map(range(1, bufnr('$')), 'bufname(v:val)')
  call filter(buffers, '!empty(v:val)')

  call fzf#run ({
        \ 'source':  (buffers),
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

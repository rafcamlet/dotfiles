" Use gf to open config files

runtime vim_config/meta.vim
runtime vim_config/plugins.vim
runtime vim_config/config.vim
runtime vim_config/file_types_config.vim
runtime vim_config/plugins_config.vim
runtime vim_config/keybindings.vim
runtime vim_config/scripts.vim
runtime vim_config/window_script.vim
runtime vim_config/ruby_lib.vim
runtime vim_config/ruby_scripts.vim
runtime vim_config/doppelganger.vim
runtime vim_config/new_window.vim
runtime vim_config/custom_start_window.vim
runtime vim_config/tabline.vim


"====================================
"---------Testing_new_features-------
"====================================

command! CopyPath let @+ = expand("%:p")
nnoremap cp :CopyPath<cr>

nnoremap : ;
nnoremap <c-q> <esc>qq
vnoremap <c-q> :normal! @q<CR>

command! Reek exec 'T "reek ' . expand('%:p') . '"'

nnoremap <space>sd vip:s/.*//<left><left><left><left>

set path+=**

nnoremap <silent> + :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> - :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

nnoremap <leader><leader>r <esc>:R<cr>
nnoremap <leader><leader>a <esc>:A<cr>

nmap <space>c q:
nmap <space>q :copen<cr>


"Populate Arglist with shell command
command! -nargs=1 PA args `=systemlist(<q-args>)` | argdo e | syntax on

" Open help in full window
command! -nargs=? -complete=help H execute 'help ' . <q-args> . ' | only'


" select last pastet text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

vnoremap <c-g> :<c-u>%s/<c-r>"//<left>
vnoremap <c-d> :s/<c-r>z//<left>

" repeat last command
noremap <space>w @:<CR>

" Switch between buffers
noremap <tab> :bn<cr>
noremap <S-tab> :bp<cr>

" put current time
imap <F3> <C-R>=strftime("%Y-%m-%d %I:%M")<CR>


imap <silent> <C-L> <CR><Esc>O

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


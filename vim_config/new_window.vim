function! AddToWindow() range
  if -1 == bufwinnr('__scrach__')
    exec 'silent topleft pedit __scrach__' 
  endif
  let l:line = getline(a:firstline, a:lastline)
  let l:filetype = &filetype
  wincmd P

  setl buftype=nofile
  setl noswapfile
  setl bufhidden=wipe

  let  &filetype=l:filetype

  call append(line('$'), l:line)
  normal! G
  wincmd p
endfunction

" nnoremap <space>f :call AddToWindow()<cr>
" vnoremap <space>f :call AddToWindow()<cr>
" nnoremap <space>F :pclose<cr>

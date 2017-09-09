function! NewWin()
  exec 'silent pedit preview_window'
  wincmd P | wincmd L

  let g:window_nr = bufnr('%')

  setl buftype=nofile
  setl noswapfile
  setl bufhidden=wipe
  setl nomodifiable

  function! OpenNeovimPage()
    if line('.') != 2 | return 0 | endif
    call system('xdg-open https://github.com/neovim/neovim/wiki/Related-projects')
  endfunction

  nnoremap <silent><buffer> <cr> :call OpenNeovimPage()<cr>

  augroup preview_window_group
    autocmd!
    autocmd BufWipeout preview_window echo 'wipeout preview_window'
  augroup END

endfunction


function! WinFocus()
  exec bufwinnr(g:window_nr) . 'wincmd w'
endfunction


function! WinOpenOrFocus()
  if exists('g:window_nr') && -1 < bufwinnr(g:window_nr)
    call WinFocus()
  else
    call NewWin()
  endif
endfunction


function! WinAppend(str)

  call WinOpenOrFocus()

  setl modifiable

  if type(a:str) == 3
    for l:l in a:str
      call append(line('$'), l:l)
    endfor
  else
    call append(line('$'), a:str)
  endif

  setl nomodifiable

  wincmd p

endfunction

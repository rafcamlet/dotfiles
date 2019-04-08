function! Standup()
  let l:file = expand('~/Dropbox/standup/standup_' . strftime('%Y_%m_%d') . '.md')
  let l:template = expand('~/Dropbox/standup/template')
  let l:exists = filereadable(l:file)

  exec 'edit ' . l:file
  setf markdown
  setl spell

  if !l:exists
    call append(0, strftime('%d.%m.%Y'))
    call append(1, repeat('=', strlen(getline(1))))
    call append(2, '')
    call append(3, readfile(l:template))
    normal! 5G
  endif
endfunction

command! Standup call Standup()

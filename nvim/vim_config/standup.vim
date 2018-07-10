function! Standup()
  let l:file = expand('~/workdir/standup/standup_' . strftime('%Y_%m_%d') . '.md')
  let l:template = expand('~/workdir/standup/template')
  let l:exists = filereadable(l:file)

  exec 'edit ' . l:file
  setf markdown

  if !l:exists
    call append(0, readfile(l:template))
  endif
endfunction

command! Standup call Standup()

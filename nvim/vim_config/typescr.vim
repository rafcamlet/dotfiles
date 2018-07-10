function! FindComponents()
  call FindStaff('((?<=export\sclass\s)\w*|(?<=export\sconst\s)\w*\b)', 'src/components/components')
endfunction
command! FindComponents call FindComponents()

function! FindTypes()
  call FindStaff('(?<=const\s).*?(?= = \btypes\n?\s*\.model)', 'src/types')
endfunction
command! FindTypes call FindTypes()

function! FindViews()
  call FindStaff('(?<=class\s)\S+?\b', 'src/views')
endfunction
command! FindViews call FindViews()

function! FindStaff(cmd, path)
  let l:cmd_str = ['ag ', "'", a:cmd ,"' ", a:path , ' -o --color --nogroup --color-match=', "'", '1;34' , "'"]
  call fzf#run ({
        \ 'source':  systemlist(join(l:cmd_str, '')),
        \ 'sink':   'e',
        \ 'options': '--ansi'})
endfunction

function! SetTypescripMappings()
  nnoremap <buffer> <space>ov :FindViews<cr>
  nnoremap <buffer> <space>ot :FindTypes<cr>
  nnoremap <buffer> <space>oc :FindComponents<cr>
endfunction


function! SetupEnvironment()
  if empty(expand('%:p'))
    let l:path = getcwd()
  else
    let l:path = expand('%:p')
  endif

  if l:path =~? '/home/r/projekty/boardapp-website'
    call SetTypescripMappings()
    cd /home/r/projekty/boardapp-website
  endif
endfunction

autocmd! VimEnter,BufReadPost,BufNewFile * call SetupEnvironment()
autocmd! BufCreate,BufEnter * call SetupEnvironment()

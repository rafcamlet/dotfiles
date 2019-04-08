let g:projects = json_decode(readfile(fnamemodify($MYVIMRC, ':p:h') . '/vim_config/json/projects.json'))

function! FindInProject(cmd, path)
  let l:cmd_str = ['ag ', "'", a:cmd ,"' ", a:path , ' -o --color --nogroup --color-match=', "'", '1;34' , "'"]
  call fzf#run ({
        \ 'source':  systemlist(join(l:cmd_str, '')),
        \ 'sink':   'e',
        \ 'options': '--ansi'})
endfunction

function! SetupEnvironment() 
  let l:debug = 0

  if l:debug
    echom repeat('=', 20)
    echom 'b:setup_environment_ready: ' . (exists('b:setup_environment_ready') && b:setup_environment_ready == 1)
    echom 'modifiable: ' . !&l:modifiable
    echom 'path: ' . expand('%')
    echom 'buf name: ' . bufname(0)
  endif

  let l:skip = (exists('b:setup_environment_ready') && b:setup_environment_ready == 1) ||
        \ !&l:modifiable ||
        \ expand('%') =~? '^fugitive://'

  if l:debug && l:skip | echom 'skipping...' | endif
  if l:skip   | return | endif

  let b:setup_environment_ready = 1
  if l:debug | echom 'setting env ready' | endif

  let l:project_found = 0

  if empty(expand('%:p'))
    let l:path = getcwd()
  else
    let l:path = expand('%:p')
  endif

  for l:project in g:projects
    if l:path =~? l:project['root_path']
      let g:rooter_manual_only = 1
      let l:project_found = 1
      for l:mapping in get(l:project, 'mappings', [])
        exec 'nnoremap <buffer> <space>o' . l:mapping[0] . ' :call FindInProject("' . l:mapping[1] . '", "' . l:mapping[2] . '")<cr>'
      endfor

      if has_key(l:project, 'dictionary') && filereadable(expand(l:project['dictionary']))
        let &l:dictionary = expand(l:project['dictionary'])
      endif

      let l:files = get(l:project, 'files', {})
      for l:file in keys(l:files)
        exec 'nnoremap <buffer> <space>o' . l:file . ' :F ' . l:files[l:file] . '<cr>'
      endfor

      let l:settings = get(l:project, 'settings', {})
      for l:setting in keys(l:settings)
        if l:debug | echom 'let &l:' . l:setting . " = '" . l:settings[l:setting] . "'" | endif
        exec 'let &l:' . l:setting . " = '" . l:settings[l:setting] . "'"
      endfor

      exec 'cd ' . matchstr(l:path, '.*' . l:project['root_path'])
    endif
  endfor

  if !l:project_found
    let g:rooter_manual_only = 0
  endif
endfunction

autocmd! BufEnter * call SetupEnvironment()

let g:projects = json_decode(readfile(fnamemodify($MYVIMRC, ':p:h') . '/vim_config/json/projects.json'))

function! FindInProject(cmd, path)
  let l:cmd_str = ['ag ', "'", a:cmd ,"' ", a:path , ' -o --color --nogroup --color-match=', "'", '1;34' , "'"]
  call fzf#run ({
        \ 'source':  systemlist(join(l:cmd_str, '')),
        \ 'sink':   'e',
        \ 'options': '--ansi'})
endfunction

function! SetupEnvironment() abort

  if exists('b:setup_environmcnt_ready') || !&l:modifiable  | return | endif
  let b:setup_environmcnt_ready = 1

  let l:project_found = 0

  if empty(expand('%:p'))
    let l:path = getcwd()
  else
    let l:path = expand('%:p')
  endif

  for l:project in g:projects
    if l:path =~? l:project['root_path']
      echom 'Start projet ' . l:project['name'] . ' | ' . expand('%')
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
        exec 'let &l:' . l:setting . " = '" . l:settings[l:setting] . "'"
      endfor

      exec 'cd ' . matchstr(l:path, '.*' . l:project['root_path'])
    endif
  endfor

  if !l:project_found
    let g:rooter_manual_only = 0
  endif
endfunction

autocmd! VimEnter,BufReadPost,BufNewFile,BufCreate,BufEnter * call SetupEnvironment()

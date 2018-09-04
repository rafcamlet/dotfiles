let g:projects = [
      \ {
      \   'name': 'Blog',
      \   'root_path': 'projects/blog',
      \   'mappings': []
      \ },
      \ {
      \   'name': 'Talebook',
      \   'root_path': 'projects/talebook/frontend',
      \   'path': '.,src/**,,',
      \   'suffixesadd': '.js,.vue',
      \   'mappings': [
      \     ['t', 'index', '.']
      \   ],
      \   'files': [
      \     ['c', 'src/components']
      \   ],
      \ },
      \ {
      \   'name': 'Reactapp',
      \   'root_path': 'projects/reactapp',
      \   'path': '.,src/**,,',
      \   'suffixesadd': '.js',
      \   'files': [
      \     ['c', 'src/components']
      \   ]
      \ }
      \]

function! FindInProject(cmd, path)
  let l:cmd_str = ['ag ', "'", a:cmd ,"' ", a:path , ' -o --color --nogroup --color-match=', "'", '1;34' , "'"]
  call fzf#run ({
        \ 'source':  systemlist(join(l:cmd_str, '')),
        \ 'sink':   'e',
        \ 'options': '--ansi'})
endfunction

function! SetupEnvironment()

  if exists('b:setup_environmcnt_ready') | return | endif
  let b:setup_environmcnt_ready = 1

  let l:project_found = 0

  if empty(expand('%:p'))
    let l:path = getcwd()
  else
    let l:path = expand('%:p')
  endif

  for l:project in g:projects
    if l:path =~? l:project['root_path']
      echo 'Start projet ' . l:project['name']
      let g:rooter_manual_only = 1
      let l:project_found = 1
      for l:mapping in get(l:project, 'mappings', [])
        exec 'nnoremap <buffer> <space>o' . l:mapping[0] . ' :call FindInProject("' . l:mapping[1] . '", "' . l:mapping[2] . '")<cr>'
      endfor
      for l:file in l:project['files']
        exec 'nnoremap <buffer> <space>o' . l:file[0] . ' :FZF ' . l:file[1] . '<cr>'
      endfor

      exec 'set path =' . get(l:project, 'path', '.,/usr/include,,,**') . ',' . matchstr(l:path, '.*' . l:project['root_path']) . '/**'
      if has_key(l:project, 'includeexpr')
        let &includeexpr = get(l:project, 'includeexpr')
      endif
      if has_key(l:project, 'suffixesadd')
        let &suffixesadd = get(l:project, 'suffixesadd')
      endif

      exec 'cd ' . matchstr(l:path, '.*' . l:project['root_path'])
    endif
  endfor

  if !l:project_found
    let g:rooter_manual_only = 0
  endif
endfunction

autocmd! VimEnter,BufReadPost,BufNewFile,BufCreate,BufEnter * call SetupEnvironment()

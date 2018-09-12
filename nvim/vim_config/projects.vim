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
      \   'dictionary': '~/.config/nvim/dict/react',
      \   'files': [
      \     ['c', 'src/components']
      \   ]
      \ },
      \ {
      \   'name': 'Ixl',
      \   'settings':  [['shiftwidth', 4], ['softtabstop', 4], ['tabstop', 4], ['formatprg', '"prettier\ --stdin"']],
      \   'root_path': 'projects/ixl-front-end',
      \   'path': '.,src/**,,',
      \   'suffixesadd': '.js',
      \   'dictionary': '~/.config/nvim/dict/react',
      \   'files': [
      \     ['c', 'src/components'],
      \     ['r', 'src/reducers'],
      \     ['v', 'src/containers']
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
      if has_key(l:project, 'dictionary') && filereadable(expand(l:project['dictionary']))
        let &l:dictionary = expand(l:project['dictionary'])
      endif
      for l:settings in get(l:project, 'settings', [])
        exec 'let &l:' . l:settings[0] . ' = ' . l:settings[1]
      endfor

      exec 'cd ' . matchstr(l:path, '.*' . l:project['root_path'])
    endif
  endfor

  if !l:project_found
    let g:rooter_manual_only = 0
  endif
endfunction

autocmd! VimEnter,BufReadPost,BufNewFile,BufCreate,BufEnter * call SetupEnvironment()

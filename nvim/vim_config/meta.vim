function! OpenRuntime()
  if match(getline('.'), '^\s*runtime') > -1
    let l:file_name = substitute(getline('.'), '\v.*runtime\s+(.*)$' , '\1', '')
    let l:runtime_path =  fnamemodify($MYVIMRC, ':p:h')
    exec 'edit ' . l:runtime_path . '/' . l:file_name
  endif
endfunction


function! MyFoldText()
    let l:txt = substitute(getline(v:foldstart), '\v\{\{\{', '', 'g')
    let l:txt = substitute(l:txt, '\v"?', '', '')

    return l:txt . repeat(' ', winwidth(0))
endfunction

function! OpenPluginInGithub()
  let l:regexp =  "\\v(Plug.*')@<=\\S*(')@="

  if match(getline('.'), l:regexp) == -1 | return | endif

  call system('xdg-open https://github.com/' . matchstr(getline('.'), l:regexp))
endfunction


function! OpenPluginConfig()
  let l:regexp =  "\\v(Plug.*')@<=\\S*(')@="

  if match(getline('.'), l:regexp) == -1 | return | endif

  let l:plugin_name = matchstr(getline('.'), l:regexp)
  let l:runtime_path =  fnamemodify($MYVIMRC, ':p:h')

  exec 'edit ' . l:runtime_path . '/vim_config/plugins_config.vim'
  if !search(l:plugin_name, 'w')

    let l:marks = repeat('=', (47 - len(l:plugin_name)) / 2)
    let l:str = '" ' . l:marks . ' ' . l:plugin_name . ' ' . l:marks
    let l:str .= repeat('=', 52 - len(l:str))

    call append(line('$'), ['','', l:str, ''])
    normal! G
  endif

  normal! zt
endfunction


augroup nvim_init_group
  autocmd!
  autocmd BufRead init.vim nnoremap <buffer><silent> gf :call OpenRuntime()<cr>
  autocmd BufRead,BufEnter scripts.vim setlocal foldtext=MyFoldText()
  autocmd BufRead,BufEnter scripts.vim setlocal foldmethod=marker
  autocmd BufRead,BufEnter scripts.vim setlocal foldlevel=0
  autocmd BufRead plugins.vim nnoremap <buffer><silent> go :call OpenPluginInGithub()<cr>
  autocmd BufRead plugins.vim nnoremap <buffer><silent> gf :call OpenPluginConfig()<cr>
augroup END

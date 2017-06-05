function! OpenRuntime()
  if match(getline('.'), '^\s*runtime') > -1
    let file_name = substitute(getline('.'), '\v.*runtime\s+(.*)$' , '\1', '')
    let runtime_path =  fnamemodify($MYVIMRC, ':p:h')
    exec 'edit ' . runtime_path . '/' . file_name
  endif
endfunction

augroup nvim_init_group
  autocmd!
  autocmd BufRead init.vim nnoremap <buffer><silent> gf :call OpenRuntime()<cr>
augroup END

function! MyFoldText()
    let txt = substitute(getline(v:foldstart), '\v\{\{\{', '', 'g')
    let txt = substitute(txt, '\v"?', '', '')

    return txt . repeat(' ', winwidth(0))
endfunction

" Set folding for scripts
augroup nvim_script_group
  autocmd!
  autocmd BufRead,BufEnter scripts.vim setlocal foldtext=MyFoldText()
  autocmd BufRead,BufEnter scripts.vim setlocal foldmethod=marker
  autocmd BufRead,BufEnter scripts.vim setlocal foldlevel=0
augroup END

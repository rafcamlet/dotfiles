" Automatic read dictionaries for filetype and add easy access to edit it
" Use OpenDict command to edit current file type or pass filetype name
" ex: :OpenDict ruby
" Dictionaries are in $home/.config/nvim/dict directory
" Author: Rafał Camlet raf.camlet@gmail.com

function! s:set_dict(name)
  let dict_name = expand('$HOME') . '/.config/nvim/dict/' . a:name . '.txt'

  if filereadable(dict_name)
    let &l:dictionary = dict_name
  endif
endfunction

function! s:open_dict(...)
  if empty(&filetype) && (a:0 == 0 || a:1 == '')
    echom 'No filetype set. Use :OpenDict <filetype>'
    return
  endif

  let type = a:0 > 0 && a:1 != '' ? a:1 : &filetype
  execute 'edit ' . expand('$HOME') . '/.config/nvim/dict/' . type . '.txt'
endfunction

command! -nargs=? OpenDict call s:open_dict(<q-args>)

augroup ruby_dict_group
  autocmd!

  autocmd FileType ruby call s:set_dict('ruby')
  autocmd FileType vim call s:set_dict('vim')
augroup END

augroup vim_group
  autocmd!

  autocmd FileType vim let &l:foldmethod = 'marker'
augroup END

augroup markdown_group
  autocmd!

  autocmd FileType markdown setlocal spell spelllang=en,pl
augroup END


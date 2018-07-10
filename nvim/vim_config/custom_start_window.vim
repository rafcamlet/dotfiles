scriptencoding utf-8

augroup custom_start_window
  autocmd VimEnter    * nested call CustomStartWindow()
augroup END

" /home/r/.config/nvim/bundle/vim-startify/autoload/startify.vim:82

function! CustomStartWindow()
  if !argc() && (line2byte('$') == -1)

    let l:x = winwidth(0)
    let l:offset = repeat(' ', (l:x - 8)/ 2)
    exec 'echo "' . l:offset . 'Cześć R!"'

    " if &insertmode | return | endif

    " silent! setlocal
    "       \ bufhidden=wipe
    "       \ colorcolumn=
    "       \ nobuflisted
    "       \ nocursorcolumn
    "       \ nocursorline
    "       \ nolist
    "       \ nonumber
    "       \ norelativenumber
    "       \ nospell
    "       \ noswapfile

    " let l:y = winheight(0)
    " let l:x = winwidth(0)

    " call append('$', repeat(' ', (l:x - 4)/ 2) .  'Hi R!')

  endif

  autocmd! custom_start_window VimEnter
endfunction

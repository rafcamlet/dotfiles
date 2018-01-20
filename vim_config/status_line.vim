function! StatusLineFileName()
  let l:result = ''

  if &filetype ==# 'fzf' | return 'FZF' | endif
  if &filetype ==# 'nerdtree' | return '' | endif

  if expand('%:t') ==# ''
    let l:result = '[No Name]'
  else
    let l:result = expand('%')
  end

  if &modified == 1 | let l:result .= ' +' | endif

  return l:result
endfunction

function! StatusLineMode()
  let l:modes = {
        \ 'n'  : 'N',
        \ 'no' : 'N·Operator Pending',
        \ 'v'  : 'V',
        \ 'V'  : 'V·Line',
        \ '^V' : 'V·Block',
        \ 's'  : 'Select',
        \ 'S'  : 'S·Line',
        \ '^S' : 'S·Block',
        \ 'i'  : 'I',
        \ 'R'  : 'R',
        \ 'Rv' : 'V·Replace',
        \ 'c'  : 'N',
        \ 'cv' : 'Vim Ex',
        \ 'ce' : 'Ex',
        \ 'r'  : 'Prompt',
        \ 'rm' : 'More',
        \ 'r?' : 'Confirm',
        \ '!'  : 'Shell',
        \ 't'  : 'Terminal'
        \}


  return l:modes[mode()]
endfunction

function! StatusLineModeColor()
  if (mode() =~# '\v(n|no)')
    call StatusLineColor(1, 'blue')
  elseif (mode() =~# '\v(v|V|t)')
    call StatusLineColor(1, 'peach')
  elseif (mode() ==# 'i')
    call StatusLineColor(1, 'green')
  endif
  return ''
endfunction

function! StatusLine(active)
  let l:line = ''
  let l:line .= '%{StatusLineModeColor()}'

  if a:active
    let l:line .= '%#StatusLine_1#'
    let l:line .= ' %{StatusLineMode()} '
  endif


  let l:line .= '%#StatusLine_0#'
  let l:line .= ' %{fugitive#head()} |'
  let l:line .= ' %{StatusLineFileName()}'

  let l:line .= '%='
  let l:line .= '%p%%'
  let l:line .= '  %l:%c '
  return l:line
endfunction

function! StatusLineColor(nr, name)
  let l:colors = {
        \'normal': 236,
        \'blue': 109,
        \'green': 108,
        \'peach': 181
        \}
  exec 'hi! StatusLine_' . a:nr . ' ctermfg=' . l:colors[a:name] . ' cterm=reverse'
endfunction

function! RefreshStatusLine()
  for l:nr in range(1, winnr('$'))
    call setwinvar(l:nr, '&statusline', StatusLine(winnr() == l:nr))
  endfor
endfunction

hi StatusLine_0 ctermbg=236
hi StatusLine_1 ctermbg=236
hi StatusLine_2 ctermbg=236
hi StatusLine_3 ctermbg=236

let &updatetime = 2000
set laststatus=2

augroup status
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter,CursorHold,FileType,CursorMoved * call RefreshStatusLine()
augroup END

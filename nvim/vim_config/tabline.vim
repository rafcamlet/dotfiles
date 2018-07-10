function! MyTabLine()
  let l:s = ''
  for l:i in range(tabpagenr('$'))
    let l:tabnr = l:i + 1 " range() starts at 0
    let l:winnr = tabpagewinnr(l:tabnr)
    let l:buflist = tabpagebuflist(l:tabnr)
    let l:bufnr = l:buflist[l:winnr - 1]
    let l:bufname = fnamemodify(bufname(l:bufnr), ':t')

    let l:s .= '%' . l:tabnr . 'T'
    let l:s .= (l:tabnr == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let l:s .= ' ' . l:tabnr

    let l:s .= empty(l:bufname) ? ' [No Name] ' : ' ' . l:bufname . ' '

    let l:bufmodified = getbufvar(l:bufnr, '&mod')
    if l:bufmodified | let l:s .= '+ ' | endif
  endfor
  let l:s .= '%#TabLineFill#'
  return l:s
endfunction
set tabline=%!MyTabLine()

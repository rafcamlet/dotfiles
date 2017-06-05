"============================
"----------Scripts-----------
"============================


" JSONFormat {{{
command! JSONFormat normal :%!python -m json.tool<cr>
" }}}

" IndentToLine {{{
function! IndentToLine(mod) range
  if a:mod == 'up'
    let line = getline(a:firstline - 1)
  else
    let line = getline(a:lastline + 1)
  endif

  let len = strlen(matchstr(line, '^\s*'))
  let str = repeat(' ', len)

  for l in range(a:firstline, a:lastline)
    call setline(l, substitute(getline(l), '^\s*', str, ''))
  endfor
  call cursor('.', len + 1)
endfunction

nnoremap <silent> <s-k> :call IndentToLine("up")<cr>
vnoremap <silent> <s-k> :call IndentToLine("up")<cr>
" }}}

" PrettyXML {{{
function! DoPrettyXML()
  " save the filetype so we can restore it later
  set ft=
  " remove empty lines
  silent! g/^$/de
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/.*<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format --noent -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  silent %! htmlentity
  " back to home
  1
  " restore the filetype
  exec 'setf xml'
endfunction
command! PrettyXML call DoPrettyXML()
"}}}

" gn related scripts {{{
let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"

nnoremap cn :set hls<cr>*``cgn
nnoremap cN :set hls<cr>*``cgN

vnoremap <expr> cn g:mc . ":set hls<cr>``cgn"
vnoremap <expr> cN g:mc . ":set hls<cr>``cgN"

function! SetupCR()
  set hls
  let g:enter = mapcheck('<cr>', 'n')
  nnoremap <Enter> :nnoremap <lt>Enter> n@z<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n@z
  nnoremap <silent> <esc> :call ClearCR()<cr>
endfunction
function! ClearCR()
  set nohls
  exec 'unmap <esc>'
  exec 'nnoremap <cr> ' . g:enter
endfunction

nnoremap cq :call SetupCR()<CR>*``qz
nnoremap cQ :call SetupCR()<CR>#``qz

vnoremap <expr> cq ":\<C-u>call SetupCR()\<CR>" . "gv" . g:mc . "``qz"
vnoremap <expr> cQ ":\<C-u>call SetupCR()\<CR>" . "gv" . substitute(g:mc, '/', '?', 'g') . "``qz"

nnoremap <silent> ,s1 :<C-u>call RemoveLastChar()<CR>
function! RemoveLastChar()
  echo 'Remove last:'
  execute "normal! vip:s/".nr2char(getchar())."\s*$//\<cr>"
endfunction
"}}}

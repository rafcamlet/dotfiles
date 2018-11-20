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

" nnoremap <silent> <s-k> :call IndentToLine("up")<cr>
" vnoremap <silent> <s-k> :call IndentToLine("up")<cr>
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

" GetVisualSelection {{{
function! GetVisualSelection()
  " Why is this not a built-in Vim script function?!
  let [l:line_start, l:column_start] = getpos("'<")[1:2]
  let [l:line_end, l:column_end] = getpos("'>")[1:2]
  let l:lines = getline(l:line_start, l:line_end)
  if len(l:lines) == 0
    return ''
  endif
  let l:lines[-1] = l:lines[-1][: l:column_end - (&selection ==# 'inclusive' ? 1 : 2)]
  let l:lines[0] = l:lines[0][l:column_start - 1:]
  return join(l:lines, "\n")
endfunction
" }}}

" gn related scripts {{{

function! SelectionToSearch()
  let @/ = escape(GetVisualSelection(), '.')
  setlocal hlsearch
endfunction

vnoremap <silent> // :<c-u>call SelectionToSearch()<cr>

function! SetupQGN()
  set hls
  nnoremap q q:unmap q<cr>:call repeat#set("\<Plug>QGN", -1)<CR>
endfunction

nnoremap cn :set hls<cr>*``"_cgn
nnoremap cN :set hls<cr>*``cgN

vnoremap <silent> cn :<c-u>call SelectionToSearch()<cr>"_cgn
vnoremap <silent> cN :<c-u>call SelectionToSearch()<cr>"_cgN

nnoremap cq :call SetupQGN()<cr>*``qz
nnoremap cQ :call SetupQGN()<cr>#``qz

vnoremap cq :<c-u>call SelectionToSearch()<CR>qz
vnoremap cQ :<c-u>call SelectionToSearch()<CR>qz

nnoremap <silent> <Plug>QGN n@z:call repeat#set("\<Plug>QGN", -1)<CR>

"}}}

" Remove last char {{{
nnoremap <silent> ,s1 :<C-u>call RemoveLastChar()<CR>
function! RemoveLastChar()
  echo 'Remove last:'
  execute 'normal! vip:s/'.nr2char(getchar())."\s*$//\<cr>"
endfunction
"}}}

" Z - cd to recent / frequent directories {{{
command! -nargs=* Z :call Z(<f-args>)
function! Z(...)
  let l:cmd = 'fasd -d -e printf'
  for l:arg in a:000
    let l:cmd = l:cmd . ' ' . l:arg
  endfor
  let l:path = system(l:cmd)
  if isdirectory(l:path)
    echo l:path
    exec 'e ' . l:path
  endif
endfunction
"}}}

" SendToTmux {{{
function! SendToTmxu(nr) range
  let l:lines = getline(a:firstline, a:lastline)

  let l:cmd = 'tmux send-keys -t '  . a:nr . ' '

  call map(l:lines, 'escape(v:val, "\"$`;")')
  let l:content = join(l:lines, "\n")

  call system(l:cmd . '"' . l:content . '"' . ' c-m')
endfunction


nnoremap <silent> <space>s1 :call SendToTmxu(1)<cr>
vnoremap <silent> <space>s1 :call SendToTmxu(1)<cr>
nnoremap <silent> <space>s2 :call SendToTmxu(2)<cr>
vnoremap <silent> <space>s2 :call SendToTmxu(2)<cr>
nnoremap <silent> <space>s3 :call SendToTmxu(3)<cr>
vnoremap <silent> <space>s3 :call SendToTmxu(3)<cr>
nnoremap <silent> <space>s4 :call SendToTmxu(4)<cr>
vnoremap <silent> <space>s4 :call SendToTmxu(4)<cr>
nnoremap <silent> <space>s5 :call SendToTmxu(5)<cr>
vnoremap <silent> <space>s5 :call SendToTmxu(5)<cr>
nnoremap <silent> <space>s0 :call SendToTmxu('0.1')<cr>

function! SendBufToTmxu(all) range

  let l:current_pane = system("tmux display-message -p '#{pane_index}'")
  let l:pane = (l:current_pane =~# '0') ? '.1' : '.0'

  if a:all
    let l:lines = getline('1', line('$'))
  else
    let l:lines = getline(a:firstline, a:lastline)
  end


  call map(l:lines, 'escape(v:val, "\"$`;")')

  let l:cmd = 'tmux send-keys -t '  . l:pane . ' '
  let l:content = join(l:lines, "\n")

  call system(l:cmd . '"' . l:content . '"' . ' c-m')
endfunction

nnoremap <silent> <space>a :call SendBufToTmxu(1)<cr>
nnoremap <silent> <space>f :call SendBufToTmxu(0)<cr>
vnoremap <silent> <space>f :call SendBufToTmxu(0)<cr>

function! TestThis()
  call system('tmux send-keys -t 3 "rspec ' . escape((expand('%:p') . ':' . line('.')), '"') .  '" c-m')
endfunction
command! TestThis call TestThis()
"}}}

" ScratchWindow {{{
" function! ScratchWindow(copy) range

"   let l:winnr = bufwinnr('__scratch_window__')
"   if l:winnr > -1 && !a:copy
"     exe l:winnr . ' wincmd w'
"     wincmd c
"     return
"   endif

"   if a:copy
"     let l:lines = getline(a:firstline, a:lastline)
"   endif

"   if a:copy && l:winnr > -1
"     exe l:winnr . ' wincmd w'
"   end

"   if !a:copy || a:copy && l:winnr == -1
"     exec 'silent vnew __scratch_window__'
"     wincmd K
"     resize 10
"     setl buftype=nofile
"     setl noswapfile
"     setl scrolloff=0
"   endif

"   if a:copy
"     call append(line('$'), l:lines)
"     call append(line('$'), '')
"   endif
"   normal! zb
" endfunction

" nnoremap <space>i :call ScratchWindow(0)<cr>
" vnoremap <space>i :call ScratchWindow(1)<cr>
"}}}

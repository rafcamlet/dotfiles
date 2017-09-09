let g:mapleader=','
nnoremap ; :
nnoremap ' `
inoremap jk <esc>`^
cnoremap jk <c-c>

nnoremap <silent> <enter> :put =''<cr>
cnoremap <silent> <enter> <cr>


augroup ECW_au
  au!
  au CmdwinEnter * nmap <buffer> <CR> <CR>
  au CmdwinEnter * nmap <buffer> <space>c :q<CR>
  au BufReadPost quickfix nnoremap <buffer> <CR> <CR><c-w><c-p>
  au BufReadPost quickfix nnoremap <buffer> o <CR>
augroup END
"}

map <silent> <Down> g<Down>
map <silent> <Up> g<Up>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" rails shorts
nnoremap <leader>ro <esc>:Einitializer<cr>
nnoremap <leader>gem <esc>:Elib<cr>
nnoremap <leader>js <esc>:Ejavascript application<cr>
nnoremap <leader>st <esc>:Estylesheet application<cr>
nnoremap <leader>la <esc>:Elayout application<cr>
nnoremap <leader>ap <esc>:Econtroller application<cr>
nnoremap <leader>i <esc>:Emigration<cr>

nnoremap / /\v
nnoremap ? ?\v

" Find merge conflict markers
nnoremap <silent> <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Replace macro for all lines in paragraph
nnoremap <silent> <Leader>@ vip:normal @q<cr>

" Format paragraph
nnoremap Q mp=ip`p
vnoremap Q =

"common substitution mapings
nnoremap <leader>s, :.s/,/,\r/<cr>
nnoremap <leader>s<cr> :.s/\v^\s*//<cr>:.s/\v(\S)@<=\s+/\r/<cr>
nnoremap <leader>s<tab>  :%s/	/  /<cr>
nnoremap <leader>sc :.s#_\(\l\)#\u\1#<cr>
nnoremap <leader>sC :.s#\v(<.)\|_(\l)#\u\1\2#<cr>

nnoremap <leader>sa vip:s/\v$//<left>
vnoremap <leader>sa :s/\v$//<left>

nnoremap <silent> <Plug>SRemoveMultipleSpace :.s/\v(\S)@<=\s+/ /<cr>:.s/\v\s*$//<cr>:call repeat#set("\<Plug>SRemoveMultipleSpace")<CR>
nmap <Leader>s<space>  <Plug>SRemoveMultipleSpace

nnoremap <silent> <Plug>SRemoveSemicolon :.s/\v;$//<cr>:call repeat#set("\<Plug>SRemoveSemicolon")<CR>
nmap <Leader>s; <Plug>SRemoveSemicolon

nnoremap <silent> <Plug>SBrekTags :.s/</\r</<cr>:call repeat#set("\<Plug>SBrekTags")<CR>
nmap <Leader>st <Plug>SBrekTags

"boost regexp, double dot insert nongreedy any character
cnoremap .. .{-}

" repeat last action for selected lines
vnoremap . :normal .<CR>
" repeat q macro for selected lines
vnoremap @ :normal! @q<CR>

"open path from system clipboard
nmap <silent> co :e <c-r>+<cr>

"copy path to current file
nmap <silent> cp :let @+ = expand("%:p")<cr>

" put last yanked text
" nnoremap <c-p> "0p
" vnoremap <c-p> "0p
" inoremap <c-p> <c-r>0

" tab mappings
nnoremap   <space>1      1gt
nnoremap   <space>2      2gt
nnoremap   <space>3      3gt
nnoremap   <space>4      4gt
nnoremap   <space>5      5gt
nnoremap   <space>6      6gt
nnoremap   <space>7      7gt
nnoremap   <space>8      8gt
nnoremap   <space>9      9gt
nnoremap   <space>0      :tabfirst<CR>
nnoremap   <silent>  <c-t><c-t> :tabnew<CR>:tabmove<cr>
nnoremap   <silent>  <c-t><c-m> <c-w>T
nnoremap   <silent>  <c-t><c-q> :tabc<cr>

" Copy to end of line
nnoremap Y y$

" terminal move
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

tnoremap <esc> <c-\><c-n>

" search for visually highlighted text
vnoremap <silent> // y/\V<C-R>"<CR>``:set hls<cr>

" highlight current word without search for next
nnoremap <silent> * :set hls<cr>*``

" moving aroung in command mode
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-0> <end>
cnoremap <c-x> <del>
cnoremap <c-v> <c-r>+

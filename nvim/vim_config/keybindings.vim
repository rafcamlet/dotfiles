let g:mapleader=','
nnoremap ; :
nnoremap ' `
nnoremap : ;
vnoremap : ;
vnoremap ; :

inoremap kj <esc>`^

nnoremap <c-]> g<c-]>

nnoremap <silent> <enter> :put =''<cr>
cnoremap <silent> <enter> <cr>

map <silent> <Down> g<Down>
map <silent> <Up> g<Up>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" rails shorts
nnoremap <leader>i <esc>:Emigration<cr>

nnoremap / /\v
nnoremap ? ?\v

" Find merge conflict markers
nnoremap <silent> <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Replace macro for all lines in paragraph
nnoremap <silent> <Leader>@ vip:normal @q<cr>

" Rerun substitution for all lines in selection
vnoremap & :<c-u>silent! execute "'<,'> normal! &"<cr>

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

" repeat last action for selected lines
vnoremap . :normal .<CR>
" repeat q macro for selected lines
vnoremap @ :normal! @q<CR>

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

" tnoremap <esc> <c-\><c-n>

" highlight current word without search for next
nnoremap <silent> * :set hls<cr>*``

" moving aroung in command mode
cnoremap <c-h> <left>
cnoremap <expr> <c-j> pumvisible() ? "<right>" : "<down>"
cnoremap <expr> <c-k> pumvisible() ? "<left>" : "<up>"
" set wildcharm=<c-n>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-0> <end>
cnoremap <c-x> <del>
cnoremap <c-v> <c-r>+
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>

command! CopyAbsolutePath let @+ = expand("%:p")
nnoremap cP :CopyAbsolutePath<cr>

command! CopyPath let @+ = expand("%")
nnoremap cp :CopyPath<cr>

vnoremap c "_c

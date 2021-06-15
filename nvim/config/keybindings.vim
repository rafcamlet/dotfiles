let g:mapleader=','
nnoremap ; :
nnoremap ' `
nnoremap : ;
vnoremap : ;
vnoremap ; :

inoremap kj <esc>`^

nnoremap <silent> <enter> :put =''<cr>
cnoremap <silent> <enter> <cr>
autocmd FileType qf nnoremap <buffer> <cr> <cr>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :luafile $MYVIMRC<CR>

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
cnoremap <c-n> <down>
cnoremap <c-p> <up>
inoremap <c-a> <home>
inoremap <c-e> <end>

command! CopyAbsolutePath let @+ = expand("%:p")
nnoremap cP :CopyAbsolutePath<cr>

command! CopyPath let @+ = expand("%")
nnoremap cp :CopyPath<cr>

vnoremap c "_c

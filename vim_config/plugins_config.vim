" TODO move to plugins


"Plug 'kassio/neoterm'[
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>

" Rails commands
command! Troutes :T rake routes
command! -nargs=+ Troute :T rake routes | grep <args>
command! Tmigrate :T rake db:migrate
"]

"Plug 'justinmk/vim-sneak'[
let g:sneak#s_next = 1
"]

"vim-easy-align[
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"]

"terryma/vim-multiple-cursors[
let g:multi_cursor_quit_key='<C-c>'
nnoremap <silent> <C-c> :call multiple_cursors#quit()<CR>

let g:multi_cursor_exit_from_insert_mode = 0

function! Multiple_cursors_before()
  let g:deoplete#disable_auto_complete = 1
endfunction
function! Multiple_cursors_after()
  let g:deoplete#disable_auto_complete = 0
  " call clearmatches()
endfunction
"]


" vim-ctrlspace/vim-ctrlspace[
if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

let g:CtrlSpaceSearchTiming = 500
let g:CtrlSpaceSetDefaultMapping = 1
let g:CtrlSpaceDefaultMappingKey = "<C-D>"
let g:airline_exclude_preview = 1
" ]


" kassio/neoterm[
let g:neoterm_position = 'vertical'
"]

" janko-m/vim-test[
nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>tn :TestNearest<cr>

" function! SilentNeoterm(cmd)
"   call neoterm#do(a:cmd) | call neoterm#close()
" endfunction
" let g:test#custom_strategies = {'silent_neoterm': function('SilentNeoterm')}
" let g:test#strategy = 'silent_neoterm'

let g:test#strategy = 'neoterm'
" let g:test#strategy = 'vimux'
" let g:test#strategy = 'vtr'
" let g:test#strategy = 'neovim'
"]

" vim-lengthmatters[
let g:lengthmatters_start_at_column = 120
"]

" vim-jsx[
let g:jsx_ext_required = 0
"]

" ShowMeDB[
let g:ShowMeDB_default_mapping = 0
nmap <space>db <plug>show_me_db_fzf_force
nmap <space>gdb <plug>show_me_db_word_under_cursor_force
"]

" vim-grepper[
let g:grepper = {
    \ 'tools': ['x', 'git', 'ag'],
    \ 'x': {
    \   'grepprg':    'ag --nogroup --nocolor --column',
    \   'grepformat': '%f:%l:%m',
    \   'escape':     '\+*^$()[]',
    \ }}

nnoremap <leader>ag  :Grepper -tool ag  -open -switch -grepprg ag<cr>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
"]


"indentLine [
let g:indentLine_color_term = 240
"]

"deoplete.nvim [
let g:deoplete#enable_at_startup = 1

let g:monster#completion#rcodetools#backend = "async_rct_complete"
"]

" Airline config [
let g:airline_theme='serene' " Theme
let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#tabline#enabled = 1
"]

" NERDTree [
nnoremap <c-g><c-g> :NERDTreeToggle<cr>
nnoremap <c-g><c-f> :NERDTreeFind<cr>
autocmd vimrc VimEnter * NERDTree
autocmd vimrc VimEnter * wincmd p
"]

" Tagbar [
" nnoremap <silent> <c-t> :TagbarToggle<cr>
"]

" UltiSnips [
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsEditSplit="vertical"


" Rails.vim [
set viminfo^=!
let g:rails_default_file='config/database.yml'
" ]

" Javascript library syntax [
let g:used_javascript_libs = 'underscore,jquery,angularjs,angularui'
"]

" EasyMotion [
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" nmap s <Plug>(easymotion-s)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
nnoremap <space>j <Plug>(easymotion-j)
nnoremap <space>k <Plug>(easymotion-k)
" Gif config
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)

nnoremap <space>w <Plug>(easymotion-bd-w)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ACDEFGHIJKLMNOPRSTUVWXYZ;'
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_inc_highlight = 1
"]


" Silver Searcher [
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  " set grepprg=ag\ --nogroup\ --nocolor
  set grepprg=ag\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif
let g:aghighlight=1
"]

" CtralSF [
"By default CtrlSF window will be opened at left, change it to right by
let g:ctrlsf_position = 'right'
nnoremap <space>f :CtrlSF -I -R 
nnoremap <silent> <space>F :CtrlSFOpen<cr>
"]
"}}}

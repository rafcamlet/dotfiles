
" ============ svermeulen/vim-easyclip =============

let g:EasyClipEnableBlackHoleRedirect = 0
let g:EasyClipUseCutDefaults = 0
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipPreserveCursorPositionAfterYank = 1
let g:EasyClipUsePasteDefaults = 0

nmap p <plug>G_EasyClipPasteAfter
nmap P <plug>G_EasyClipPasteBefore
nmap <c-p> <plug>EasyClipSwapPasteForward
nmap <c-n> <plug>EasyClipSwapPasteBackwards


" =========== junegunn/vim-after-object ============

augroup vim_after_object
  autocmd!
  autocmd VimEnter * call after_object#enable(']', '[', '=', ':', ',', '-')
augroup END


" ================= junegunn/fzf ===================

let $FZF_DEFAULT_COMMAND = 'ag -l -p ~/.agignore -g ""'

nnoremap <silent> <space>oo :FZF<cr>
nnoremap <silent> <space>o :FZF<cr>
nnoremap <silent> <space>oh :History<cr>

nnoremap <space>ob :Buffers<cr>
nnoremap <space>og :GFiles?<cr>
nnoremap <space>ot  :FZF spec<cr>
nnoremap <space>ojs :FZF app/assets<cr>
nnoremap <space>oc  :FZF app/controllers<cr>
nnoremap <space>om  :FZF app/models<cr>
nnoremap <space>ov  :FZF app/views<cr>
nnoremap <space>os  :FZF app/services<cr>
nnoremap <space>of  :FZF app/form_objects<cr>
nnoremap <space>on  :FZF ~/notes<cr>

let g:fzf_history_dir = '~/.local/share/fzf-history'


" ================ dyng/ctrlsf.vim =================

"By default CtrlSF window will be opened at left, change it to right by
let g:ctrlsf_position = 'right'
nnoremap <space>f :CtrlSF -I -R 
nnoremap <silent> <space>F :CtrlSFOpen<cr>


" ================ kassio/neoterm ==================

let g:neoterm_position = 'vertical'
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>
nnoremap <leader>tt :Topen<cr>
nnoremap <silent> <leader>ts :TREPLSendLine<cr>
vnoremap <silent> <leader>ts :TREPLSendSelection<cr>

" tnoremap <silent> <tab>c <c-\><c-n>:call neoterm#close()<cr>
 nnoremap <silent> <f10> :TREPLSendFile<cr>

" ================ tpope/vim-rails =================

" Rails commands
command! Troutes :T rake routes
command! -nargs=+ Troute :T rake routes | grep <args>
command! Tmigrate :T rake db:migrate

set viminfo^=!
let g:rails_default_file='config/database.yml'


" ============ junegunn/vim-easy-align =============

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"]


" ========== vim-ctrlspace/vim-ctrlspace ===========

if executable('ag')
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

let g:CtrlSpaceSearchTiming = 500
let g:CtrlSpaceSetDefaultMapping = 1
let g:CtrlSpaceDefaultMappingKey = '<C-D>'
let g:airline_exclude_preview = 1


" =============== janko-m/vim-test =================

nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>tn :TestNearest<cr>

let g:test#strategy = 'neoterm'
" let g:test#strategy = 'vimux'
" let g:test#strategy = 'vtr'
" let g:test#strategy = 'neovim'


" ========== junegunn/vim-lengthmatters ============

let g:lengthmatters_start_at_column = 120


" ================== mxw/vim-jsx ===================

let g:jsx_ext_required = 0


" ============= ~/projekty/show-me-db ==============

let g:ShowMeDB_default_mapping = 0
nmap <space>db <plug>show_me_db_fzf_force
nmap <space>gdb <plug>show_me_db_word_under_cursor_force


" =============== mhinz/vim-grepper ================

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


" ============== Yggdroot/indentLine ===============

let g:indentLine_color_term = 240


" ============= Shougo/deoplete.nvim ===============

let g:deoplete#enable_at_startup = 1
let g:monster#completion#rcodetools#backend = 'async_rct_complete'


" =============== bling/vim-airline ================

let g:airline_theme='serene' " Theme
let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#tabline#enabled = 1


" ============== scrooloose/nerdtree ===============

nnoremap <c-g><c-g> :NERDTreeToggle<cr>
nnoremap <c-g><c-f> :NERDTreeFind<cr>
" autocmd vimrc VimEnter * NERDTree
" autocmd vimrc VimEnter * wincmd p


" =============== SirVer/ultisnips =================

let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
let g:UltiSnipsEditSplit='vertical'


" ==== othree/javascript-libraries-syntax.vim ======

let g:used_javascript_libs = 'underscore,jquery,angularjs,angularui'



" =================== w0rp/ale =====================

let g:ale_sign_column_always = 1
let g:ale_ruby_flag = 0

let g:ale_linters = { 'ruby': ['ruby'] }

function! ChangeRubyLinters()
  if g:ale_ruby_flag
    echo 'simple'
    let g:ale_linters = { 'ruby': ['ruby'] }
    let g:ale_ruby_flag = 0
  else
    echo 'full'
    let g:ale_linters = { 'ruby': ['brakeman', 'rails_best_practices', 'reek', 'rubocop', 'ruby'] }
    let g:ale_ruby_flag = 1
  end
  ALELint
endfunction

command! ChangeRubyLinters call ChangeRubyLinters()
nnoremap <space>r :ChangeRubyLinters<cr>

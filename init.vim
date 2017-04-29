" Use * to quick jump
"====================================
"----------0_Plugins-----------------
"----------1_Config------------------
"----------2_Filetype_config---------
"----------3_Plugins_config----------
"----------4_Keybindings-------------
"----------5_Custom_colors-----------
"----------6_Testing_new_features----
"----------7_Scripts-----------------
"====================================


" :ec fnamemodify( '/usr/bin/', ':p:h')

augroup nvim_init_group
  autocmd!

  " Jump to Next/Previous section mapings
  autocmd BufRead init.vim nnoremap <buffer><silent> ]c /\v-{10}\d_<cr>zt
  autocmd BufRead init.vim nnoremap <buffer><silent> [c ?\v-{10}\d_<cr>zt
  autocmd BufRead init.vim nnoremap <buffer><silent> <s-k> za
  " alternative set local options form
  autocmd BufRead init.vim let &l:foldmethod = 'marker'
augroup END


"====================================
"----------0_Plugins-----------------
"====================================
"{{{
"curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.config/nvim/bundle')
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'L9'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'vim-ruby/vim-ruby'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'UltiSnips'
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits
Plug 'michaeljsmith/vim-indent-object'
Plug 'pbrisbin/vim-mkdir'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tmhedberg/matchit'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'burnettk/vim-angular'
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-unimpaired'
Plug 'rking/ag.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'kana/vim-textobj-user' "Vim plugin: Create your own text objects
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'AndrewRadev/splitjoin.vim' " Plugin that simplifies the transition between multiline and single-line code
Plug 'airblade/vim-rooter'
Plug 'kchmck/vim-coffee-script'
Plug 'jelera/vim-javascript-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " A command-line fuzzy finder written in Go
Plug 'junegunn/fzf.vim' " More options for fzf in vim
Plug 'Shougo/deoplete.nvim' " Dark powered asynchronous completion framework for neovim
Plug 'benekastah/neomake' " asynch alternative for syntastic
Plug 'thinca/vim-quickrun' " Run current file and show output in new buffer
Plug 'jeetsukumaran/vim-indentwise' " Indent motion
Plug 'rafcamlet/shadowmoth' " best colorscheme ever!
Plug 'coderifous/textobj-word-column.vim' " Select column of text example: vic

" TEST plugin
" Plug 'w0rp/ale' " Asynchronous Lint Engine do przetestowania
" Plug 'itchyny/vim-cursorword' " Underlines the word under the cursor 
Plug 'sheerun/vim-polyglot' " A solid language pack for Vim.Plug 'benmills/vimux'
Plug 'trevordmiller/nova-vim'
Plug 'slim-template/vim-slim'
Plug 'vim-scripts/SyntaxRange'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/SQLUtilities'
Plug 'tpope/vim-speeddating'
Plug 'jceb/vim-orgmode' " Text outlining and task management for Vim based on Emacs' Org-Mode 

Plug 'lambdalisue/gina.vim' " An awesome git handling plugin for Vim
Plug 'bogado/file-line' "Plugin for vim to enabling opening a file in a given line
Plug 'brooth/far.vim' "Find And Replace Vim plugin
Plug 'gabesoft/vim-ags'
Plug 'justinmk/vim-sneak'
Plug 'koron/nyancat-vim'
Plug 'rhysd/nyaovim-markdown-preview'
Plug 'gabrielelana/vim-markdown'
Plug 'dag/vim-fish'
Plug 'fishbullet/deoplete-ruby'
" Plug 'syngan/vim-vimlint'
Plug 'posva/vim-vue'
Plug 'Shougo/denite.nvim' " Unite and create user interfaces
Plug 'junegunn/vim-easy-align' " A Vim alignment plugin
Plug 'junegunn/gv.vim' "A git commit browser
Plug 'othree/xml.vim' " A plugin for editing xml
" Plug 'christoomey/vim-tmux-runner' "A simple, vimscript only, command runner for sending commands from vim to tmux.
Plug 'janko-m/vim-test' "A Vim wrapper for running tests on different granularities.
" Plug 'junegunn/vim-lengthmatters'
" Plug 'junegunn/vim-peekaboo' "show the contents of the registers
Plug 'ecomba/vim-ruby-refactoring'
Plug 'xolox/vim-misc'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'pelodelfuego/vim-swoop'
Plug 'airblade/vim-gitgutter'
" Plug 'majutsushi/tagbar' "Vim plugin that displays tags in a window, ordered by scope
Plug 'Shutnik/jshint2.vim'
Plug 'mhinz/vim-grepper' " vim wrapper around 'grepprg' and 'grepformat'

Plug 'kassio/neoterm' " Wrapper of some neovim's :terminal functions.
Plug 'tpope/vim-bundler' " Lightweight support for Ruby's Bundler
" Plug 'sjl/gundo.vim' " Plugin to visualize your Vim undo tree.
Plug 'terryma/vim-multiple-cursors' " True Sublime Text style multiple selections for Vim
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction

" Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'mxw/vim-jsx'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'eugen0329/vim-esearch' "Plugin performing project-wide async search and replace
Plug 'leafgarland/typescript-vim' "Typescript syntax files for Vim
Plug 'tpope/vim-abolish' "easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-ragtag' " ragtag.vim: ghetto HTML/XML mappings (formerly allml.vim)

" Plug '~/projekty/test-plug' " My test plugin
Plug '~/projekty/show-me-db' " My test plugin
Plug '~/projekty/vim-nest' " My test plugin

call plug#end()
"}}}
"====================================
"----------1_Config------------------
"====================================
"{{{
set shortmess+=A                               " Always edit file, even when swap file is found
set diffopt=filler,iwhite                      " In diff mode, ignore whitespace changes and align unchanged lines
set fileencodings=ucs-bom,utf-8,default,latin1 " encoding
set termencoding=utf-8                         " terminal encoding
set nomodeline                                 " turn off modeline for safety
set ruler                                      " position info
set number                                     " show line numbers
set backspace=indent,eol,start                 " Allow backspace in insert mode
set history=1000                               " Store lots of :cmdline history
set showcmd                                    " Show incomplete cmds down the bottom
set showmode                                   " Show current mode down the bottom
set autoread                                   " Reload files changed outside vim
set showmatch                                  " highlight matching bracket
set lazyredraw                                 " redraw only when we need to.
set linebreak                                  " Wrap lines at convenient points
set nobackup                                   " prevent backup
set noswapfile                               " prevent swapfile
set nowritebackup                              " prevent backup
set display+=lastline                          " show whole lines
set virtualedit=onemore                        " Allow for cursor beyond last character
set scrolljump=5                               " Lines to scroll when cursor leaves screen
set scrolloff=3                                " Minimum lines to keep above and below cursor
syntax on                                      " turn on syntax highlighting
" set backupdir=~/.backup,./.backup,/tmp         " set backup directory
set directory=~/.vim/swap                      " Directory to use for the swap file
set langmenu=en_US                             " set language
let $LANG = 'en_US'
set splitbelow                                 " set panel split position
set splitright
set laststatus=2                               " allways show statusline
":let &winheight = 1
set foldlevelstart=1                         " start folding from specyfic level

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set cindent

" turn on plugins and indentation based on filetype
filetype plugin on
filetype indent on

" vim commands autocomplet
set wildmenu
set wildmode=list:longest,full

"no error
set noerrorbells

" search options
set gdefault       " use global as default in regexp
set incsearch      " search during typing
" set hlsearch     " highlight previous search pattern
set ignorecase     " Ignore case in search patterns
set smartcase      " Override ignorecase if the pattern contains upper case characters
set synmaxcol=1000 " max search in columns

" Turn off gui
set guioptions-=T
set guioptions-=L

set inccommand=nosplit

augroup vimrc
  autocmd!
augroup END

" auto remove columns and rows highlighting
autocmd vimrc WinLeave * set nocursorline nocursorcolumn
autocmd vimrc WinEnter * set nocursorline nocursorcolumn

colorscheme shadowmoth

set clipboard+=unnamedplus " integrate system clipboard

let g:markdown_fenced_languages = ['html', 'vim', 'ruby', 'python', 'bash=sh']
"}}}
"====================================
"----------2_Filetype_config---------
"====================================
" {{{
" Automatic read dictionaries for filetype and add easy access to edit it
" Use OpenDict command to edit current file type or pass filetype name
" ex: :OpenDict ruby
" Dictionaries are in $home/.config/nvim/dict directory
" Author: Rafał Camlet raf.camlet@gmail.com

function! s:set_dict(name)
  let dict_name = expand('$HOME') . '/.config/nvim/dict/' . a:name . '.txt'

  if filereadable(dict_name)
    let &l:dictionary = dict_name
  endif
endfunction

function! s:open_dict(...)
  if empty(&filetype) && (a:0 == 0 || a:1 == '')
    echom 'No filetype set. Use :OpenDict <filetype>'
    return
  endif

  let type = a:0 > 0 && a:1 != '' ? a:1 : &filetype
  execute 'edit ' . expand('$HOME') . '/.config/nvim/dict/' . type . '.txt'
endfunction

command! -nargs=? OpenDict call s:open_dict(<q-args>)

augroup ruby_dict_group
  autocmd!

  autocmd FileType ruby call s:set_dict('ruby')
  autocmd FileType vim call s:set_dict('vim')
augroup END

augroup vim_group
  autocmd!

  autocmd FileType vim let &l:foldmethod = 'marker'
augroup END

augroup markdown_group
  autocmd!

  autocmd FileType markdown setlocal spell spelllang=en,pl
augroup END


"}}}
"====================================
"----------3_Plugins_config----------
"====================================
"{{{
"


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

" fzf[
let $FZF_DEFAULT_COMMAND = 'ag -l -p ~/.agignore -g ""'

nnoremap <space>p :FZF<cr>
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

" Neomake[
let g:neomake_coffeescript_enabled_makers = ['coffeelint', 'coffee']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['mri']
" let g:neomake_vim_enabled_makers = ['vim-lint']
autocmd! BufWritePost * Neomake
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
"====================================
"----------4_Keybindings-------------
"====================================
"{{{
let g:mapleader=","
nnoremap ; :
nnoremap ' `
inoremap jk <esc>`^
cnoremap jk <c-c>

nnoremap <silent> <enter> :put =''<cr>
cnoremap <silent> <enter> <cr>

"{ easy command history
nmap <space>c q:
nmap <space>q :copen<cr>

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

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" open vim folder
command! Ovim ex ~/.config/nvim

nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <leader><leader>r <esc>:R<cr>
nnoremap <leader><leader>a <esc>:A<cr>

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


" move cursor to begening of pasted text
vnoremap <silent> p p`[
nnoremap <silent> p p`[<left>

" yank without coursor move
nnoremap <silent> yiw mpyiw`p
nnoremap <silent> yiW mpyiW`p
nnoremap <silent> yip mpyip`p

"boost regexp, double dot insert nongreedy any character
cnoremap .. .{-}

" repeat last action for selected lines
vnoremap . :normal .<CR>
" repeat q macro for selected lines
vnoremap @ :normal! @q<CR>
" repreat last command for selected lines
vnoremap \ :normal! @:<CR>

"open path from system clipboard
nmap <silent> co :e <c-r>+<cr>

"copy path to current file
nmap <silent> cp :let @+ = expand("%:p")<cr>

" put last yanked text
nnoremap <c-p> "0p
vnoremap <c-p> "0p
inoremap <c-p> <c-r>0

" tab mappings
" nnoremap   L       gt
" nnoremap   H       gT
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
"}}}
"====================================
"----------5_Custom_colors-----------
"====================================
"{{{
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionMoveHL ctermbg=none ctermfg=cyan
hi agsvResultPattern ctermfg=red
"}}}
"====================================
"----------6_Testing_new_features----
"====================================
"{{{
"

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


set path+=** 

nnoremap <silent> + :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> - :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

nnoremap <silent> <leader>ro :exec 'e ' . system('bash', 'find $(pwd) -name routes.rb -print -prune -o -path ./tmp ')<cr>

nnoremap <silent> <leader>gs :Gstatus<cr>


" Fzf shourtcuts
nnoremap <space>ob :Buffers<cr>
nnoremap <space>og :GFiles?<cr>
nnoremap <space>ot  :FZF spec<cr>
nnoremap <space>ojs :FZF app/assets<cr>
nnoremap <space>oc  :FZF app/controllers<cr>
nnoremap <space>om  :FZF app/models<cr>
nnoremap <space>ov  :FZF app/views<cr>
nnoremap <space>os  :FZF app/services<cr>
nnoremap <space>of  :FZF app/form_objects<cr>

"Populate Arglist with shell command
command! -nargs=1 PA args `=systemlist(<q-args>)` | argdo e | syntax on

" Mark to last non blank character
" vnoremap $ g_

" Replace and down
nnoremap <silent> \| <down>:<C-U>exe repeat#run(v:count)<CR>

" Paste from register
nnoremap <space>np "np
nnoremap <space>mp "mp

" Open help in full window
command! -nargs=? H execute 'help ' . <q-args> . ' | only'

" vim grep under the cursor
nnoremap gj :vimgrep <cword> *<cr>


" terminal move
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

tnoremap jk <c-\><c-n>

" search for visually highlighted text
vnoremap <silent> // y/\V<C-R>"<CR>``:set hls<cr>

" select last pastet text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

vnoremap <c-g> :<c-u>%s/<c-r>"//<left>
vnoremap <c-d> :s/<c-r>z//<left>

" highlight current word without search for next
nnoremap <silent> * :set hls<cr>*``

" repeat last command
noremap <space>w @:<CR>

" Switch between buffers
noremap <tab> :bn<cr>
noremap <S-tab> :bp<cr>

" select last pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" put current time
imap <F3> <C-R>=strftime("%Y-%m-%d %I:%M")<CR>

" moving aroung in command mode
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-0> <home>
cnoremap <c-0> <end>
cnoremap <c-x> <del>
cnoremap <c-v> <c-r>+

imap <silent> <C-L> <CR><Esc>O

" Show syntax highlighting groups for word under cursor
nnoremap <silent> M :call SynStack()<cr>

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
"}}}
"====================================
"----------7_Scripts-----------------
"====================================
"{{{

function! Bgrep(word, location)
  exec "grep " . a:word . " $( find . -type f -wholename '*" . a:location . "*' ) "
endfunction
command! -nargs=* Bgrep call Bgrep(<f-args>)


if exists("+showtabline")
  function! MyTabLine()
    let s = ' '
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let s .=  ' ' . i . ' '
      let bufnr = buflist[winnr - 1]
      let file = bufname(bufnr)
      let buftype = getbufvar(bufnr, 'buftype')
      if buftype == 'nofile'
        if file =~ '\/.'
          let file = substitute(file, '.*\/\ze.', '', '')
        endif
      else
        let file = fnamemodify(file, ':p:t')
      endif
      if file == ''
        let file = '[New]'
      endif
      let s .= file . ' %* '
      let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#'
    return s
  endfunction
  " set tabline=%!MyTabLine()
endif

function! DeleteEmptyBuffers()
  let [i, n; empty] = [1, bufnr('$')]
  while i <= n
    if bufexists(i) && buflisted(i) && bufwinnr(i)<0 && bufname(i) == ''
      call add(empty, i)
    endif
    let i += 1
  endwhile
  if len(empty) > 0
    exe 'bdelete!' join(empty)
  endif
endfunction

command! DeleteEmptyBuffers call DeleteEmptyBuffers()

" function to customize fold text
function! MyFoldText()
    let nl = v:foldend - v:foldstart + 1
    let txt = substitute(getline(v:foldstart), '\v"\s?\{\{\{.*$', '', 'g')

    return txt . '- L'. nl . repeat(' ', winwidth(0))
endfunction
set foldtext=MyFoldText()

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



function! K() range " {{{

  let lines = getline(a:firstline, a:lastline)
  let current_filetype = &filetype

  if exists('s:view') && bufloaded(s:view) | exec s:view.'bd!' | endif

  exec 'silent keepalt topleft ' . (len(lines) + 2) . ' split work_window'

  let s:view = bufnr('%')
  set modifiable


  call append(0, lines)
  call append(0, '')
  exec 'setf ' . current_filetype

  setl buftype=nofile
  setl noswapfile
  set  bufhidden=wipe
  set  scrolloff=2

  " setl nonu ro noma
  if (exists('&relativenumber')) | setl norelativenumber | endif

  exec ':2'

  " au BufHidden <buffer> exec s:view . 'bd!'

  " command! -nargs=0 -buffer OpenThis call <sid>open_this()
  " nnoremap <silent> <buffer> <cr> :OpenThis<cr>

endfunction
command! -range K <line1>,<line2>call K()
vnoremap <silent> <c-k> :call K()<cr>

function! T() range
  let lines = getline(a:firstline, a:lastline)
  for l in lines
    echom match(l, '\S')
  endfor

endfunction
command! -range T <line1>,<line2>call T()


function! AddToArgsList()
  let buffers = map(range(1, bufnr('$')), 'bufname(v:val)')
  call filter(buffers, '!empty(v:val)')

  call fzf#run ({
        \ 'source':  (buffers),
        \ 'sink':   'argadd',
        \ 'options': '-m'
        \})
endfunction
command! ArgsAdd call AddToArgsList()

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

function! GetAmount()

ruby << EOF

require 'nokogiri'
require 'htmlentities'

buffer = []
1.upto(VIM::Buffer.current.length) do |nr|
  buffer << VIM::Buffer.current[nr]
end

coder = HTMLEntities.new

xml = Nokogiri::XML(buffer.join(?\n)).xpath('//RiskList').to_s
xml = coder.decode(xml)
xml = xml.lines.select { |l| l =~ /ComponentRef/ || l =~ /Amount/  }
xml = xml.map do |l|
  l =~ />(.*?)</
  $1
end

xml.each do |l|
  VIM::Buffer.current.append VIM::Buffer.current.length, l.to_s
end
EOF
endfunction

command! JSONFormat normal :%!python -m json.tool<cr>


function! Send()
  let g:Shell = {}

  function! g:Shell.on_stdout(job_id, data) dict
    call append(line('$'), self.get_name().' stdout: '.join(a:data))
  endfunction

  function! g:Shell.on_stderr(job_id, data) dict
    call append(line('$'), self.get_name().' stderr: '.join(a:data))
  endfunction

  function! g:Shell.on_exit(job_id, data) dict
    call append(line('$'), self.get_name().' exited')
  endfunction

  function! g:Shell.get_name() dict
    return 'shell '.self.name
  endfunction

  function! g:Shell.new(name, ...) dict
    let instance = extend(copy(g:Shell), {'name': a:name})
    let argv = ['bash']
    if a:0 > 0
      let argv += ['-c', a:1]
    endif
    let instance.id = jobstart(argv, instance)
    return instance
  endfunction

  let com = 'tmux send-keys -t 3 ' . getline('.') . ' enter'
  g:Shell.new('1', com)
endfunction
command! Send :call Send()<cr>



function! InsertClass()

  ruby << EOF

  def replace(str)
    $curbuf.delete($curbuf.line_number)
    $curbuf.append($curbuf.line_number - 1 , str)
  end

  def insert(str)
    col = VIM::Window.current.cursor.last
    replace [$curbuf.line[0..(col-1)], str, $curbuf.line[col..-1]].join
  end

  path = VIM::evaluate('expand("%:p")')
  path =~ Regexp.new('.*app/[^/]*/(.*)\.rb$')
  if $1
    class_name = $1.split('/').map do |str|
      str.split('_').collect(&:capitalize).join
    end.join('::')
    insert class_name
  end

EOF

endfunction

command! InsertClass call InsertClass()

" Use * to quick jump
"====================================
"----------1_Basic_features----------
"----------2_Filetype_config---------
"----------3_Plugins_config----------
"----------4_Keybindings-------------
"----------5_Custom_colors-----------
"----------6_Testing_new_features----
"----------7_Ruby_exaple-------------
"----------8_Exaple_vim_plugin-------
"====================================

" Jump to Next/Previous section mapings
map ]c /-{10}\d_<cr>zt
map [c ?-{10}\d_<cr>zt

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'L9'
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kmdsbng/vim-ruby-eval'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'UltiSnips'
Plugin 'Shougo/neocomplete.vim'
Plugin 'ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'godlygeek/tabular'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'tmhedberg/matchit'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'burnettk/vim-angular'
Plugin 'mattn/emmet-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'croaker/mustang-vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Valloric/MatchTagAlways'
Plugin 'tpope/vim-unimpaired'
Plugin 'ngmy/vim-rubocop'
Plugin 'rking/ag.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'airblade/vim-rooter'
Plugin 'junegunn/goyo.vim'
Plugin 'luke-gru/vim-riml'
Plugin 'kchmck/vim-coffee-script'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'rafcamlet/shadowmoth'
Plugin 'airblade/vim-gitgutter'
Plugin 'Shutnik/jshint2.vim'
Plugin 'gabrielelana/vim-markdown'
Plugin 'othree/html5.vim'
" TEST plugin
Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-notes'
Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'pelodelfuego/vim-swoop'
Plugin 'majutsushi/tagbar'
Plugin 'benmills/vimux'
Plugin 'hail2u/vim-css3-syntax'
"" Plugin 'marijnh/tern_for_vim'
Plugin 'chrisbra/NrrwRgn'
Plugin 'diepm/vim-rest-console'
" Plugin 'szw/vim-ctrlspace'
" Plugin 'YankRing.vim'
" Plugin 'xolox/vim-session'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'textobj-indent'
Plugin 'jeetsukumaran/vim-indentwise'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'thinca/vim-quickrun'
Plugin 'elixir-lang/vim-elixir'
Plugin 'mru.vim'
Plugin 'jgdavey/tslime.vim'
Plugin 'coderifous/textobj-word-column.vim'
Plugin 'rafcamlet/show-me-db'

call vundle#end()            " required
filetype plugin indent on    " required

"====================================
"----------1_Basic_features----------
"====================================
set shortmess+=A                               " Always edit file, even when swap file is found
set diffopt=filler,iwhite                      " In diff mode, ignore whitespace changes and align unchanged lines
set fileencodings=ucs-bom,utf-8,default,latin1 " encoding
set termencoding=utf-8                         " terminal encoding
set encoding=utf-8
set nomodeline                                 " turn off modeline for safety
" set mouse=a                                    " set mouse in all mode
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
set ttyfast                                    " Indicates a fast terminal connection
set nobackup                                   " prevent backup
" set noswapfile                               " prevent swapfile
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
set cc=120
set timeoutlen=1000 ttimeoutlen=0
set eol

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
set noeb vb t_vb=

" search options
set gdefault      " use global as default in regexp
set incsearch     " search during typing
" set hlsearch      " highlight previous search pattern
set ignorecase    " Ignore case in search patterns
set smartcase     " Override ignorecase if the pattern contains upper case characters
set synmaxcol=1000 " max search in columns

" Turn off gui
set guioptions-=T
set guioptions-=L

" Allways vertical diff (in Fugitive too!)
set diffopt+=vertical

augroup vimrc
  autocmd!
augroup END

" auto remove columns and rows highlighting
autocmd vimrc WinLeave * set nocursorline nocursorcolumn
autocmd vimrc WinEnter * set nocursorline nocursorcolumn

" Font and colorscheme options based on system
if has('gui_running')

  " colorscheme monokai
  colorscheme shadowmoth
  " colorscheme gruvbox

  if has("multi_byte")
    if &termencoding == ""
      let &termencoding = &encoding
    endif
    set encoding=utf-8 nobomb
    setglobal fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,latin1
  endif

  set guifont=Monospace\ 11
  if has('gui_win32')
    set guifont=Courier:h11:cANSI
  endif
else

  set t_Co=256

  colorscheme shadowmoth
  " colorscheme railscasts

endif

" System clipboard integration
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

"====================================
"----------2_Filetype_config---------
"====================================

"====================================
"----------3_Plugins_config----------
"====================================

"tslime.vim [
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars
"]

" emmet-vim
imap <c-f> <plug>(emmet-expand-abbr)
vmap <c-f> <plug>(emmet-expand-abbr)

" vim-indentwise[
map [- <Plug>(IndentWisePreviousLesserIndent)
map [= <Plug>(IndentWisePreviousEqualIndent)
map [+ <Plug>(IndentWisePreviousGreaterIndent)
map ]- <Plug>(IndentWiseNextLesserIndent)
map ]= <Plug>(IndentWiseNextEqualIndent)
map ]+ <Plug>(IndentWiseNextGreaterIndent)
map [_ <Plug>(IndentWisePreviousAbsoluteIndent)
map ]_ <Plug>(IndentWiseNextAbsoluteIndent)
map [% <Plug>(IndentWiseBlockScopeBoundaryBegin)
map ]% <Plug>(IndentWiseBlockScopeBoundaryEnd)
"]

" dragvisuals.vim[
vmap  <expr>  <c-h>   DVB_Drag('left')
vmap  <expr>  <c-l>   DVB_Drag('right')
vmap  <expr>  <c-j>   DVB_Drag('down')
vmap  <expr>  <c-k>   DVB_Drag('up')
"]

" vim-ctrlspace[
 noremap <silent> <space>s :CtrlSpace<CR>
"]


" vimux[
 map <silent> <Leader>vp :VimuxPromptCommand<CR>
 map <silent> <Leader>vq :VimuxCloseRunner<CR>
"]

" vim-markdown[
let g:markdown_enable_spell_checking = 0
let g:markdown_mapping_switch_status = '<space><space>'
let g:markdown_enable_folding = 1
"]

"indentLine [
let g:indentLine_color_term = 240
"]

"vim-notes [
nnoremap <space>nt :Note Todo<cr>
hi notesUnixPath  ctermfg=red ctermbg=none
"]

" Neocomplete [
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
"]

" Airline config [
let g:airline_theme='serene' " Theme
let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#tabline#enabled = 1
let g:airline_exclude_preview = 1
"]

" NERDTree [
autocmd vimrc VimEnter * NERDTree "autostart
autocmd vimrc  VimEnter * wincmd p
nnoremap <C-g> :NERDTreeToggle<cr>
"]

" UltiSnips [
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsEditSplit="vertical"

" prevent incidental keystroke
" inoremap <c-k> <nop>
" inoremap <c-j> <nop>
"]

" Fugitive [
" nnoremap <silent> <leader>gs :Gstatus<CR>
" nnoremap <leader>gd :Gvdiff 
" nnoremap <leader>gc :Gcommit
" nnoremap <silent> <leader>gb :Gblame<CR>
" nnoremap <silent> <leader>gl :Glog<CR>
" nnoremap <leader>gp :Git push
" nnoremap <leader>gr :Gread
" nnoremap <leader>gw :Gwrite
" nnoremap <leader>ge :Gedit 
" nnoremap <leader>g/ :Ggrep 

" Mnemonic _i_nteractive
" nnoremap <silent> <leader>gi :Git add -p %<CR>
" nnoremap <silent> <leader>gg :SignifyToggle<CR>

autocmd vimrc User fugitive
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> u :edit %:h<CR> |
      \ endif

autocmd BufNewFile,BufRead fugitive://* set bufhidden=delete


"]


" Rails.vim [
set viminfo^=!
let g:rails_default_file='config/database.yml'
" ]


" Tabularize [
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>
nmap <leader>a, :Tabularize /,\zs<CR>
vmap <leader>a, :Tabularize /,\zs<CR>
nmap <leader>a" :Tabularize /"<CR>
vmap <leader>a" :Tabularize /"<CR>
nmap <leader>a{ :Tabularize /{<CR>
vmap <leader>a{ :Tabularize /{<CR>
nmap <leader>a<space> :Tabularize /<space><CR>
vmap <leader>a<space> :Tabularize /<space><CR>
"]

" Javascript library syntax [
let g:used_javascript_libs = 'underscore,jquery,angularjs,angularui'
"]

" EasyMotion [
let g:EasyMotion_do_mapping = 0 " Disable default mappings

nmap s <Plug>(easymotion-s)
"nmap s <Plug>(easymotion-s2)

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

" Syntastic [
let g:syntastic_aggregate_errors = 1
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_coffee_checkers = ['coffeelint', 'coffee']
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
" let g:syntastic_javascript_jshint_ignore_errors= ["Identifier "]
"]

" Silver Searcher [
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
let g:aghighlight=1
"]

" CtralSF [
"By default CtrlSF window will be opened at left, change it to right by
let g:ctrlsf_position = 'right'
nnoremap <space>f :CtrlSF 
nnoremap <silent> <space>F :CtrlSFOpen<cr>
"]

" Goyo [
nnoremap <space>gg :Goyo<cr>
"]

" RubyEval [
nnoremap <silent> <space>rr <esc>$a # =><esc>
nnoremap <silent> <space>re <esc>:RubyEval<cr>
"]
"====================================
"----------4_Keybindings-------------
"====================================
let g:mapleader=","
nnoremap ; :
nnoremap ' `
inoremap jk <esc>
cnoremap jk <c-c>

noremap K k

nnoremap <silent> <enter> :put =''<cr>
cnoremap <silent> <enter> <cr>
nmap <space>c q:

augroup ECW_au
  au!
  au CmdwinEnter * nmap <CR> <CR>
  au CmdwinLeave * nnoremap <silent> <enter> :put =''<cr>
  au CmdwinEnter * nmap <space>c :q<CR>
  au CmdwinLeave * nmap <space>c q:
augroup END

map <silent> <Down> g<Down>
map <silent> <Up> g<Up>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <leader><leader>r <esc>:R<cr>
nnoremap <leader><leader>a <esc>:A<cr>

" rails shorts
nnoremap <leader>c <esc>:Econtroller 
nnoremap <leader>m <esc>:Emodel 
nnoremap <leader>v <esc>:Eview 
nnoremap <leader>db <esc>:Eschema 
nnoremap <leader>ro <esc>:Einitializer<cr>
nnoremap <leader>gem <esc>:Elib<cr>
nnoremap <leader>js <esc>:Ejavascript application<cr>
nnoremap <leader>st <esc>:Estylesheet application<cr>
nnoremap <leader>la <esc>:Elayout application<cr>
nnoremap <leader>ap <esc>:Econtroller application<cr>
nnoremap <leader>i <esc>:Emigration<cr>

nnoremap / /\v
nnoremap ? ?\v
" cnoremap %s/ %s/\v

" Find merge conflict markers
nnoremap <silent> <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

nnoremap <silent> <leader>o :cd %:p:h<cr>:o .<cr>
nnoremap <silent> <leader>t <c-^>
nnoremap <silent> <Leader>@ vip:normal @q<cr>
nnoremap Q mp=ip`p
vnoremap Q =
nnoremap <silent> <space>n <c-f>n
nnoremap <silent> <space>N <c-b>N

"common substitution mapings
nnoremap <leader>s, :.s/,/,\r/<cr>
nnoremap <leader>s<cr> :.s/\v^\s*//<cr>:.s/\v(\S)@<=\s+/\r/<cr>
nnoremap <leader>s<tab>  :%s/	/  /<cr>
nnoremap <leader>sc :.s#_\(\l\)#\u\1#<cr>
nnoremap <leader>sC :.s#\v(<.)\|_(\l)#\u\1\2#<cr>
nnoremap <leader>ss :.s#\v(\l+)(\u)#\l\1_\l\2#<cr>:.s#\v(<\u)#\l\1<cr>

nnoremap <leader>s0 vip:s/\v\s*$//<cr>
nnoremap <leader>s1 vip:s/\v\s*\S\s*$//<cr>
nnoremap <leader>s2 vip:s/\v\s*.\s*\S\s*$//<cr>
nnoremap <leader>s3 vip:s/\v\s*.{2}\s*\S\s*$//<cr>
nnoremap <leader>s4 vip:s/\v\s*.{3}\s*\S\s*$//<cr>
nnoremap <leader>s5 vip:s/\v\s*.{4}\s*\S\s*$//<cr>

nnoremap <leader>sa vip:s/\v$//<left>
nnoremap <leader>se vip:s/\s*.*$//<left><left><left><left><left>
nnoremap <leader>sp vip:s/\v^/<c-r>"/<cr>

nnoremap <silent> <Plug>SRemoveMultipleSpace :.s/\v(\S)@<=\s+/ /<cr>:.s/\v\s*$//<cr>
\:call repeat#set("\<Plug>SRemoveMultipleSpace")<CR>
nmap <Leader>s<space>  <Plug>SRemoveMultipleSpace

nnoremap <silent> <Plug>SRemoveSemicolon :.s/\v;$//<cr>:call repeat#set("\<Plug>SRemoveSemicolon")<CR>
nmap <Leader>s; <Plug>SRemoveSemicolon

nnoremap <silent> <Plug>SBrekTags :.s/</\r</<cr>:call repeat#set("\<Plug>SBrekTags")<CR>
nmap <Leader>st <Plug>SBrekTags

"angular file tree movement
nnoremap <silent> <leader>ai :ex app/index.html<cr>
nnoremap <silent> <leader>aa :ex app/scripts/app.js<cr>
nnoremap <leader>ac :ex app/scripts/controllers/

let g:ctrlp_map = '<space>p'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <space>P :CtrlPBufTag<cr>

vnoremap <silent> p p`[
nnoremap <silent> p p`[<left>

"boost regexp
cnoremap .. .{-}
cnoremap ,, (.\|\n){-}

"boost visual mode
vnoremap . :normal .<CR>
vnoremap @ :normal! @q<CR>
vnoremap \ :normal! @:<CR>

"====================================
"----------5_Custom_colors-----------
"====================================

hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionMoveHL ctermbg=none ctermfg=cyan

"====================================
"----------6_Testing_new_features----
"====================================

nnoremap <silent> <space>n gn:normal @q<cr>
nnoremap <silent> <space>N gN:normal @q<cr>

"open path from system clipboard
nmap <silent> co :e <c-r>+<cr>

"copy path to file
nmap <silent> cp :let @+ = expand("%:p")<cr>

"send-key
command! -nargs=1 Send1 execute ':silent !tmux send-keys -t1 "'.<q-args>.'" c-m' | execute ':redraw!'
nnoremap c1 :Send1 

"send-key
command! -nargs=1 Send2 execute ':silent !tmux send-keys -t2 "'.<q-args>.'" c-m' | execute ':redraw!'
nnoremap c2 :Send2 

" paste no move
"noremap p p`[

inoremap <silent> jk <esc>:DelimitMateOn<cr>
nnoremap <silent> cgn :DelimitMateOff<cr>cgn

" search for visually highlighted text
vnoremap // y/\V<C-R>"<CR>``:set hls<cr>

nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" put last yanked text
nnoremap <c-p> "0p
vnoremap <c-p> "0p
inoremap <c-p> <c-r>0

vnoremap <c-d> :s/<c-r>"//<left>
vnoremap <c-g> "zy:s/<c-r>z//<left>
nnoremap <silent> * :set hls<cr>*``

noremap <space>w @:<CR>

" Switch between buffers
noremap <tab> :bn<cr>
noremap <S-tab> :bp<cr>

" select last put
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

nnoremap <silent> <c-t> :TagbarToggle<cr>

" put current time
imap <F3> <C-R>=strftime("%Y-%m-%d %I:%M")<CR>

command! Ovim ex ~/.vim/bundle
command! Tend !tmux kill-session
command! Find !ps ax | grep rails

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
nnoremap   <silent>  <space>tn :tabnew<CR>:tabmove<cr>
nnoremap   <silent>  <space>tm <c-w>T
nnoremap   <silent>  <space>tgf <c-w>gf

nnoremap   <silent>  <space>gf <c-w>f<c-w>L

"Angular state provider finder
nnoremap <silent> <space>ar /\v\s+\$stateProvider<cr>zt
"Angular controller finder
nnoremap <space>ac /\vcontroller\(\s*("\|')\s*.{-}
"Angular next controller finder
nnoremap <silent> <space>aC /\vcontroller\(\s*("\|').{-}("\|'),<cr>zt

"one-key-mark
nnoremap - `Mzz
nnoremap _ mM

" Copy to end of line
nnoremap Y y$

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

nnoremap <Leader>G :NERDTreeFind<cr>

imap <silent> <C-L> <CR><Esc>O


" Show syntax highlighting groups for word under cursor
nnoremap <silent> M :call SynStack()<cr>

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" fast arrow
inoremap <silent> <c-a> -><cr>
" ruby string eval
inoremap ;3 #{}<left>
inoremap ;a ->
inoremap ;p binding.pry

"====================================
"----------7_Ruby_exaple-------------
"====================================

function! RemoveStaff()
ruby <<EOF
  buffer = VIM::Buffer.current
  window = VIM::Window.current

  size = buffer.line.scan(/staff/).size
  buffer.line = buffer.line.strip.gsub(/staff/, '').gsub(/\s+/, " ")

  row = window.cursor[0]

  info = "Removed #{size} staff!"

  buffer.append(row, info)

  VIM::command(":echo '#{info}'")
EOF
endfunction

"====================================
"----------8_Exaple_vim_plugin-------
"====================================

nnoremap <silent> <c-w> :call ResizeModeToggle()<cr><esc>
hi User1 ctermfg=11  ctermbg=16 cterm=bold

if !exists('g:resize_mode_initialized')
  let g:resize_mode_initialized = 1
  let g:resize_mode_enable = 0
  let g:saved_statusline = 0
  let g:rmmaps = { 'j': 0, 'k': 0, 'h': 0, 'l': 0, '<esc>': 0, 'H': 0, 'J': 0, 'K': 0, 'L': 0 }
end

function! ResizeModeToggle()
  if g:resize_mode_enable

    let g:resize_mode_enable = 0

    augroup resizemode
      autocmd!
    augroup END

    let &statusline=g:saved_statusline
    for [key, var] in items(g:rmmaps)
      execute "nnoremap " . key . " " . var
    endfor

  else "============================="

    let g:resize_mode_enable = 1
    let g:saved_statusline = &statusline
    for [key, var] in items(g:rmmaps)
      let s:ma = mapcheck(key,'n')
      if !empty(s:ma)
        let g:rmmaps[key]= s:ma
      else
        let g:rmmaps[key]= key
      end
    endfor

    set statusline =%1*\ RESIZE\ MODE
    augroup resizemode
      autocmd!
      autocmd VimEnter,WinEnter,BufWinEnter,FileType,BufUnload,VimResized * set statusline =%1*\ RESIZE\ MODE
    augroup END

    nnoremap k 3<C-w>-
    nnoremap j 3<C-w>+
    nnoremap h 3<C-w><
    nnoremap l 3<C-w>>

    nnoremap K <C-w>K
    nnoremap J <C-w>J
    nnoremap H <C-w>H
    nnoremap L <C-w>L
    nnoremap <esc> :call ResizeModeToggle()<cr><esc>
  endif
endfunction

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
  set tabline=%!MyTabLine()
endif

function! Get_visual_selection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

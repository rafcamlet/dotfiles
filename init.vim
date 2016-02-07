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
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'
Plug 'michaeljsmith/vim-indent-object'
Plug 'pbrisbin/vim-mkdir'
Plug 'bling/vim-airline'
Plug 'tmhedberg/matchit'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'burnettk/vim-angular'
Plug 'mattn/emmet-vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-unimpaired'
" Plug 'ngmy/vim-rubocop'
Plug 'rking/ag.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'kana/vim-textobj-user'
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
Plug 'rafcamlet/resize-mode'
Plug 'rafcamlet/shadowmoth' " best colorscheme ever!

" TEST plugin

Plug 'ecomba/vim-ruby-refactoring'
Plug 'xolox/vim-misc'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'pelodelfuego/vim-swoop'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'Shutnik/jshint2.vim'

Plug 'mhinz/vim-grepper' " vim wrapper around 'grepprg' and 'grepformat'
Plug 'textobj-indent'

Plug 'coderifous/textobj-word-column.vim' " Select column of text example: vic
Plug 'kassio/neoterm' " Wrapper of some neovim's :terminal functions.
Plug 'tpope/vim-bundler' " Lightweight support for Ruby's Bundler
Plug 'sjl/gundo.vim' " Plugin to visualize your Vim undo tree.

Plug '~/projekty/test-plug' " My test plugin
Plug '~/projekty/show-me-db' " My test plugin

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

augroup vimrc
  autocmd!
augroup END

" auto remove columns and rows highlighting
autocmd vimrc WinLeave * set nocursorline nocursorcolumn
autocmd vimrc WinEnter * set nocursorline nocursorcolumn

colorscheme shadowmoth

set clipboard+=unnamedplus " integrate system clipboard
"}}}
"====================================
"----------2_Filetype_config---------
"====================================

" Automatic read dictionaries for filetype and add easy access to edit it
" Use OpenDict command to edit current file type or pass filetype name
" ex: :OpenDict ruby
" Dictionaries are in $home/.config/nvim/dict directory
" Author: Rafał Camlet raf.camlet@gmail.com
" {{{
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

augroup turn_off_haml_indenting_group
  autocmd!

  autocmd FileType haml setl noai nocin nosi inde=
augroup END

augroup vim_group
  autocmd!

  autocmd FileType vim let &l:foldmethod = 'marker'
augroup END

"}}}

"====================================
"----------3_Plugins_config----------
"====================================
"{{{
"
" fzf[

" Search thought buffers in fzf!
" https://github.com/junegunn/fzf/wiki/Examples-(vim)

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <space><s-p> :call fzf#run({
      \   'source':  reverse(<sid>buflist()),
      \   'sink':    function('<sid>bufopen'),
      \   'options': '+m',
      \   'down':    len(<sid>buflist()) + 2
      \ })<CR>

nnoremap <space>p :FZF<cr>
"]

" vim-grepper[
nnoremap <leader>ag  :Grepper -tool ag  -open -switch -grepprg ag --column<cr>
"]


"indentLine [
let g:indentLine_color_term = 240
"]

"deoplete.nvim [
let g:deoplete#enable_at_startup = 1
"]

" Airline config [
let g:airline_theme='serene' " Theme
let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#tabline#enabled = 1
"]

" NERDTree [
nnoremap <C-g> :NERDTreeToggle<cr>
nnoremap <leader>G :NERDTreeFind<cr>
autocmd vimrc VimEnter * NERDTree "autostart
autocmd vimrc  VimEnter * wincmd p
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


" Tabularize [
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,\zs<CR>
vmap <Leader>a, :Tabularize /,\zs<CR>
nmap <Leader>a" :Tabularize /"<CR>
vmap <Leader>a" :Tabularize /"<CR>
nmap <Leader>a{ :Tabularize /{<CR>
vmap <Leader>a{ :Tabularize /{<CR>
nmap <Leader>a<space> :Tabularize /<space><CR>
vmap <Leader>a<space> :Tabularize /<space><CR>
"]

" Javascript library syntax [
let g:used_javascript_libs = 'underscore,jquery,angularjs,angularui'
"]

" EasyMotion [
let g:EasyMotion_do_mapping = 0 " Disable default mappings

nmap s <Plug>(easymotion-s)

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
let g:neomake_javascript_enabled_makers = ['jshint']
let g:neomake_ruby_enabled_makers = ['mri']
autocmd! BufWritePost * Neomake
"]

" Silver Searcher [
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
endif
let g:aghighlight=1
"]

" CtralSF [
"By default CtrlSF window will be opened at left, change it to right by
let g:ctrlsf_position = 'right'
nnoremap <space>f :CtrlSF -I 
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
inoremap jk <esc>
cnoremap jk <c-c>

noremap K k

nnoremap <silent> <enter> :put =''<cr>
cnoremap <silent> <enter> <cr>

"{ easy command history
nmap <space>c q:

augroup ECW_au
  au!
  au CmdwinEnter * nmap <CR> <CR>
  au CmdwinLeave * nnoremap <silent> <enter> :put =''<cr>
  au CmdwinEnter * nmap <space>c :q<CR>
  au CmdwinLeave * nmap <space>c q:
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
nnoremap <leader>ss :.s#\v(\l+)(\u)#\l\1_\l\2#<cr>:.s#\v(<\u)#\l\1<cr>

nnoremap <leader>s0 vip:s/\v\s*$//<cr>
nnoremap <leader>s1 vip:s/\v\s*\S\s*$//<cr>
nnoremap <leader>s2 vip:s/\v\s*.\s*\S\s*$//<cr>
nnoremap <leader>s3 vip:s/\v\s*.{2}\s*\S\s*$//<cr>
nnoremap <leader>s4 vip:s/\v\s*.{3}\s*\S\s*$//<cr>
nnoremap <leader>s5 vip:s/\v\s*.{4}\s*\S\s*$//<cr>

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
nnoremap   <silent>  <c-t>m <c-w>T
nnoremap   <silent>  <c-t><c-q> :tabc<cr>

"one-key-mark
nnoremap - `Mzz
nnoremap _ mM

" Copy to end of line
nnoremap Y y$
"}}}
"====================================
"----------5_Custom_colors-----------
"====================================
"{{{
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionMoveHL ctermbg=none ctermfg=cyan
"}}}
"====================================
"----------6_Testing_new_features----
"====================================
"{{{
" terminal move
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

tnoremap jk <c-\><c-n>

"send-key
command! -nargs=1 Send1 execute ':silent !tmux send-keys -t1 "'.<q-args>.'" c-m' | execute ':redraw!'
nnoremap c1 :Send1 

"send-key
command! -nargs=1 Send2 execute ':silent !tmux send-keys -t2 "'.<q-args>.'" c-m' | execute ':redraw!'
nnoremap c2 :Send2 

" search for visually highlighted text
vnoremap // y/\V<C-R>"<CR>``:set hls<cr>

" select last pastet text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

vnoremap <c-d> :s/<c-r>"//<left>
vnoremap <c-g> "zy:s/<c-r>z//<left>

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

"}}}

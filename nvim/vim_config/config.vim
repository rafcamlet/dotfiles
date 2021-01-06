scriptencoding utf-8

" set termguicolors
set shell=/bin/zsh                             " Set zsh as default shell
" set shortmess+=A                               " Always edit file, even when swap file is found
set diffopt=filler,iwhite                      " In diff mode, ignore whitespace changes and align unchanged lines
set fileencodings=ucs-bom,utf-8,default,latin1 " encoding
" set termencoding=utf-8                         " terminal encoding
set modeline                                   " turn on modeline
set number                                     " show line numbers
set showmode                                   " Show current mode down the bottom
set showmatch                                  " highlight matching bracket
set lazyredraw                                 " redraw only when we need to.
set linebreak                                  " Wrap lines at convenient points
set nobackup                                   " prevent backup
set noswapfile                                 " prevent swapfile
set nowritebackup                              " prevent backup
" set display+=lastline                          " show whole lines
" set virtualedit=onemore                        " Allow for cursor beyond last character
set scrolljump=5                               " Lines to scroll when cursor leaves screen
set scrolloff=3                                " Minimum lines to keep above and below cursor
syntax on                                      " turn on syntax highlighting
" set backupdir=~/.backup,./.backup,/tmp         " set backup directory
set splitbelow                                 " set panel split position
set splitright
set foldlevelstart=1                           " start folding from specyfic level
set guicursor=                                 " reset cursor shape
set cmdheight=2                                " double command-line height
set iskeyword+=-                               " add `-` character as part of words
" set wrapmargin=2                             " Wrap 2 characters from the edge of the window
set fileignorecase                             " case is ignored when using file names and directories
set spelllang=pl,en

" Display extra whitespace
set list listchars=tab:»»,trail:·,nbsp:·

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Indentation
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set cindent

" turn on plugins and indentation based on filetype
filetype plugin on
filetype indent on

" vim commands autocomplet
" set wildmode=list:longest,full
set wildignorecase " case insensitive filename completion
set wildoptions=pum

"no error
set noerrorbells

" search options
set gdefault       " use global as default in regexp
set ignorecase     " Ignore case in search patterns
set smartcase      " Override ignorecase if the pattern contains upper case characters
set synmaxcol=1000 " max search in columns

" Turn off gui
set guioptions-=T
set guioptions-=L

set inccommand=nosplit "Shows the effects of a substitution incrementally, as you type

colorscheme shadowmoth

set clipboard+=unnamedplus " integrate system clipboard

set jumpoptions=stack
set signcolumn=yes

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('rg')
  " Use Ag over Grep
  " set grepprg=ag\ --nogroup\ --nocolor
  set grepprg=rg\ -i\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif

augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set ignorecase
    autocmd CmdLineLeave : set smartcase
augroup END

autocmd FileType qf nnoremap <buffer> <cr> <cr>

augroup help_autogroup
    autocmd!
    autocmd BufEnter * if &ft == 'help' | silent! wincmd L | end
    autocmd BufEnter * if &ft == 'help' | silent! vertical resize 80 | end
augroup END

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup = "YankHighlight", timeout = 300 }
augroup END

augroup myCmdwinEnter
  autocmd!
  autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
  autocmd CmdwinEnter * nnoremap <buffer> q :q<cr> 
augroup END

autocmd BufRead,BufNewFile,BufEnter *.vue setlocal filetype=vue
autocmd BufRead,BufNewFile,BufEnter *.vue syntax sync fromstart

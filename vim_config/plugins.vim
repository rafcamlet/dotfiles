"curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.config/nvim/bundle')
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'vim-scripts/L9'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'SirVer/ultisnips'
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
Plug 'dyng/ctrlsf.vim'
Plug 'kana/vim-textobj-user' "Vim plugin: Create your own text objects
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'AndrewRadev/splitjoin.vim' " Plugin that simplifies the transition between multiline and single-line code
Plug 'airblade/vim-rooter'
Plug 'kchmck/vim-coffee-script'
Plug 'jelera/vim-javascript-syntax'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " A command-line fuzzy finder written in Go
" fzf[
let $FZF_DEFAULT_COMMAND = 'ag -l -p ~/.agignore -g ""'

nnoremap <silent> <space>oo :FZF<cr>
nnoremap <silent> <space>o :FZF<cr>
"]


Plug 'junegunn/fzf.vim' " More options for fzf in vim
Plug 'Shougo/deoplete.nvim' " Dark powered asynchronous completion framework for neovim
Plug 'tpope/vim-speeddating' " use CTRL-A/CTRL-X to increment dates, times, and more 

" Plug 'benekastah/neomake' " asynch alternative for syntastic
" let g:neomake_coffeescript_enabled_makers = ['coffeelint', 'coffee']
" let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_ruby_enabled_makers = ['mri']
" autocmd! BufWritePost * Neomake

Plug 'thinca/vim-quickrun' " Run current file and show output in new buffer
Plug 'jeetsukumaran/vim-indentwise' " Indent motion
Plug 'rafcamlet/shadowmoth' " best colorscheme ever!
Plug 'coderifous/textobj-word-column.vim' " Select column of text example: vic
Plug 'dag/vim-fish'
Plug 'junegunn/vim-easy-align' " A Vim alignment plugin
Plug 'airblade/vim-gitgutter'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'tpope/vim-abolish' "easily search for, substitute, and abbreviate multiple variants of a word

" TEST plugin
" Plug 'thaerkh/vim-workspace' " Automated Vim session management and file auto-save
" Plug 'thaerkh/vim-indentguides' "Simple indentation guides for your buffers

" Plug 'Mizuchi/vim-ranger'
 Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim' "dependency for ranger

Plug 'bfredl/nvim-miniyank' "killring-alike plugin for neovim with no default mappings
map <c-p> <Plug>(miniyank-startput)
map <c-n> <Plug>(miniyank-cycle)

Plug 'w0rp/ale' " Asynchronous Lint Engine do przetestowania
let g:ale_sign_column_always = 1

Plug 'vim-scripts/Improved-AnsiEsc' "ansi escape sequences highlighted and concealed
Plug 'slim-template/vim-slim'
Plug 'jceb/vim-orgmode' " Text outlining and task management for Vim based on Emacs' Org-Mode 

Plug 'lambdalisue/gina.vim' " An awesome git handling plugin for Vim
Plug 'bogado/file-line' "Plugin for vim to enabling opening a file in a given line
Plug 'brooth/far.vim' "Find And Replace Vim plugin
Plug 'gabesoft/vim-ags'
Plug 'koron/nyancat-vim'
Plug 'rhysd/nyaovim-markdown-preview'
Plug 'gabrielelana/vim-markdown'
Plug 'fishbullet/deoplete-ruby'
" Plug 'syngan/vim-vimlint'
Plug 'posva/vim-vue'
Plug 'Shougo/denite.nvim' " Unite and create user interfaces
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
" Plug 'majutsushi/tagbar' "Vim plugin that displays tags in a window, ordered by scope
Plug 'Shutnik/jshint2.vim'
Plug 'mhinz/vim-grepper' " vim wrapper around 'grepprg' and 'grepformat'

Plug 'kassio/neoterm' " Wrapper of some neovim's :terminal functions.
Plug 'tpope/vim-bundler' " Lightweight support for Ruby's Bundler
" Plug 'sjl/gundo.vim' " Plugin to visualize your Vim undo tree.

" Plug 'terryma/vim-multiple-cursors' " True Sublime Text style multiple selections for Vim
" function! BuildComposer(info)
"   if a:info.status != 'unchanged' || a:info.force
"     !cargo build --release
"     UpdateRemotePlugins
"   endif
" endfunction

" Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'mxw/vim-jsx'
Plug 'eugen0329/vim-esearch' "Plugin performing project-wide async search and replace
Plug 'leafgarland/typescript-vim' "Typescript syntax files for Vim
Plug 'tpope/vim-ragtag' " ragtag.vim: ghetto HTML/XML mappings (formerly allml.vim)

" Plug '~/projekty/test-plug' " My test plugin
Plug '~/projekty/show-me-db' " My test plugin
Plug '~/projekty/vim-nest' " My test plugin
Plug '~/projekty/vim-sag' " My test plugin

call plug#end()

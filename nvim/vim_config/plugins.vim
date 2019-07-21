"curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.config/nvim/bundle')
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

Plug 'vim-scripts/L9' " Vim-script library
Plug 'MarcWeber/vim-addon-mw-utils' "plugin library
Plug 'tomtom/tlib_vim' "plugin library
Plug 'Raimondi/delimitMate' "Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'tmhedberg/matchit'
Plug 'pbrisbin/vim-mkdir'
Plug 'scrooloose/nerdtree'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'SirVer/ultisnips'
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits
Plug 'michaeljsmith/vim-indent-object'
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-unimpaired'
Plug 'dyng/ctrlsf.vim', { 'on': 'CtrlSF' }
Plug 'kana/vim-textobj-user' "Vim plugin: Create your own text objects
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'AndrewRadev/splitjoin.vim' " Plugin that simplifies the transition between multiline and single-line code
Plug 'airblade/vim-rooter'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " A command-line fuzzy finder written in Go
Plug 'junegunn/fzf.vim' " More options for fzf in vim
Plug 'tpope/vim-speeddating' " use CTRL-A/CTRL-X to increment dates, times, and more 
Plug 'thinca/vim-quickrun' " Run current file and show output in new buffer
Plug 'jeetsukumaran/vim-indentwise' " Indent motion
Plug 'rafcamlet/shadowmoth' " best colorscheme ever!
Plug 'coderifous/textobj-word-column.vim' " Select column of text example: vic
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'junegunn/vim-easy-align' " A Vim alignment plugin
Plug 'airblade/vim-gitgutter' "A Vim plugin which shows a git diff in the gutter
Plug 'tpope/vim-abolish' "easily search for, substitute, and abbreviate multiple variants of a word
Plug 'svermeulen/vim-easyclip' "Simplified clipboard functionality for Vim
Plug 'w0rp/ale' " Asynchronous Lint Engine
Plug 'mxw/vim-jsx' "React JSX syntax highlighting and indenting for vim.
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'thiagoalessio/rainbow_levels.vim' "A different approach to code highlighting.
Plug 'nathanaelkane/vim-indent-guides'
" TEST plugin

Plug 'mg979/vim-visual-multi', {'branch': 'test'}
" Plug 'kkoomen/vim-doge'
" Plug 'philip-karlsson/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'nikvdp/neomux'
Plug 'HiPhish/awk-ward.nvim'
Plug 'tomtom/tinykeymap_vim'
Plug 'rhysd/git-messenger.vim'
if executable('node')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
Plug 'rbong/vim-flog' "A lightweight and powerful git branch viewer for vim.
Plug 'michaeljsmith/vim-indent-object' "Vim plugin that defines a new text object representing lines of code at the same indent level.
Plug 'wellle/targets.vim' " Vim plugin that provides additional text objects
Plug 'tommcdo/vim-lion' "A simple alignment operator for Vim text editor - gl gL
Plug 'mbbill/undotree'
Plug 'hecal3/vim-leader-guide'
" Plug 'terryma/vim-expand-region'
" Plug 'TaDaa/vimade'
Plug 'Shougo/context_filetype.vim'
" Plug 'tyru/caw.vim'
Plug 'simeji/winresizer'
Plug 'svermeulen/vim-subversive'
Plug 'Arkham/nvim-miniyank' "killring-alike plugin for neovim and vim 8 with no default mappings, forked
Plug 'rhysd/committia.vim'
Plug 'sodapopcan/vim-twiggy', { 'on': 'Twiggy' }
" Plug 'justinmk/vim-sneak'
Plug 'majutsushi/tagbar'

Plug 'wsdjeg/FlyGrep.vim'

Plug 'bilalq/lite-dfm'
Plug 'ternjs/tern_for_vim',  {'do': 'npm install'}

" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-html-subscope'
" Plug 'ncm2/ncm2-ultisnips'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'yuki-ycino/ncm2-dictionary'
" Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
" Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
" Plug 'wellle/tmux-complete.vim'
" Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
" Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
" Plug 'ncm2/ncm2-cssomni'

Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-markdown'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'maximbaz/lightline-ale'
Plug 'hail2u/vim-css3-syntax'

Plug 'jreybert/vimagit'

Plug 'ryanoasis/vim-devicons'
Plug 'bogado/file-line' "Plugin for vim to enabling opening a file in a given line
Plug 'posva/vim-vue'
Plug 'alvan/vim-closetag'

"Plug 'editorconfig/editorconfig-vim'
"Plug 'sodapopcan/vim-twiggy' "Git branch management for Vim <- test this

" Plug 'terryma/vim-multiple-cursors' "<- You never use it!
"Plug 'haya14busa/incsearch.vim' "Improved incremental searching for Vim
"Plug 'haya14busa/incsearch-fuzzy.vim'

Plug 'easymotion/vim-easymotion'
"Plug 'pelodelfuego/vim-swoop' " Test this!


"Plug 'autozimu/LanguageClient-neovim', {
"      \ 'branch': 'next',
"      \ 'do': 'bash install.sh',
"      \ }

"Plug 'reedes/vim-lexical'
"Plug 'reedes/vim-wheel'

" Plug 'mhartington/nvim-typescript'
" Plug 'leafgarland/typescript-vim'
" Plug 'MaxMEllon/vim-jsx-pretty'  "Powoduje błędy! Przetestować!

"Plug 'reedes/vim-pencil'
"" Plug 'martingms/vipsql'
"Plug 'vimwiki/vimwiki'
"" Plug 'https://github.com/rhysd/clever-f.vim' "Extended f, F, t and T key mappings for Vim.


"" Plug 'othree/csscomplete.vim' " Update the bult-in CSS complete function to latest CSS standard.
"Plug 'calebeby/ncm-css'

"" Plug 'plasticboy/vim-markdown'
"" Plug 'gabrielelana/vim-markdown'


"" Plug 'joshdick/onedark.vim'
""hauleth/sad.vim do testu!!!

"" Plug 'machakann/vim-highlightedyank'
"Plug 'AndrewRadev/switch.vim'

"Plug 'haya14busa/vim-signjk-motion'


"Plug 'mhinz/vim-janah' "colorscheme
"" Plug 'mhinz/vim-startify'
"Plug 'ngmy/vim-rubocop'

"Plug 'sjl/gundo.vim' " Plugin to visualize your Vim undo tree.

"Plug 'junegunn/vim-journal'

"Plug 'brettanomyces/nvim-terminus'
"Plug 'brettanomyces/nvim-editcommand'
" Plug 'metakirby5/codi.vim'


"" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

"Plug 'junegunn/vim-ruby-x'

"Plug 'junegunn/vim-after-object'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
"Plug 'junegunn/gv.vim', { 'on': 'GV' } "A git commit browser

"" Plug 'thaerkh/vim-workspace' " Automated Vim session management and file auto-save

"" Plug 'Mizuchi/vim-ranger'
Plug 'rhysd/vim-grammarous'
" Plug 'dpelle/vim-LanguageTool'

"Plug 'dhruvasagar/vim-table-mode' "VIM Table Mode for instant table creation.


"Plug 'vim-scripts/Improved-AnsiEsc' "ansi escape sequences highlighted and concealed
"Plug 'slim-template/vim-slim'
"Plug 'jceb/vim-orgmode' " Text outlining and task management for Vim based on Emacs' Org-Mode 

"Plug 'lambdalisue/gina.vim' " An awesome git handling plugin for Vim
" Plug 'brooth/far.vim' "Find And Replace Vim plugin

"" Plug 'gabrielelana/vim-markdown'

"" Plug 'fishbullet/deoplete-ruby' "Deoplete sources for ruby language
"" Plug 'Shougo/deoplete-rct' "deoplete rcodetools source for Ruby
"" Plug 'syngan/vim-vimlint'
"Plug 'Shougo/denite.nvim' " Unite and create user interfaces
"Plug 'othree/xml.vim' " A plugin for editing xml
"" Plug 'christoomey/vim-tmux-runner' "A simple, vimscript only, command runner for sending commands from vim to tmux.
"Plug 'janko-m/vim-test' "A Vim wrapper for running tests on different granularities.
"" Plug 'junegunn/vim-lengthmatters'
"" Plug 'junegunn/vim-peekaboo' "show the contents of the registers
"Plug 'ecomba/vim-ruby-refactoring'
"Plug 'xolox/vim-misc'
"Plug 'chrisbra/vim-diff-enhanced'
"" Plug 'Shutnik/jshint2.vim'
"Plug 'mhinz/vim-grepper' " vim wrapper around 'grepprg' and 'grepformat'

" Plug 'kassio/neoterm' " Wrapper of some neovim's :terminal functions.
"Plug 'tpope/vim-bundler' " Lightweight support for Ruby's Bundler

"" Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
"Plug 'eugen0329/vim-esearch' "Plugin performing project-wide async search and replace
"Plug 'tpope/vim-ragtag' " ragtag.vim: ghetto HTML/XML mappings (formerly allml.vim)

Plug '~/projects/show-me-db'
Plug '~/projects/vim-sff'
Plug '~/projects/vim-what-i-have-done'
Plug '~/projects/vim-filelist'
Plug '~/projects/vim-my-note'

call plug#end()

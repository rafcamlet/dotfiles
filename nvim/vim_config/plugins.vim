"curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.config/nvim/bundle')
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Plug 'vim-scripts/L9' " Vim-script library
" Plug 'MarcWeber/vim-addon-mw-utils' "plugin library
Plug 'tomtom/tlib_vim' "plugin library
" Plug 'Raimondi/delimitMate' "Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
" Plug 'pbrisbin/vim-mkdir'
Plug 'scrooloose/nerdtree'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'SirVer/ultisnips'
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits
Plug 'michaeljsmith/vim-indent-object'
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-unimpaired'
Plug 'AndrewRadev/splitjoin.vim' " Plugin that simplifies the transition between multiline and single-line code
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " A command-line fuzzy finder written in Go
Plug 'junegunn/fzf.vim' " More options for fzf in vim
Plug 'thinca/vim-quickrun' " Run current file and show output in new buffer
Plug 'jeetsukumaran/vim-indentwise' " Indent motion
Plug 'rafcamlet/shadowmoth' " best colorscheme ever!
Plug 'coderifous/textobj-word-column.vim' " Select column of text example: vic
" Plug 'junegunn/vim-easy-align' " A Vim alignment plugin
Plug 'tpope/vim-abolish' "easily search for, substitute, and abbreviate multiple variants of a word
Plug 'svermeulen/vim-easyclip' "Simplified clipboard functionality for Vim
Plug 'w0rp/ale' " Asynchronous Lint Engine
" Plug 'mxw/vim-jsx' "React JSX syntax highlighting and indenting for vim.
" Plug 'pangloss/vim-javascript'
" Plug 'jelera/vim-javascript-syntax'
Plug 'thiagoalessio/rainbow_levels.vim' "A different approach to code highlighting.
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'andymass/vim-matchup'
" Plug 'tbastos/vim-lua'
Plug 'mg979/vim-visual-multi', {'branch': 'master'} "Multiple cursors project for vim/neovim (wip)
Plug 'Arkham/nvim-miniyank' "killring-alike plugin for neovim and vim 8 with no default mappings
" Plug 'jamessan/vim-gnupg' " This script implements transparent editing of gpg encrypted files. 
Plug 'cespare/vim-toml'
Plug 'tomtom/tcomment_vim'
Plug 'michaeljsmith/vim-indent-object' "Vim plugin that defines a new text object representing lines of code at the same indent level.
Plug 'wellle/targets.vim' " Vim plugin that provides additional text objects
Plug 'majutsushi/tagbar'
Plug 'itchyny/lightline.vim' | Plug 'itchyny/vim-gitbranch' | Plug 'maximbaz/lightline-ale'
Plug 'hail2u/vim-css3-syntax'
Plug 'airblade/vim-gitgutter' "A Vim plugin which shows a git diff in the gutter

Plug 'kyazdani42/nvim-web-devicons'

Plug 'svermeulen/vimpeccable'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'

Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/completion-treesitter'
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'nvim-lua/completion-nvim'
Plug 'steelsojka/completion-buffers'

Plug 'voldikss/fzf-floaterm'
Plug 'voldikss/vim-floaterm'

" Plug 'vimwiki/vimwiki'
" Plug 'tpope/vimwiki'

" TEST plugin ==================

Plug 'kevinhwang91/nvim-bqf'
Plug 'rafcamlet/simple-wiki.nvim'
Plug 'tami5/sql.nvim'
Plug 'nvim-telescope/telescope-frecency.nvim'

Plug 'oberblastmeister/neuron.nvim'

Plug 'puremourning/vimspector'
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rktjmp/lush.nvim'
Plug 'tjdevries/colorbuddy.nvim'
Plug 'norcalli/nvim-colorizer.lua'
" Plug 'aca/completion-tabnine', { 'do': './install.sh' }
Plug 'jiangmiao/auto-pairs'
Plug 'sbdchd/neoformat'

Plug 'norcalli/snippets.nvim'
Plug 'Yggdroot/indentLine'
" Plug 'el-iot/buffer-tree'
Plug 'skywind3000/vim-quickui'
Plug 'pechorin/any-jump.nvim'
Plug 'jreybert/vimagit', { 'on': 'Magit' }

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'bogado/file-line' "Plugin for vim to enabling opening a file in a given line
Plug 'leafOfTree/vim-vue-plugin'
Plug 'groenewege/vim-less'
Plug 'alvan/vim-closetag'

Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'simnalamburt/vim-mundo', { 'on': 'MundoToggle' }
Plug 'rhysd/devdocs.vim'
Plug 'vigoux/LanguageTool.nvim', { 'on': 'LanguageToolCheck' }

Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() }, 'on': 'DogeGenerate' }

Plug 'HiPhish/awk-ward.nvim', { 'on': 'AwkWard' }
Plug 'plasticboy/vim-markdown'
" Plug 'tpope/vim-markdown'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'rhysd/vim-grammarous'

Plug '~/projects/vim-what-i-have-done'
Plug '~/projects/vim-my-note'
Plug '~/projects/nvim-sf'
Plug '~/projects/nvim-luapad'
Plug '~/projects/tabinator'
" Plug '~/projects/simple-wiki'
" Plug 'rafcamlet/nvim-luapad', { 'branch': '0.2' }
" Plug '~/projects/nvim-languagetool'

call plug#end()

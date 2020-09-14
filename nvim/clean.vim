runtime vim_config/keybindings.vim

set nobackup
set noswapfile
set nowritebackup

call plug#begin('~/.config/nvim/bundle')
Plug 'rafcamlet/shadowmoth'
Plug 'scrooloose/nerdtree'
Plug 'thinca/vim-quickrun' " Run current file and show output in new buffer

" Plug 'norcalli/snippets.nvim'
Plug '~/projects/nvim-luapad'
" Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'

" Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

colorscheme shadowmoth

nnoremap <silent> <leader>ev :e ~/projects/dotfiles/nvim/clean.vim<CR>

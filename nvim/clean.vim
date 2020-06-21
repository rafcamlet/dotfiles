runtime vim_config/keybindings.vim

set nobackup
set noswapfile
set nowritebackup

call plug#begin('~/.config/nvim/bundle')
Plug 'rafcamlet/shadowmoth'
Plug 'scrooloose/nerdtree'
Plug 'thinca/vim-quickrun' " Run current file and show output in new buffer

Plug 'skywind3000/vim-quickui'
call plug#end()

colorscheme shadowmoth

nnoremap <silent> <leader>ev :e ~/projects/dotfiles/nvim/clean.vim<CR>

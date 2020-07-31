runtime vim_config/keybindings.vim

" set nobackup
" set noswapfile
" set nowritebackup


call plug#begin('~/.config/nvim/bundle')
Plug 'rafcamlet/shadowmoth'
" Plug 'scrooloose/nerdtree'
" Plug 'thinca/vim-quickrun' " Run current file and show output in new buffer

Plug 'tpope/vim-endwise'
Plug 'Raimondi/delimitMate' "Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'itchyny/lightline.vim'
Plug 'tbastos/vim-lua'
Plug '~/projects/nvim-luapad'
" Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'

" Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'
call plug#end()


runtime vim_config/config.vim
colorscheme shadowmoth

let &updatetime = 300

hi Folded ctermbg=234 ctermfg=243
hi Normal ctermfg=137 ctermbg=235 guifg=#dadada guibg=#121212

nnoremap <silent> <leader>ev :e ~/projects/dotfiles/nvim/clean.vim<CR>

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'readonly', 'filename', 'modified' ],
      \     [ 'luapad_msg']
      \   ],
      \ 'right': [
      \   ['luapad_status'],
      \   ['lineinfo'],
      \   ['percent'],
      \ ],
      \ },
      \ 'component_function': {
      \   'luapad_msg': 'luapad#lightline_msg',
      \   'luapad_status': 'luapad#lightline_status',
      \ },
      \ }


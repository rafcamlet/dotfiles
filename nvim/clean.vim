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
Plug '~/projects/magic-snip'
" Plug 'nvim-lua/popup.nvim' | Plug 'nvim-lua/plenary.nvim' | Plug 'nvim-lua/telescope.nvim'
" Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'

" Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

colorscheme shadowmoth

inoremap <c-u> <cmd>lua require'magic-snips'.magic_snips()<cr>
lua << EOF
local magic_snips = require 'magic-snips'
magic_snips.setup()

magic_snips.add {
  context = {
    doc = function()
      if #v[2] == 0 then return end

      local result = {}
      for _, v in ipairs(vim.split(v[2], ', ')) do
        table.insert(result, '-- @param ' .. v)
      end
      return result
    end
  },
  trigger = 'fun$',
  content = [[
`doc()`
local function $3 ($2)
  $1
  return `math.random(100)` -- random number
end
  ]]
}

EOF

nnoremap <silent> <leader>ev :e ~/projects/dotfiles/nvim/clean.vim<CR>


vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua call v:lua.compile_plugins()
    autocmd BufEnter plugins.lua nnoremap go :lua require'config.helpers'.open_github()<cr>
    autocmd BufEnter plugins.lua nnoremap gf :lua require'config.helpers'.open_config()<cr>
  augroup end
]],
  false
)

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  execute("packadd packer.nvim")
end

return require("packer").startup(function()

  local Use = function(plugin)
    local plugin_name = plugin
    if type(plugin) == "table" then plugin_name = plugin[1] end

    local filename = string.gsub(plugin_name, '.*/' , '')
    filename = filename:gsub('%.nvim', '')

    local config_cmd = ('pcall(require, "config/plugins/%s")'):format(filename)

    if type(plugin) == "table" then
      plugin.config = config_cmd
      use(plugin)
    else
      use { plugin, config = config_cmd }
    end
  end

  local colorscheme = "onedark.nvim"

  use({ "navarasu/onedark.nvim"})

  use("wbthomason/packer.nvim")

  use("nvim-lua/plenary.nvim")

  use{"kyazdani42/nvim-web-devicons", config = function()
    require('nvim-web-devicons').setup {
      override = {
        rb = {
          icon = "",
          color = '#ff5f5f',
          name = "Rb"
        }
      },
      default = true;
    }
  end}

  -- use({ "norcalli/nvim-terminal.lua", config = 'require"terminal".setup()' })

  use({"folke/which-key.nvim", cmd = 'WhichKey'})

  -- === tpope ===
  use("tpope/vim-unimpaired")
  use("tpope/vim-fugitive")
  use("tpope/vim-surround")
  use("tpope/vim-repeat")
  use("tpope/vim-abolish")

  -- === DAP ===
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "Pocco81/DAPInstall.nvim"

  -- === LSP ===
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "tami5/lspsaga.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "jose-elias-alvarez/nvim-lsp-ts-utils"
  use({ 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' })

  -- use({ "ahmedkhalf/lsp-rooter.nvim", config = 'require("lsp-rooter").setup {}' })

  -- === My ===
  -- use("rafcamlet/nvim-luapad")
  use({"~/projects/jumper", config = 'require"jumper".setup()'})
  use("~/projects/rails_spotting")
  use("~/projects/boss")
  use("~/projects/nvim-luapad")
  -- use({ "rafcamlet/simple-wiki.nvim", config = function()
  use({ "~/projects/simple-wiki.nvim", config = function()
    require("simple-wiki").setup({
      path = "~/Dropbox/wiki",
      link_key_mapping = "gf",
    })

    vim.cmd('nnoremap - <CMD>lua require "simple-wiki".index()<CR>')
    vim.cmd('nnoremap _ <CMD>lua require "simple-wiki".search()<CR>')
  end,
  use {
    "rafcamlet/tabline-framework.nvim",
    -- "~/projects/tabline_framework",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      vim.opt.showtabline = 2
      require('tabline_framework').setup {
        render = require('tabline_framework.examples.fancy_indexes'),
        hl = { fg = '#abb2bf', bg = '#181A1F' },
        hl_sel = { fg = '#abb2bf', bg = '#282c34'},
        hl_fill = { fg = '#ffffff', bg = '#000000'},
      }
    end
  }
})


-- == complete ==

use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'saadparwaiz1/cmp_luasnip'
use({'hrsh7th/nvim-cmp', config = 'require "config.plugins.nvim-cmp"'})

-- === TreeSitter ===
use("nvim-treesitter/nvim-treesitter-textobjects")
use("nvim-treesitter/nvim-treesitter-refactor")
use("nvim-treesitter/playground")

Use({ "nvim-treesitter/nvim-treesitter"})

use({ "windwp/nvim-autopairs", config = 'require("nvim-autopairs").setup()' })

use ({"b3nj5m1n/kommentary", config = function()
  require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
  })
end})

use({
  "numToStr/Navigator.nvim",
  config = function()
    require("Navigator").setup()
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    map("n", "<c-h>", "<CMD>lua require('Navigator').left()<CR>", opts)
    map("n", "<c-j>", "<CMD>lua require('Navigator').down()<CR>", opts)
    map("n", "<c-k>", "<CMD>lua require('Navigator').up()<CR>", opts)
    map("n", "<c-l>", "<CMD>lua require('Navigator').right()<CR>", opts)
  end,
})

use({
  "mg979/vim-visual-multi",
  config = function()
    vim.cmd([[
    let g:VM_Mono_hl   = 'Visual'
    let g:VM_Extend_hl = 'WildMenu'
    let g:VM_Cursor_hl = 'Visual'
    let g:VM_Insert_hl = 'IncSearch'

    let g:VM_highlight_matches = 'red'
    let g:VM_leader = '<space>'
    let g:VM_maps = {}
    let g:VM_maps['Find Under']         = '<C-d>'
    let g:VM_maps['Find Subword Under'] = '<C-d>'

    let g:VM_maps['Add Cursor Down']             = '<C-U>'
    let g:VM_maps['Visual Cursors']              = '<space>'
    let g:VM_maps['Switch Mode']                 = 'v'
    let g:VM_maps['Visual Regex']                = '/'

    " autocmd User visual_multi_start nnoremap <c-l> l
    " autocmd User visual_multi_start nnoremap <c-h> h
    " autocmd User visual_multi_exit nnoremap  <c-l> :TmuxNavigateRight<CR>
    " autocmd User visual_multi_exit nnoremap  <c-h> :TmuxNavigateLeft<CR>
    ]])
  end,
})

use({
  "Arkham/nvim-miniyank",
  config = function()
    vim.cmd([[
    map p <Plug>(miniyank-autoput)
    map P <Plug>(miniyank-autoPut)
    map <silent><c-p> <Plug>(miniyank-cycle)
    map <silent><c-n> <Plug>(miniyank-cycleback)
    ]])
  end,
})

use({
  "AndrewRadev/splitjoin.vim",
  config = function()
    vim.g.splitjoin_ruby_curly_braces = 0
    vim.g.splitjoin_ruby_curly_braces = 0
    vim.g.splitjoin_ruby_hanging_args = 0
    vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
  end,
})

Use "lewis6991/gitsigns.nvim"

use 'nvim-telescope/telescope-fzy-native.nvim'

use({
  "nvim-telescope/telescope.nvim",
  -- commit = "ec6c13fc092fe8447df77e35013df907a6f3761e",
  requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } }
})

Use({"lukas-reineke/indent-blankline.nvim", after = colorscheme})
use({"L3MON4D3/LuaSnip", config = "require 'config.plugins.luasnip'"})
use({ "simrat39/rust-tools.nvim", config = 'require "config.plugins.rust-tools"' })

use("editorconfig/editorconfig-vim")
use("kevinhwang91/nvim-bqf")
use({ "junegunn/fzf", run = ":call fzf#install()", cmd = 'FZF' })
use({ "norcalli/nvim-colorizer.lua", config = 'require"colorizer".setup()' })
use{"jbyuki/one-small-step-for-vimkind", opt = true}

use({
  "mhartington/formatter.nvim",
  cmd = "Format",
  config = function()
    require("formatter").setup({
      logging = false,
      log_level = vim.log.levels.INFO,
      filetype = {
        sql = {
          function()
            local formaters = {
              { exe = 'pg_format', args = { '-', '-W', '5' }, stdin = true },
              { exe = "sqlformat", args = { "-", '-k', 'upper', '-a' }, stdin = true }
            }
            print('Select formatter (1) pg_format, (2) sqlformat:')
            local nr = vim.fn.nr2char(vim.fn.getchar())
            return formaters[tonumber(nr)]
          end
        },
        lua = {
          function()
            return { exe = "stylua", args = { "-" }, stdin = true }
          end,
        },
      },
    })
  end,
})

use 'nanotee/luv-vimdocs'

use {'rktjmp/lush.nvim', opt = true }

use {'glepnir/galaxyline.nvim', config = 'require"config.statusline"'}

use {
  "folke/trouble.nvim",
  cmd = 'Trouble',
  after = "telescope.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup { }

    local trouble = require("trouble.providers.telescope")
    local telescope = require("telescope")

    telescope.setup {
      defaults = {
        mappings = {
          i = { ["<c-e>"] = trouble.open_with_trouble },
          n = { ["<c-e>"] = trouble.open_with_trouble },
        },
      },
    }

  end
}

use { 'akinsho/nvim-toggleterm.lua', keys = [[<c-\>]], config = function()
  require("toggleterm").setup {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<c-\>]],
    direction = 'vertical'
  }

  vim.g.terminal_color_8 = '#595959'
  vim.cmd 'tnoremap <c-]> <c-\\><c-n>'

  require 'config.plugins.nvim-toggleterm'
end}

use 'folke/lua-dev.nvim'

use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }

use {'leafgarland/typescript-vim', ft = 'typescript' }
use 'peitalin/vim-jsx-typescript'
use {'thinca/vim-quickrun', cmd = 'QuickRun'}
use 'github/copilot.vim'
use 'bogado/file-line'
use { 'camspiers/snap', rocks = {'fzy'}, disable = true }
-- use "nathom/filetype.nvim"
-- use 'simrat39/symbols-outline.nvim'
use { 'stevearc/aerial.nvim'}
use { 'sindrets/diffview.nvim', config = 'require"diffview".setup()', cmd = 'DiffviewOpen' }
-- use { 'TimUntersberger/neogit', config = "require'neogit'.setup()" }
--
Use { 'sidebar-nvim/sidebar.nvim', branch = "dev" }
-- Use '~/projects/sidebar.nvim'
Use 'anuvyklack/pretty-fold.nvim'
Use 'rlane/pounce.nvim'
use {"elihunter173/dirbuf.nvim", cmd = 'Dirbuf'}
use { "natecraddock/workspaces.nvim", config = "require'workspaces'.setup()" }
-- use { 'ibhagwan/fzf-lua', requires = { 'kyazdani42/nvim-web-devicons' } }
-- use {"j-hui/fidget.nvim", config = "require'fidget'.setup{}" }
use {'hoschi/yode-nvim', disable = true}
use { 'slim-template/vim-slim' }
use { 'mbbill/undotree', cmd = 'UndotreeToggle'}

Use {
  "nvim-neo-tree/neo-tree.nvim",
  branch = 'main',
  requires = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim"
  }
}

use {'dstein64/vim-startuptime', opt = true}
end)

local helpers = require 'config.helpers.plugins'
local use = helpers.use
local Use = helpers.Use

helpers.clear()

use("navarasu/onedark.nvim")
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

Use({"folke/which-key.nvim"})

-- === tpope ===
use("tpope/vim-unimpaired")
use("tpope/vim-fugitive")
use("tpope/vim-repeat")
use("tpope/vim-abolish")
use("tpope/vim-rails")
use 'tpope/vim-haml'

-- === DAP ===
use "mfussenegger/nvim-dap"
use "rcarriga/nvim-dap-ui"

-- === LSP ===
use "neovim/nvim-lspconfig"
use "williamboman/mason.nvim"
use "williamboman/mason-lspconfig.nvim"
use "jayp0521/mason-nvim-dap.nvim"
use {"glepnir/lspsaga.nvim", commit = 'b7b4777369b441341b2dcd45c738ea4167c11c9e'}
use { "jose-elias-alvarez/null-ls.nvim", enable = false }
use { "jose-elias-alvarez/nvim-lsp-ts-utils", enable = false }

-- === My ===
-- use({ dir = "~/projects/winbar-framework.nvim" })
-- use({"~/projects/jumper", config = 'require"jumper".setup()'})
use({ dir = "~/projects/jumper2", config = function() require"jumper".setup() end})
-- use({ dir = "~/projects/rails_spotting" })
use({ dir = "~/projects/boss" })
use({ dir = "~/projects/nvim-luapad", cmd = { 'Luapad', 'LuaRun' }, config = function()
  require('luapad').setup({ wipe = false })
end})
use({ dir = "~/projects/line_maker" })

use({ dir = "~/projects/simple-wiki.nvim",
  keys = '-',
  config = function()
  require("simple-wiki").setup({
    path = "~/Dropbox/wiki",
    link_key_mapping = "gf",
  })

  vim.cmd('nnoremap - <CMD>lua require "simple-wiki".index()<CR>')
  vim.cmd('nnoremap _ <CMD>lua require "simple-wiki".search()<CR>')
end
})

use {
  -- "rafcamlet/tabline-framework.nvim",
  dir = "~/projects/tabline_framework",
  dependencies = "kyazdani42/nvim-web-devicons",
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

-- == complete ==

use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'saadparwaiz1/cmp_luasnip'
use({ 'hrsh7th/nvim-cmp', config = function() require "config.plugins.nvim-cmp" end, tag = 'v0.0.1' })

-- === TreeSitter ===
use("nvim-treesitter/nvim-treesitter-textobjects")
-- use("nvim-treesitter/nvim-treesitter-refactor")
use({"nvim-treesitter/playground", cmd = 'TSPlaygroundToggle'})

Use({ "nvim-treesitter/nvim-treesitter"})

Use({ "windwp/nvim-autopairs"})

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

Use { "mg979/vim-visual-multi", config_first = true }

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
    vim.g.splitjoin_ruby_hanging_args = 0
    vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
  end,
})

Use "lewis6991/gitsigns.nvim"

use 'nvim-telescope/telescope-fzy-native.nvim'
use {'jvgrootveld/telescope-zoxide'}
use 'nvim-telescope/telescope-dap.nvim'

Use({
  "nvim-telescope/telescope.nvim",
  dependencies = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } }
})

Use { "lukas-reineke/indent-blankline.nvim" }
Use { "L3MON4D3/LuaSnip" }
use { "simrat39/rust-tools.nvim", ft = 'rust', config = function() require "config.plugins.rust-tools" end }

use { "editorconfig/editorconfig-vim", enable = false }
use "kevinhwang91/nvim-bqf"
use { "junegunn/fzf", build = ":call fzf#install()", cmd = 'FZF' }
use { "NvChad/nvim-colorizer.lua", config = function() require"colorizer".setup() end }
use { "jbyuki/one-small-step-for-vimkind", lazy = true }

Use { "mhartington/formatter.nvim", cmd = "Format" }

use 'nanotee/luv-vimdocs'

use { 'rktjmp/lush.nvim', lazy = true  }

use { 'glepnir/galaxyline.nvim', config = function() require"config.statusline" end }

-- use {
--   "folke/trouble.nvim",
--   cmd = 'Trouble',
--   after = "telescope.nvim",
--   dependencies = "kyazdani42/nvim-web-devicons",
--   config = function()
--     require("trouble").setup { }
--     local trouble = require("trouble.providers.telescope")
--     local telescope = require("telescope")
--     telescope.setup {
--       defaults = {
--         mappings = {
--           i = { ["<c-e>"] = trouble.open_with_trouble },
--           n = { ["<c-e>"] = trouble.open_with_trouble },
--         },
--       },
--     }
--   end
-- }

Use { 'akinsho/toggleterm.nvim', keys = [[<c-\>]], cmd = 'Vifm' }

use { 'folke/lua-dev.nvim', disable = true }

use { 'iamcco/markdown-preview.nvim', build = 'cd app && yarn install', cmd = 'MarkdownPreview' }

use {'leafgarland/typescript-vim', ft = 'typescript' }
use { 'peitalin/vim-jsx-typescript', ft = 'typescript' }
use {'thinca/vim-quickrun', cmd = 'QuickRun'}
-- use 'github/copilot.vim'
use 'bogado/file-line'
-- use { 'camspiers/snap', rocks = {'fzy'}, disable = true }
-- use "nathom/filetype.nvim"
-- use 'simrat39/symbols-outline.nvim'
-- use { 'stevearc/aerial.nvim'}
use { 'sindrets/diffview.nvim', config = function() require"diffview".setup() end, cmd = 'DiffviewOpen' }
-- use { 'TimUntersberger/neogit', config = "require'neogit'.setup()" }

-- Use { 'sidebar-nvim/sidebar.nvim', branch = "dev" }
-- Use { 'anuvyklack/pretty-fold.nvim', dependencies = 'anuvyklack/nvim-keymap-amend' }
-- Use {'rlane/pounce.nvim', disable = true }
use { "elihunter173/dirbuf.nvim", cmd = 'Dirbuf' }
-- use { "natecraddock/workspaces.nvim", config = function() require'workspaces'.setup() end }
-- use { 'ibhagwan/fzf-lua', dependencies = { 'kyazdani42/nvim-web-devicons' } }
-- use {"j-hui/fidget.nvim", config = "require'fidget'.setup{}" }
-- use {'hoschi/yode-nvim', disable = true}
-- use { 'slim-template/vim-slim' }
use { 'mbbill/undotree', cmd = 'UndotreeToggle'}

Use {
  "nvim-neo-tree/neo-tree.nvim",
  commit = '52cedf7c6c57bbfe647d7c0f43147100157dcd8c',
  branch = 'main',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim"
  }
}

use { 'dstein64/vim-startuptime', lazy = true }
use { 'onsails/lspkind-nvim' }
Use { 'ziontee113/syntax-tree-surfer', disable = true, lazy = true }

Use { 'abecodes/tabout.nvim', after = {'nvim-cmp'}}

Use {
  "nvim-neotest/neotest",
  cmd = 'Neotest',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    'olimorris/neotest-rspec',
  }
}


Use {'kylechui/nvim-surround'}
Use {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async', lazy = true }
-- use { 'kkoomen/vim-doge', build = function() vim.fn['doge#install']() end  }
Use {'anuvyklack/hydra.nvim'}
use { 'TimUntersberger/neogit', cmd = 'Neogit' }
use {'stevearc/dressing.nvim', config = function() require'dressing'.setup() end }
-- use {'phaazon/mind.nvim', config = 'require"mind".setup()'}
--
use({
  "andrewferrier/debugprint.nvim",
  disable = true,
  config = function()
    local eruby = {
      left = 'console.log(`',
      right = '`)',
      mid_var = "${",
      right_var = '}`)',
    }

    require("debugprint").setup({
      print_tag = '',
      filetypes = { eruby = eruby }
    })
  end
})

Use {'ziontee113/neo-minimap', disable = true}

use {
  url = 'https://gitlab.com/madyanov/svart.nvim',
  name = 'svart',
  config = function()
    vim.keymap.set({ "n", "x", "o" }, "s", "<Cmd>Svart<CR>")       -- begin search
    vim.keymap.set({ "n", "x", "o" }, "S", "<Cmd>SvartRegex<CR>") 
  end
}

use 'vim-denops/denops.vim'

vim.g.scorpeon_extensions_path = vim.fn.expand('~/.cache/scorpeon/extensions')
vim.g.scorpeon_highlight = { enable = { 'slim' } }
use {'uga-rosa/scorpeon.vim'}

use {
  "chrisgrieser/nvim-various-textobjs",
  config = function () require("various-textobjs").setup({ useDefaultKeymaps = true }) end
}

use {
  'ckolkey/ts-node-action',
  dependencies = { 'nvim-treesitter' },
  config = function()
    require("ts-node-action").setup({})
    vim.keymap.set({ "n" }, "H", require("ts-node-action").node_action, { desc = "Trigger Node Action" })
  end
}

use 'rcarriga/nvim-notify'
use { 'mrded/nvim-lsp-notify', config = function ()
  require('lsp-notify').setup({
    notify = require('notify'),
  })
end}

require("lazy").setup(helpers.list)

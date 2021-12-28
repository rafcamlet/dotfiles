vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua call v:lua.compile_plugins()
    autocmd BufEnter plugins.lua nnoremap go :lua require'config.helpers'.open_github()<cr>
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
use "shaunsingh/nord.nvim"
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

  use("folke/which-key.nvim")

  -- === tpope ===
  use("tpope/vim-unimpaired")
  use("tpope/vim-fugitive")
  use("tpope/vim-surround")
  use("tpope/vim-repeat")
  use("tpope/vim-abolish")

  -- === DAP ===
  use({
    "mfussenegger/nvim-dap",
    config = function()
      vim.cmd([[nnoremap <silent> <F5> :lua require'dap'.continue()<CR>]])
      vim.cmd([[nnoremap <silent> <F8> :lua require'dap'.step_over()<CR>]])
      vim.cmd([[nnoremap <silent> <F9> :lua require'dap'.step_into()<CR>]])
      vim.cmd([[nnoremap <silent> <F10> :lua require'dap'.step_out()<CR>]])
      vim.cmd([[nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>]])
      vim.cmd([[nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]])
      vim.cmd([[nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]])
      vim.cmd([[nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>]])
      vim.cmd([[nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>]])
    end,
  })
  use "rcarriga/nvim-dap-ui"
  use "Pocco81/DAPInstall.nvim"

  -- === LSP ===
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "tami5/lspsaga.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "jose-elias-alvarez/nvim-lsp-ts-utils"
  use({ 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' })

  use({ "ahmedkhalf/lsp-rooter.nvim", config = 'require("lsp-rooter").setup {}' })

  -- === My ===
  use("rafcamlet/nvim-luapad")
  use({ "rafcamlet/simple-wiki.nvim", config = function()
    require("simple-wiki").setup({
      path = "~/Dropbox/wiki",
      link_key_mapping = "gf",
    })

    vim.cmd('nnoremap - <CMD>lua require "simple-wiki".index()<CR>')
    vim.cmd('nnoremap _ <CMD>lua require "simple-wiki".search()<CR>')
  end,
  use {
    "rafcamlet/tabline-framework.nvim",
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

use({
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@black.inner",
          },
        },
      },
      playground = {
        enable = true,
        updatetime = 25,
        persist_queries = false,
      },
      highlight = {
        enable = true,
        custom_captures = {},
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gn",
          node_incremental = "<c-j>",
          node_decremental = "<c-k>",
          scope_incremental = "<c-l>",
        },
      },
    })

    local query = [[
    [
      (atx_heading)
      (setext_heading)
    ] @text.title

    (code_fence_content) @none

    [
      (indented_code_block)
      (fenced_code_block)
      (code_span)
    ] @text.literal


    (emphasis) @text.emphasis
    (strong_emphasis) @text.strong

    (link_destination) @text.uri

    (link_text) @text.reference

    (thematic_break) @text.title

    [
      (list_marker_plus)
      (list_marker_minus)
      (list_marker_star)
      (list_marker_dot)
      (list_marker_parenthesis)
    ] @punctuation.special

    [
      (backslash_escape)
      (hard_line_break)
    ] @string.escape
    ]]

    require("vim.treesitter.query").set_query("markdown", "highlights", query)

    vim.cmd [[hi TSTitle guifg=#e5c07b gui=bold]]
    vim.cmd [[hi TSURI guifg=#61afef gui=none]]
    vim.cmd [[hi TSPunctSpecial guifg=#c678dd gui=none]]
    vim.cmd [[hi TSTextReference guifg=#e86671 gui=none]]

    vim.cmd [[hi TSStrong gui=bold]]
    vim.cmd [[hi TSEmphasis gui=italic]]
  end,
})
use({ "windwp/nvim-autopairs", config = 'require("nvim-autopairs").setup()' })

use ({"b3nj5m1n/kommentary", config = function()
  require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
  })
end})

use({ "kyazdani42/nvim-tree.lua", config = 'require "config.plugins.nvim-tree"' })

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

use({
  "lewis6991/gitsigns.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = 'require "config.plugins.gitsigns"'
})

use({
  "nvim-telescope/telescope.nvim",
  commit = "ec6c13fc092fe8447df77e35013df907a6f3761e",
  requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
  config = function()
    local Telescope = require("telescope")
    local actions = require("telescope.actions")

    Telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<c-j>"] = actions.move_selection_next,
            ["<c-k>"] = actions.move_selection_previous,
          },
        },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      },
    })

    vim.cmd('nnoremap <space>ob <cmd>lua require("telescope.builtin").buffers()<cr>')
    vim.cmd('nnoremap <space>ot <cmd>lua require("telescope.builtin").help_tags()<cr>')
  end,
})

use({"lukas-reineke/indent-blankline.nvim",
after = colorscheme,
config = 'require "config.plugins.indent-blankline"'})


  use({"L3MON4D3/LuaSnip", config = "require 'config.plugins.luasnip'"})

  use({ "simrat39/rust-tools.nvim", config = 'require "config.plugins.rust-tools"' })

use {
  'phaazon/hop.nvim',
  branch = 'v1', -- optional but strongly recommended
  config = function()
    require'hop'.setup { keys = 'asdfjkl;' }
    -- require'hop'.setup {}
    vim.api.nvim_set_keymap('n', 's', "<cmd>lua require'hop'.hint_char2()<cr>", {})
  end
}

use("editorconfig/editorconfig-vim")
use("kevinhwang91/nvim-bqf")
use({ "junegunn/fzf", run = ":call fzf#install()" })
use({ "norcalli/nvim-colorizer.lua", config = 'require"colorizer".setup()' })

use("jbyuki/one-small-step-for-vimkind")

use({
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup({
      logging = false,
      filetype = {
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

use { 'akinsho/nvim-toggleterm.lua', config = function()
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

use 'MunifTanjim/nui.nvim'
use 'folke/lua-dev.nvim'

use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }

use 'leafgarland/typescript-vim'
use 'peitalin/vim-jsx-typescript'
use 'thinca/vim-quickrun'
use 'github/copilot.vim'
use 'bogado/file-line'
use { 'camspiers/snap', rocks = {'fzy'}}
end)

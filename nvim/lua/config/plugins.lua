local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  execute("packadd packer.nvim")
end

return require("packer").startup(function()
  local colorscheme = "onedark.nvim"

  use({ "navarasu/onedark.nvim", config = 'vim.cmd "colorscheme onedark"' })

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

  use({ "norcalli/nvim-terminal.lua", config = 'require"terminal".setup()' })

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
  -- use 'rafcamlet/nvim-luapad'
  use("~/projects/nvim-luapad")
  use("~/projects/the-lists")
  use({ "rafcamlet/simple-wiki.nvim", config = function()
    require("simple-wiki").setup({
      path = "~/Dropbox/wiki",
      link_key_mapping = "gf",
    })

    vim.cmd('nnoremap - <CMD>lua require "simple-wiki".index()<CR>')
    vim.cmd('nnoremap _ <CMD>lua require "simple-wiki".search()<CR>')
  end,
})


-- == complete ==


use({
  "hrsh7th/nvim-compe",
  config = function()
    require("compe").setup({
      enabled = true,
      debug = false,
      min_length = 1,
      preselect = "enable",
      allow_prefix_unmatch = false,
      source = {
        path = true,
        buffer = true,
        ultisnips = true,
        nvim_lsp = true,
      },
    })
  end
})

vim.cmd([[inoremap <silent><expr> <c-n> compe#complete()]])
vim.cmd([[inoremap <silent><expr> <c-k> compe#confirm('<CR>')]])
vim.cmd([[inoremap <silent><expr> <c-e> compe#close('<C-e>')]])

-- use 'hrsh7th/cmp-nvim-lsp'
-- use 'hrsh7th/cmp-buffer'
-- use 'quangnguyen30192/cmp-nvim-ultisnips'
-- use({'hrsh7th/nvim-cmp', config = function()
--   local cmp = require'cmp'
--   cmp.setup({
--     snippet = {
--       expand = function(args)
--         vim.fn["UltiSnips#Anon"](args.body)
--       end,
--     },
--     mapping = {
--       ['<C-D>'] = cmp.mapping.scroll_docs(-4),
--       ['<C-F>'] = cmp.mapping.scroll_docs(4),
--       -- ['<c-space>'] = cmp.mapping.complete(),
--       ['<C-E>'] = cmp.mapping.close(),
--       ['<C-K>'] = cmp.mapping.confirm({ select = true }),
--     },
--     sources = {
--       { name = 'nvim_lsp' },
--       { name = 'ultisnips' },
--       { name = 'buffer' },
--     }
--   })
-- end
-- })

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
  end,
})
use({ "windwp/nvim-autopairs", config = 'require("nvim-autopairs").setup()' })

use "b3nj5m1n/kommentary"

use({
  "kyazdani42/nvim-tree.lua",
  config = function()
    vim.cmd("nnoremap <c-g><c-g> :NvimTreeToggle<CR>")
    vim.cmd("nnoremap <c-g><c-f> :NvimTreeFindFile<CR>")

    local tree_cb = require("nvim-tree.config").nvim_tree_callback

    require'nvim-tree'.setup {
      update_cwd = true,
      hijack_cursor = false,
      view = {
        mappings = {
          list = {
            { key = "<CR>", cb = tree_cb("edit") },
            { key = "o", cb = tree_cb("edit") },
            { key = "<2-LeftMouse>", cb = tree_cb("edit") },
            { key = "<2-RightMouse>", cb = tree_cb("cd") },
            { key = "<C-]>", cb = tree_cb("cd") },
            { key = "<C-v>", cb = tree_cb("vsplit") },
            { key = "<C-x>", cb = tree_cb("split") },
            { key = "<C-t>", cb = tree_cb("tabnew") },
            { key = "<", cb = tree_cb("prev_sibling") },
            { key = ">", cb = tree_cb("next_sibling") },
            { key = "<s-cr>", cb = tree_cb("close_node") },
            { key = "<Tab>", cb = tree_cb("preview") },
            { key = "I", cb = tree_cb("toggle_ignored") },
            { key = "H", cb = tree_cb("toggle_dotfiles") },
            { key = "R", cb = tree_cb("refresh") },
            { key = "a", cb = tree_cb("create") },
            { key = "d", cb = tree_cb("remove") },
            { key = "r", cb = tree_cb("rename") },
            { key = "<C-r>", cb = tree_cb("full_rename") },
            { key = "x", cb = tree_cb("cut")},
            { key = "c", cb = tree_cb("copy") },
            { key = "p", cb = tree_cb("paste") },
            { key = "y", cb = tree_cb("copy_name") },
            { key = "Y", cb = tree_cb("copy_path") },
            { key = "gy", cb = tree_cb("copy_absolute_path") },
            { key = "[c", cb = tree_cb("prev_git_item") },
            { key = "]c", cb = tree_cb("next_git_item") },
            { key = "u", cb = tree_cb("dir_up") },
            { key = "q", cb = tree_cb("close") },
          }
        }
      }
    }
  end
})

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
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = {
          hl = "GitSignsChange",
          text = "~",
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
      },
      numhl = false,
      linehl = false,
      keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,

        ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
        ["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },

        ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ["n <leader>hR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
        ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

        -- Text objects
        ["o ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
        ["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
      },
      watch_index = {
        interval = 1000,
      },
      current_line_blame = false,
      current_line_blame_delay = 1000,
      current_line_blame_position = "eol",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      use_decoration_api = true,
      use_internal_diff = true, -- If luajit is present
    })
  end,
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

    vim.cmd('nnoremap <space>oo <cmd>lua require("telescope.builtin").find_files()<cr>')
    vim.cmd('nnoremap <space>of <cmd>lua require("telescope.builtin").live_grep()<cr>')
    vim.cmd('nnoremap <space>ob <cmd>lua require("telescope.builtin").buffers()<cr>')
    vim.cmd('nnoremap <space>ot <cmd>lua require("telescope.builtin").help_tags()<cr>')
  end,
})

use({"lukas-reineke/indent-blankline.nvim",
after = colorscheme,
config = function()
  -- vim.cmd [[highlight IndentOne guifg=#BF616A guibg=NONE gui=nocombine]]
  -- vim.cmd [[highlight IndentTwo guifg=#D08770 guibg=NONE gui=nocombine]]
  -- vim.cmd [[highlight IndentThree guifg=#EBCB8B guibg=NONE gui=nocombine]]
  -- vim.cmd [[highlight IndentFour guifg=#A3BE8C guibg=NONE gui=nocombine]]
  -- vim.cmd [[highlight IndentFive guifg=#5E81AC guibg=NONE gui=nocombine]]
  -- vim.cmd [[highlight IndentSix guifg=#88C0D0 guibg=NONE gui=nocombine]]
  -- vim.cmd [[highlight IndentSeven guifg=#B48EAD guibg=NONE gui=nocombine]]

  vim.cmd [[highlight IndentOne guifg=#63363A guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentTwo guifg=#5C443D guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentThree guifg=#5C523D guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentFour guifg=#4B5C3D guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentFive guifg=#3D4B5C guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentSix guifg=#3D555C guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentSeven guifg=#5C3D56 guibg=NONE gui=nocombine]]

  -- vim.g.indent_blankline_char = "│"
  vim.g.indent_blankline_char_highlight_list = {
    "IndentOne", "IndentTwo", "IndentThree", "IndentFour", "IndentFive",
    "IndentSix", "IndentSeven"
  }
  vim.g.indent_blankline_show_first_indent_level = true
  vim.g.indent_blankline_filetype_exclude = {
    "startify", "dashboard", "dotooagenda", "log", "fugitive", "gitcommit",
    "packer", "vimwiki", "markdown", "json", "txt", "vista", "help",
    "todoist", "NvimTree", "peekaboo", "git", "TelescopePrompt", "undotree",
    "flutterToolsOutline", "" -- for all buffers without a file type
  }
  vim.g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
  vim.g.indent_blankline_show_trailing_blankline_indent = false
  -- vim.g.indent_blankline_show_current_context = true
  -- vim.g.indent_blankline_context_patterns = {
    --   "class", "function", "method", "block", "list_literal", "selector",
    --   "^if", "^table", "if_statement", "while", "for"
    -- }
    -- because lazy load indent-blankline so need readd this autocmd
    vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')
  end})

  use({
    "SirVer/ultisnips",
    config = function()
      vim.g.UltiSnipsExpandTrigger = "<C-j>"
      vim.g.UltiSnipsJumpForwardTrigger = "<C-j>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<C-k>"
      vim.g.UltiSnipsEditSplit = "vertical"
    end,
  })

  use({
    "simrat39/rust-tools.nvim",
    config = function()
      local opts = {
        tools = { -- rust-tools options
        -- automatically set inlay hints (type hints)
        -- There is an issue due to which the hints are not applied on the first
        -- opened file. For now, write to the file to trigger a reapplication of
        -- the hints or just run :RustSetInlayHints.
        -- default: true
        autoSetHints = true,

        -- whether to show hover actions inside the hover window
        -- this overrides the default hover handler
        -- default: true
        hover_with_actions = false,

        runnables = {
          -- whether to use telescope for selection menu or not
          -- default: true
          use_telescope = true,

          -- rest of the opts are forwarded to telescope
        },

        inlay_hints = {
          -- wheter to show parameter hints with the inlay hints or not
          -- default: true
          show_parameter_hints = true,

          -- prefix for parameter hints
          -- default: "<-"
          parameter_hints_prefix = "<-",

          -- prefix for all the other hints (type, chaining)
          -- default: "=>"
          other_hints_prefix = "=> ",

          -- whether to align to the lenght of the longest line in the file
          max_len_align = false,

          -- padding from the left if max_len_align is true
          max_len_align_padding = 1,

          -- whether to align to the extreme right or not
          right_align = false,

          -- padding from the right if right_align is true
          right_align_padding = 7,
        },

        hover_actions = {
          -- the border that is used for the hover window
          -- see vim.api.nvim_open_win()
          border = {
            { "╭", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╮", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╯", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╰", "FloatBorder" },
            { "│", "FloatBorder" },
          },
        },
      },

      -- all the opts to send to nvim-lspconfig
      -- these override the defaults set by rust-tools.nvim
      -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
      server = {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = { enable = false },
            cargo = {
              runBuildScripts = false,
            },
            diagnostics = {
              enable = false,
              enableExperimental = false,
            },
          },
        },
      },
    }
    require("rust-tools").setup(opts)
  end,
})

use({
  "ggandor/lightspeed.nvim",
  config = function()
    require("lightspeed").setup({
      jump_to_first_match = true,
      jump_on_partial_input_safety_timeout = 400,
      highlight_unique_chars = false,
      grey_out_search_area = true,
      match_only_the_start_of_same_char_seqs = true,
      limit_ft_matches = 5,
      full_inclusive_prefix_key = "<c-x>",
    })
  end,
})

use("editorconfig/editorconfig-vim")
use("kevinhwang91/nvim-bqf")
use({ "junegunn/fzf", run = ":call fzf#install()" })
-- use({ "~/projects/byline", config = "require'byline'.setup()", after = colorscheme })
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
end)

package.loaded.init = nil

require'nvim-web-devicons'.setup()
require('tabline').setup()
require('jumper').setup()

vim.api.nvim_set_keymap('n', '<space>op', '<cmd>lua require("porcelain"){}<cr>', {noremap = true})

require 'luapad'.config{
  context = {
    hl_color = require('helpers').hl_color,
  },
  on_init = function()
    print('Hello form Luapad!')
  end
}

local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous
      }
    }
  }
}

local projects = require('projects')

projects.setup({})
projects.add('Customease', 'projects/customease', {
  init = function()
    vim.cmd [[nnoremap <buffer> <space>ov :F '.*\.vue$' app/javascript<cr>]]
  end,
  options = {
    path = ".,app/**,app/javascript,,",
    suffixesadd = ".js,.vue",
    includeexpr = "Snakecase(v:fname)",
    include = "import "
  },
  fzf = {
    o = "app/",
    a = "app/concepts",
    j = "app/javascript"
  }
})


projects.add('Milabo', 'projects/milabo', {
  init = function()
    vim.cmd [[nnoremap <buffer> <space>ov :F '.*\.haml$' app<cr>]]
  end,
  options = {
    path = ".,app/**,app/javascript,,",
    suffixesadd = ".js,.vue",
    includeexpr = "Snakecase(v:fname)",
    include = "import "
  },
  fzf = {
    s = "app/javascript/styles",
    j = "app/javascript"
  }
})


local hl_color = require('helpers').hl_color
hl_color('QuickFixLine', 11)
hl_color('MatchTag', nil, 53)


require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  },
  highlight = {
    enable = true,
    custom_captures = {},
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gn",
      node_incremental = "<c-k>",
      node_decremental = "<c-j>",
      scope_incremental = "<c-l>",
    },
  },
}

-- diagnostic

vim.g.diagnostic_insert_delay = 1
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_virtual_text_prefix = '← '
-- vim.g.space_before_virtual_text = 5

hl_color('DiagnosticErrorHl', 13)
hl_color('LspDiagnosticsError', 209)
hl_color('LspDiagnosticsWarning', 221)

vim.fn.sign_define("LspDiagnosticsErrorSign", {text = "->", texthl = "DiagnosticErrorHl"})
vim.fn.sign_define("LspDiagnosticsWarningSign", {text = "W", texthl = "LspDiagnosticsWarning"})
vim.fn.sign_define("LspDiagnosticsInformationSign", {text = "I", texthl = "LspDiagnosticsInformation"})
vim.fn.sign_define("LspDiagnosticsHintSign", {text = "H", texthl = "LspDiagnosticsHint"})

-- completion-nvim
vim.g.completion_confirm_key = "<c-k>"

local css_var_dict = require'comp'.dict('var', {
  '$primary', '$secondary', '$secondary-bright', '$secondary4', '$tertriary',
  '$gray6', '$gray5', '$gray4', '$gray3', '$gray2', '$gray1', '$white', '$white3',
  '$black', '$black2', '$disabled', '$disabled-light', '$font-color'
})

require'completion'.addCompletionSource(
  'css_var_dict', { item = css_var_dict }
)

vim.g.completion_enable_auto_signature = 0
vim.g.completion_enable_auto_hover = 0
vim.g.completion_sorting = "length"
-- vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'}

vim.g.completion_chain_complete_list = {
  default = {
    { complete_items = { 'dict', 'path', 'lsp', 'buffers', 'snippet' } },
    { mode = { '<c-n>' } },
    { mode = { '<c-p>' } }
  },
  scss = {
    { complete_items = { 'css_var_dict', 'path', 'lsp', } },
    { complete_items = { 'buffers', 'snippet' } }
  }
}

-- nvim-lspconfig
local nvim_lsp = require'nvim_lsp'
local diagnostic_on_attach = require'diagnostic'.on_attach

local on_attach = function(client)
  diagnostic_on_attach(client)
end


nvim_lsp.vuels.setup{
  on_attach = on_attach()
}

nvim_lsp.cssls.setup{
  on_attach = on_attach()
}

nvim_lsp.solargraph.setup{
  on_attach = on_attach()
}

nvim_lsp.tsserver.setup{
  on_attach = on_attach()
}

-- https://github.com/tjdevries/nlua.nvim/blob/master/lua/nlua/lsp/nvim.lua:23
local function get_lua_runtime()
    local result = {};
    for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
        local lua_path = path .. "/lua/";
        if vim.fn.isdirectory(lua_path) then
            result[lua_path] = true
        end
    end
    result[vim.fn.expand("$VIMRUNTIME/lua")] = true
    return result;
end

nvim_lsp.sumneko_lua.setup{
  filetypes = { 'lua', 'lua.luapad' },
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "describe", "it" },
        disable = { "lowercase-global" }
      },
      workspace = {
        library = get_lua_runtime()
      }
    }
  }
}

-- nvim_lsp.diagnosticls.setup{
--   filetypes = { "javascript", "javascript.jsx" },
--   init_options = {
--     filetypes = {
--       javascript = "eslint",
--       ["javascript.jsx"] = "eslint",
--       javascriptreact = "eslint",
--       typescriptreact = "eslint",
--     },
--     formatFiletypes = {
--       javascript = "prettierEslint",
--       ["javascript.jsx"] = "prettierEslint",
--     },
--     linters = {
--       eslint = {
--         sourceName = "eslint",
--         command = "./node_modules/.bin/eslint",
--         rootPatterns = { ".git" },
--         debounce = 100,
--         args = {
--           "--stdin",
--           "--stdin-filename",
--           "%filepath",
--           "--format",
--           "json",
--         },
--         parseJson = {
--           errorsRoot = "[0].messages",
--           line = "line",
--           column = "column",
--           endLine = "endLine",
--           endColumn = "endColumn",
--           message = "${message} [${ruleId}]",
--           security = "severity",
--         };
--         securities = {
--           [2] = "error",
--           [1] = "warning"
--         }
--       }
--     },
--     formatters = {
--       prettierEslint = {
--         command = 'prettier-eslint',
--         args = { '--stdin' },
--         rootPatterns = { '.git' },
--       },
--     }
--   }
-- }


vim.cmd("autocmd BufEnter * lua require'completion'.on_attach()")

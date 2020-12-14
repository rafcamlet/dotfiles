package.loaded.init = nil

require'nvim-web-devicons'.setup()
require('tabline').setup()
require('jumper').setup()

vim.api.nvim_set_keymap('n', '<space>op', '<cmd>lua require("porcelain"){}<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<space>oo', '<cmd>lua require"finders".find{}<cr>', {noremap = true})

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
    vim_buffers_everywhere = true, -- Will most likely be renamed to something more useful
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous
      }
    }
  }
}
require('telescope').load_extension('fzy_native')

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
    -- vim.cmd [[nnoremap <buffer> <space>ov :F '.*\.haml$' app<cr>]]
    vim.cmd [[nnoremap <buffer> <space>os <cmd>lua require'finders'.find{ pattern = 'scss$', path="app/javascript/styles" }<cr> ]]
    vim.cmd [[nnoremap <buffer> <space>ov <cmd>lua require'finders'.find{ pattern = 'html.haml$' }<cr> ]]
    vim.cmd [[nnoremap <buffer> <space>oj :F '.*\.js$' app/javascript<cr>]]
  end,
  options = {
    makeprg = [[{stylelint app/javascript/styles -f unix; eslint app/javascript -f unix ; rg --vimgrep "(<<<<<<<\|=======\|>>>>>>>\|console.log\|binding.pry\|jard)" app/}]],
    path = ".,app/**,app/javascript,,",
    suffixesadd = ".js,.vue",
    includeexpr = "Snakecase(v:fname)",
    include = "import "
  },
  fzf = { }
})


local hl_color = require('helpers').hl_color
hl_color('QuickFixLine', 11)
hl_color('MatchTag', nil, 53)


require "nvim-treesitter.configs".setup {
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
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
      node_incremental = "<c-j>",
      node_decremental = "<c-k>",
      scope_incremental = "<c-l>",
    },
  }
}


-- completion-nvim
vim.g.completion_confirm_key = "<c-k>"

local css_var_dict = require'comp'.dict('var', {
  'primary', 'secondary', 'secondary-bright', 'secondary4', 'tertriary',
  'gray6', 'gray5', 'gray4', 'gray3', 'gray2', 'gray1', 'white', 'white3',
  'black', 'disabled', 'disabled-light', 'font-color'
})

require'completion'.addCompletionSource(
  'css_var_dict', { item = css_var_dict }
)

require'completion'.addCompletionSource(
  'view_components', { item = require'comp'.components }
)

vim.g.completion_enable_auto_signature = 0
vim.g.completion_enable_auto_hover = 0
vim.g.completion_sorting = "length"
-- vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'}

vim.g.completion_chain_complete_list = {
  default = {
    { complete_items = { 'dict', 'path', 'lsp', 'buffers', 'snippet'} },
    { mode = { '<c-n>' } },
    { mode = { '<c-p>' } }
  },
  haml = {
    { complete_items = { 'path', 'lsp', 'buffers', 'snippet', 'view_components'} },
    { mode = { '<c-n>' } },
    { mode = { '<c-p>' } }
  },
  scss = {
    { complete_items = { 'css_var_dict', 'lsp' } },
    { complete_items = { 'buffers', 'snippet' } }
  }
}

-- nvim-lspconfig
hl_color('DiagnosticErrorHl', 13)
hl_color('LspDiagnosticsError', 209)
hl_color('LspDiagnosticsWarning', 221)

vim.fn.sign_define("LspDiagnosticsSignError", {text = "->", texthl = "DiagnosticErrorHl"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "W", texthl = "LspDiagnosticsWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "I", texthl = "LspDiagnosticsInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "H", texthl = "LspDiagnosticsHint"})

local nvim_lsp = require'lspconfig'

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 4,
      prefix = '←',
    },
    signs = true,
    update_in_insert = false,
  }
)

local on_attach = function(client)
  require'completion'.on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.vuels.setup{
  on_attach = on_attach
}

nvim_lsp.cssls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.solargraph.setup{
  on_attach = on_attach
}

nvim_lsp.tsserver.setup{
  on_attach = on_attach,
  -- cmd = {"typescript-language-server", "--stdio"},
  -- root_dir = nvim_lsp_util.root_pattern("package.json", "tsconfig.json", ".git"),
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
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
      runtime = {
        version = "LuaJIT"
      },
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

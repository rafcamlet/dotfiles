local Path = require 'plenary.path'

-- vim.fn.sign_define("LspDiagnosticsSignError", {text = "->", texthl = "DiagnosticErrorHl"})
-- vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "W", texthl = "LspDiagnosticsWarning"})
-- vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "I", texthl = "LspDiagnosticsInformation"})
-- vim.fn.sign_define("LspDiagnosticsSignHint", {text = "H", texthl = "LspDiagnosticsHint"})

local nvim_lsp = require'lspconfig'

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 4,
      prefix = '← ',
    },
    signs = true,
    update_in_insert = false,
  }
)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.vuels.setup{}
nvim_lsp.cssls.setup{ capabilities = capabilities }
nvim_lsp.solargraph.setup{}
nvim_lsp.tsserver.setup{
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
  cmd = {
    Path:new('~/src/lua-language-server/bin/Linux/lua-language-server'):expand(),
    '-E',
    Path:new('~/src/lua-language-server/main.lua'):expand()
  },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { "vim", "describe", "it", "p", "luapad" },
        disable = { "lowercase-global" }
      },
      workspace = {
        library = get_lua_runtime()
      }
    }
  }
}

local vimp = require('vimp')

vimp.nnoremap({'override'}, '<c-]>', vim.lsp.buf.definition)
vimp.nnoremap({'override'}, 'K', vim.lsp.buf.hover)
vimp.nnoremap({'override'}, 'gd', vim.lsp.buf.implementation)
vimp.nnoremap({'override'}, '<c-k>', vim.lsp.buf.signature_help)
vimp.nnoremap({'override'}, '1gD', vim.lsp.buf.type_definition)
vimp.nnoremap({'override'}, 'gr', vim.lsp.buf.references)
vimp.nnoremap({'override'}, 'g0', vim.lsp.buf.document_symbol)
vimp.nnoremap({'override'}, 'gW', vim.lsp.buf.workspace_symbol)
vimp.nnoremap({'override'}, 'gd', vim.lsp.buf.declaration)
vimp.nnoremap({'override'}, '<c-q>', vim.lsp.buf.formatting)
vimp.nnoremap({'override'}, '[g', vim.lsp.diagnostic.goto_prev)
vimp.nnoremap({'override'}, ']g', vim.lsp.diagnostic.goto_next)
-- vimp.nnoremap({'override'}, 'ga', vim.lsp.buf.code_action)
vimp.vnoremap({'override'}, 'ga', vim.lsp.buf.range_code_action)
vimp.nnoremap({'override'}, 'ge', vim.lsp.util.show_line_diagnostics)
-- vimp.map_command('Rename', vim.lsp.buf.rename)


local saga = require 'lspsaga'

-- add your config value here
-- default value
-- error_sign = '→',
-- warn_sign = '→',
-- hint_sign = '→',
-- infor_sign = '→',
-- code_action_icon = ' ',
-- finder_definition_icon = '  ',
-- finder_reference_icon = '  ',
-- definition_preview_icon = '  '

saga.init_lsp_saga({
  -- use_saga_diagnostic_handler = 1,
  use_saga_diagnostic_sign = 1
})

vimp.nnoremap({'override'}, 'gh', function() require'lspsaga.provider'.lsp_finder() end)
vimp.nnoremap({'override'}, 'gd', function() require'lspsaga.provider'.preview_definition() end)

vimp.nnoremap({'override'}, 'ga', require'lspsaga.codeaction'.code_action)
vimp.nnoremap({'override'}, 'gs', require'lspsaga.signaturehelp'.signature_help)
vimp.nnoremap({'override'}, '[e', require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev)
vimp.nnoremap({'override'}, ']e', require'lspsaga.diagnostic'.lsp_jump_diagnostic_next)

vimp.map_command('Rename', require('lspsaga.rename').rename)

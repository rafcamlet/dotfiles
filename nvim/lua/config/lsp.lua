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
vimp.nnoremap({'override'}, 'ga', vim.lsp.buf.code_action)
vimp.vnoremap({'override'}, 'ga', vim.lsp.buf.range_code_action)
vimp.nnoremap({'override'}, 'ge', vim.lsp.util.show_line_diagnostics)
vimp.map_command('Rename', vim.lsp.buf.rename)

require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup()

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = mason_lspconfig.get_installed_servers()
vim.list_extend(servers, {'solargraph'})

Settings = {}
Settings.sumneko_lua = {
  Lua = {
    diagnostics = {
      globals = { "vim", "describe", "it", "p", "luapad", "use", "before_each" },
      disable = { "lowercase-global" },
    },
  }
}

local function on_attach(client, bufnr)
  local lsp_functions = require('config.lsp_functions')
  lsp_functions.keybindings(bufnr)
  lsp_functions.highlights(client)
end

for i, server in ipairs(servers) do
  local settings = Settings[server] or {}

  require('lspconfig')[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = settings,
  }
end

DiagnosticConfig = {
  virtual_text = false
}

vim.diagnostic.config(DiagnosticConfig)

vim.keymap.set('n', 'yoe', function()
  DiagnosticConfig.virtual_text = not DiagnosticConfig.virtual_text
  vim.diagnostic.config(DiagnosticConfig)
end)

local saga = require("lspsaga")
saga.init_lsp_saga({
  code_action_keys = {
    quit = "<esc>",
    exec = "<CR>",
  },
  finder_action_keys = {
    open = "<cr>",
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = "<esc>",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>"
  },
  show_outline = {
    win_position = 'right',
    win_with = '',
    win_width = 30,
    auto_enter = true,
    auto_preview = true,
    virt_text = '┃',
    jump_key = '<cr>',
    auto_refresh = true,
  }
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end


-- virtual_text = {
--   show = false,
--   settings = {
--     spacing = 4,
--     prefix = "← ",
--   },
-- }

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--   underline = true,
--   virtual_text = false,
--   signs = true,
-- })

-- local function make_config()
--   local capabilities = vim.lsp.protocol.make_client_capabilities()
--   capabilities.textDocument.completion.completionItem.snippetSupport = true
--   -- capabilities.textDocument.foldingRange = {
--   --   dynamicRegistration = false,
--   --   lineFoldingOnly = true
--   -- }

--   local cmp_lsp = prequire('cmp_nvim_lsp')

--   if cmp_lsp then
--     capabilities = cmp_lsp.update_capabilities(capabilities)
--   else
--     print_warn('cmp_nvim_lsp not found')
--   end

--   return {
--     capabilities = capabilities,
--     on_attach = on_attach,
--   }
-- end

-- local function disable_default_formating(client, bufnr)
--   local null_ls = prequire('null-ls')
--   if not null_ls then return print_warn('null-ls not found') end

--   client.server_capabilities.documentFormattingProvider = false
--   client.server_capabilities.document_range_formatting = false

--   vim.api.nvim_buf_set_keymap(
--     bufnr, "n", "Q", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true }
--   )
--   vim.cmd "command! Format lua vim.lsp.buf.formatting()<CR>"
-- end

-- local Servers = {}

-- Servers.sumneko_lua = function(config)
--   local lua_dev = prequire('lua-dev')
--   if not lua_dev then return print_warn('lua-dev not found') end

--   local lua_dev_config = lua_dev.setup {
--     lspconfig = {
--       settings = {
--         Lua = {
--           diagnostics = {
--             globals = { "vim", "describe", "it", "p", "luapad", "use", "before_each" },
--             disable = { "lowercase-global" },
--           },
--         }
--       }
--     }
--   }

--   return vim.tbl_extend('force', config, lua_dev_config)
-- end

-- Servers.tsserver = function(config)
--   config.on_attach = function(client, bufnr)
--     disable_default_formating(client, bufnr)
--     on_attach(client, bufnr)

--     local ts_utils_required, ts_utils = pcall(require, 'nvim-lsp-ts-utils')
--     if ts_utils_required then
--       ts_utils.setup {
--         debug = false,
--         disable_commands = false,
--         enable_import_on_completion = false,
--         -- eslint
--         eslint_enable_code_actions = true,
--         eslint_enable_disable_comments = true,
--         eslint_bin = "eslint_d",
--         eslint_enable_diagnostics = false,
--         eslint_opts = {},
--       }

--       -- required to fix code action ranges and filter diagnostics
--       ts_utils.setup_client(client)

--       -- no default maps, so you may want to define some here
--       local opts = { silent = true }
--       vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
--       vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
--       vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
--     end

--   end
--   return config
-- end

-- Servers.solargraph = function(config)
--   config.on_attach = function(client, bufnr)
--     disable_default_formating(client, bufnr)
--     on_attach(client, bufnr)
--   end
--   return config
-- end

-- Servers.tailwindcss = function(config)
--   config.settings = {
--     tailwindCSS = {
--       experimental = {
--         classRegex = {
--         "class:\\s+\"([^\"]*)",
--         "class:\\s+'([^\']*)"
--         }
--       }
--     }
--   }
--   return config
-- end

-- lsp_installer.on_server_ready(function(server)
--     local config = make_config()

--     if Servers[server.name] then
--       config = Servers[server.name](config)
--     end

--     server:setup(config)
-- end)


-- local config = make_config()
-- require('lspconfig').solargraph.setup(config)


-- local null_ls = prequire('null-ls')
-- if not null_ls then return print_warn('null-ls not found') end

-- null_ls.setup({
--   sources = {
--     null_ls.builtins.formatting.rubocop.with({
--       args = { "--auto-correct-all", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" }
--     }),
--   },
-- })

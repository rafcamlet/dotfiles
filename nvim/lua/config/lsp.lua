local nvim_lsp = prequire("lspconfig")
if not nvim_lsp then return print_warn('lspconfig not found') end

local saga = prequire("lspsaga")
if not saga then return print_warn('lspsaga not found') end

local lsp_installer = prequire("nvim-lsp-installer")
if not lsp_installer then return print_warn('nvim-lsp-installer not found') end

saga.init_lsp_saga({
  -- use_saga_diagnostic_sign = true
  -- error_sign = '',
  -- warn_sign = '',
  -- hint_sign = '',
  -- infor_sign = '',
  -- dianostic_header_icon = '   ',
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = false,
  },
  -- finder_definition_icon = '  ',
  -- finder_reference_icon = '  ',
  -- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
  -- finder_action_keys = {
  --  open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
  -- },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  -- rename_action_keys = {
  --   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
  -- },
  -- definition_preview_icon = '  '
  -- "single" "double" "round" "plus"
  -- border_style = "single"
  -- rename_prompt_prefix = '➤',
  -- if you don't use nvim-lspconfig you must pass your server name and
  -- the related filetypes into this table
  -- like server_filetype_map = {metals = {'sbt', 'scala'}}
  -- server_filetype_map = {}
})


virtual_text = {
  show = false,
  settings = {
    spacing = 4,
    prefix = "← ",
  },
}

virtual_text.toggle = function()
  virtual_text.show = not virtual_text.show

  vim.diagnostic.show(nil, 0, nil, { virtual_text = virtual_text.show })
end

vim.api.nvim_set_keymap("n", "yoe", "<Cmd>lua virtual_text.toggle()<CR>", { silent = true, noremap = true })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = false,
  signs = true,
})

local on_attach = function(client, bufnr)
  local function key_map(m, r, l)
    vim.api.nvim_buf_set_keymap(bufnr, m, r, l, { noremap = true, silent = true })
  end

  key_map("n", "L", '<cmd>Lspsaga show_line_diagnostics<CR>')
  -- key_map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")

  key_map("n", "[e", '<cmd>Lspsaga diagnostic_jump_prev<CR>')
  key_map("n", "]e", '<cmd>Lspsaga diagnostic_jump_next<CR>')

  -- key_map("n", "<space>ga", '<cmd>lua require("lspsaga.codeaction").code_action()<CR>')
  key_map("n", "<space>ga", '<cmd>CodeActionMenu<cr>')
  key_map("v", "<space>ga", '<cmd>Lspsaga range_code_action<CR>')

  key_map('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
  key_map('n', '<c-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<cr>')
  key_map('n', '<c-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>')

  key_map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
  key_map("n", "<c-]>", "<Cmd>lua vim.lsp.buf.definition()<CR>")

  key_map("n", "g<c-]>", "<Cmd>Lspsaga preview_definition<CR>")

  -- key_map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
  key_map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  -- key_map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  key_map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
  key_map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
  key_map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
  key_map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  key_map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  vim.cmd "command! Rename lua vim.lsp.buf.rename()<CR>"
  key_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  key_map("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  key_map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  key_map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
  key_map("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")

  -- -- Set some keybinds conditional on server capabilities
  -- if client.server_capabilities.documentFormattingProvider then
  --   key_map("n", "Q", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  --   vim.cmd "command! Format lua vim.lsp.buf.formatting()<CR>"
  -- elseif client.server_capabilities.documentFormattingProvider then
  --   key_map("n", "Q", "<cmd>lua vim.lsp.buf.range_formatting()<CR>")
  --   vim.cmd "command! Format lua vim.lsp.buf.range_formatting()<CR>"
  -- end

  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec(
    [[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]],
    false
    )
  end

  -- require("aerial").on_attach(client, bufnr)
end

local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  -- capabilities.textDocument.foldingRange = {
  --   dynamicRegistration = false,
  --   lineFoldingOnly = true
  -- }

  local cmp_lsp = prequire('cmp_nvim_lsp')

  if cmp_lsp then
    capabilities = cmp_lsp.update_capabilities(capabilities)
  else
    print_warn('cmp_nvim_lsp not found')
  end

  return {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

local function disable_default_formating(client, bufnr)
  local null_ls = prequire('null-ls')
  if not null_ls then return print_warn('null-ls not found') end

  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.document_range_formatting = false

  vim.api.nvim_buf_set_keymap(
    bufnr, "n", "Q", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true }
  )
  vim.cmd "command! Format lua vim.lsp.buf.formatting()<CR>"
end

local Servers = {}

Servers.sumneko_lua = function(config)
  local lua_dev = prequire('lua-dev')
  if not lua_dev then return print_warn('lua-dev not found') end

  local lua_dev_config = lua_dev.setup {
    lspconfig = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "describe", "it", "p", "luapad", "use", "before_each" },
            disable = { "lowercase-global" },
          },
        }
      }
    }
  }

  return vim.tbl_extend('force', config, lua_dev_config)
end

Servers.tsserver = function(config)
  config.on_attach = function(client, bufnr)
    disable_default_formating(client, bufnr)
    on_attach(client, bufnr)

    local ts_utils_required, ts_utils = pcall(require, 'nvim-lsp-ts-utils')
    if ts_utils_required then
      ts_utils.setup {
        debug = false,
        disable_commands = false,
        enable_import_on_completion = false,
        -- eslint
        eslint_enable_code_actions = true,
        eslint_enable_disable_comments = true,
        eslint_bin = "eslint_d",
        eslint_enable_diagnostics = false,
        eslint_opts = {},
      }

      -- required to fix code action ranges and filter diagnostics
      ts_utils.setup_client(client)

      -- no default maps, so you may want to define some here
      local opts = { silent = true }
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
    end

  end
  return config
end

Servers.solargraph = function(config)
  config.on_attach = function(client, bufnr)
    disable_default_formating(client, bufnr)
    on_attach(client, bufnr)
  end
  return config
end

Servers.tailwindcss = function(config)
  config.settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
        "class:\\s+\"([^\"]*)",
        "class:\\s+'([^\']*)"
        }
      }
    }
  }
  return config
end

lsp_installer.on_server_ready(function(server)
    local config = make_config()

    if Servers[server.name] then
      config = Servers[server.name](config)
    end

    server:setup(config)
end)


local config = make_config()
require('lspconfig').solargraph.setup(config)


local null_ls = prequire('null-ls')
if not null_ls then return print_warn('null-ls not found') end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.rubocop.with({
      args = { "--auto-correct-all", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" }
    }),
  },
})

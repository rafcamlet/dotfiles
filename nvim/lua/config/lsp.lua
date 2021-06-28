local _, nvim_lsp = pcall(require, 'lspconfig')
if not nvim_lsp then return end

local _, saga = pcall(require, 'lspsaga')
if not saga then return end

local _, lspinstall = pcall(require, 'lspinstall')
if not lspinstall then return end

lspinstall.setup()

saga.init_lsp_saga {
  -- use_saga_diagnostic_sign = true
  -- error_sign = '',
  -- warn_sign = '',
  -- hint_sign = '',
  -- infor_sign = '',
  -- dianostic_header_icon = '   ',
  code_action_icon = ' ',
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
    quit = '<c-c>',exec = '<CR>'
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
}


virtual_text = {
  show = false,
  settings = {
      spacing = 4,
      prefix = '← ',
  },
}

virtual_text.toggle = function()
    virtual_text.show = not virtual_text.show

    vim.lsp.diagnostic.display(
      vim.lsp.diagnostic.get(0, 1),
      0,
      1,
      {
        virtual_text = virtual_text.show and virtual_text.settings
      }
    )
end

vim.api.nvim_set_keymap(
    'n',
    'yoe',
    '<Cmd>lua virtual_text.toggle()<CR>',
    {silent=true, noremap=true}
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true
  }
)

local on_attach = function(client, bufnr)
  local function key_map(m, r, l) vim.api.nvim_buf_set_keymap(bufnr, m, r, l, { noremap=true, silent=true }) end

  key_map('n', 'L', '<cmd>lua require"lspsaga.diagnostic".show_cursor_diagnostics()<CR>')
  key_map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')

  key_map('n', '[e', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()<CR>')
  key_map('n', ']e', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next()<CR>')

  key_map('n', '<space>ga', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>')
  key_map('v', '<space>ga', '<cmd>lua require("lspsaga.codeaction").range_code_action()<CR>')

  -- key_map('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>')

  key_map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
  key_map('n', '<c-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>')
  -- key_map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
  key_map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  -- key_map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  key_map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
  key_map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
  key_map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
  key_map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  key_map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  key_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  key_map('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  key_map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  key_map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  key_map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    key_map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  elseif client.resolved_capabilities.document_range_formatting then
    key_map("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>")
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]], false)
  end
end

local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

local function setup_servers()
  local servers = require'lspinstall'.installed_servers()

  for _, server in pairs(servers) do
    local config = make_config()

    -- if server == "rust" then
    --   config.settings = {
    --   }
    -- end

    if server == "lua" then
      local sumneko_path = vim.split(package.path, ";")
      table.insert(sumneko_path, "lua/?.lua")
      table.insert(sumneko_path, "lua/?/init.lua")

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

      config.settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
            path = sumneko_path,
          },
          completion = { callSnippet = "Both" },
          diagnostics = {
            globals = { "vim", "describe", "it", "p", "luapad", "use" },
            disable = { "lowercase-global" }
          },
          workspace = {
            library = get_lua_runtime()
          }
        }
      }
    end

    nvim_lsp[server].setup(config)
  end
end

setup_servers()

require'lspinstall'.post_install_hook = function ()
  setup_servers()
  vim.cmd("bufdo e")
end

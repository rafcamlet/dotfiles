local function keybindings(bufnr)
  local function key_map(m, r, l)
    vim.api.nvim_buf_set_keymap(bufnr, m, r, l, { noremap = true, silent = true })
  end

  key_map("n", "L", '<cmd>Lspsaga show_line_diagnostics<CR>')

  key_map("n", "[e", '<cmd>Lspsaga diagnostic_jump_prev<CR>')
  key_map("n", "]e", '<cmd>Lspsaga diagnostic_jump_next<CR>')

  key_map("n", "<space>la", '<cmd>Lspsaga code_action<cr>')
  key_map("v", "<space>la", '<cmd>Lspsaga range_code_action<CR>')
  key_map("n", "<space>lf", '<cmd>Lspsaga lsp_finder<CR>')
  key_map("n", "<space>lo", '<cmd>LSoutlineToggle<cr>')

  key_map('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
  key_map("n", "<c-]>", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  key_map("n", "gd", "<cmd>Lspsaga peek_definition<CR>")

  vim.cmd "command! Rename Lspsaga rename"


  -- key_map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
  -- key_map("n", "g<c-]>", "<Cmd>Lspsaga preview_definition<CR>")

  -- key_map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  -- key_map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
  -- key_map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
  -- key_map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")

  -- key_map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  -- key_map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  -- key_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  -- key_map("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  -- key_map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  -- key_map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
  -- key_map("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
end

local function highlights(client)
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
end

local function request_diagnostic(client, bufnr)
  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePre', 'CursorHold' }, {
    buffer = bufnr,
    callback = function()
      local params = vim.lsp.util.make_text_document_params(bufnr)

      client.request(
        'textDocument/diagnostic',
        { textDocument = params },
        function(err, result)
          if err then return end

          vim.lsp.diagnostic.on_publish_diagnostics(
            nil,
            vim.tbl_extend('keep', params, { diagnostics = result.items }),
            { client_id = client.id }
          )
        end
      )
    end,
  })
end


return {
  keybindings = keybindings,
  highlights = highlights,
  request_diagnostic = request_diagnostic
}

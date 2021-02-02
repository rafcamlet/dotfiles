-- vim.o.completeopt = 'menuone,noinsert,noselect'
-- vim.o.shortmess = vim.o.shortmess .. 'c'
--
-- vim.g.completion_enable_snippet = 'UltiSnips'
-- -- vim.g.completion_confirm_key = "<c-y>"
-- vim.g.completion_trigger_character = {'.', '::'}
-- vim.g.completion_enable_auto_signature = 0
-- vim.g.completion_enable_auto_hover = 0
-- vim.g.completion_sorting = "length"
-- vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'}
--
-- vim.cmd 'imap <silent> <c-n> <Plug>(completion_trigger)'
-- vim.cmd 'imap <c-k> <Plug>(completion_prev_source)'
--
--
-- local css_var_dict = require'comp'.dict('var', {
--   'primary', 'secondary', 'secondary-bright', 'secondary4', 'tertriary',
--   'gray6', 'gray5', 'gray4', 'gray3', 'gray2', 'gray1', 'white', 'white3',
--   'black', 'disabled', 'disabled-light', 'font-color'
-- })
--
-- require'completion'.addCompletionSource(
--   'css_var_dict', { item = css_var_dict }
-- )
--
-- require'completion'.addCompletionSource(
--   'view_components', { item = require'comp'.components }
-- )
--
--
-- vim.g.completion_chain_complete_list = {
--   default = {
--     -- { complete_items = { 'path', 'lsp', 'buffers', 'snippet', 'dict'} },
--     { complete_items = { 'path', 'lsp', 'snippet' } },
--     { complete_items = { 'lsp' }},
--     -- { mode = { '<c-n>' } },
--     -- { mode = { '<c-p>' } }
--   },
--   haml = {
--     { complete_items = { 'path', 'lsp', 'buffers', 'snippet', 'view_components'} },
--     { mode = { '<c-n>' } },
--     { mode = { '<c-p>' } }
--   },
--   scss = {
--     { complete_items = { 'css_var_dict', 'lsp' } },
--     { complete_items = { 'buffers', 'snippet' } }
--   }
-- }
--
-- -- vim.cmd("autocmd BufEnter * lua require'completion'.on_attach()")

require'compe'.setup {
  enabled = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  -- throttle_time = ... number ...;
  -- source_timeout = ... number ...;
  -- incomplete_delay = ... number ...;
  allow_prefix_unmatch = false;

  source = {
    path = true;
    buffer = true;
    ultisnips = true;
    nvim_lsp = true;
    components = true;
    colors = true;
    -- nvim_lua = true;
  };
}

vim.cmd[[inoremap <silent><expr> <c-n> compe#complete()]]
vim.cmd[[inoremap <silent><expr> <c-k> compe#confirm('<CR>')]]
vim.cmd[[inoremap <silent><expr> <c-e> compe#close('<C-e>')]]

require'compe'.register_source('components', {
  get_metadata = function()
    return {
      filetypes = { 'haml' },
      dup = 0,
      priority = 10,
      menu = '[COMP]'
    }
  end,
  datermine = function(_, context)
    return require'compe'.helper.datermine(context)
  end,
  complete = function(_, args)
    cmd = [[rg --color=never --no-filename --no-line-number -e '^.*?class +([a-zA-Z0-9:]*) ?.*$' app/components -r '$1' | sed '/^$/d']]
    result = vim.fn.systemlist(cmd)
    args.callback({ items = result})
  end
})

require'compe'.register_source('colors', {
  get_metadata = function()
    return {
      filetypes = { 'scss' },
      dup = 0,
      priority = 100,
      menu = '[COL]'
    }
  end,
  datermine = function(_, context)
    return require'compe'.helper.datermine(context)
  end,
  complete = function(_, args)
    args.callback({ items = {
      'primary',
      'primary-light',
      'secondary',
      'secondary-bright',
      'secondary4',
      'tertriary',
      'gray6',
      'gray5',
      'gray4',
      'gray3',
      'gray2',
      'gray1',
      'white',
      'white3',
      'black',
      'black2',
      'disabled',
      'disabled-light',
      'font-color',
      'success',
      'error'
    }})
  end
})

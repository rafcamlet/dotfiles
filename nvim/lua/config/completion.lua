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

vim.cmd("autocmd BufEnter * lua require'completion'.on_attach()")

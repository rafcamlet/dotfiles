function tb_jump(type)
  local ext = {
    cell = '.rb',
    style = '.scss',
    view = '.haml',
    query = '.rb'
  }

        local path = vim.fn.expand('%')
  local concept = path:match('concepts/([^/]*)/')
  local path = path:gsub('app/concepts/'..concept .. '/([^/]*)/', '')
  local file = path:match('([^\.]*)\.')

  if not file or not concept then return end

  vim.api.nvim_command('e app/concepts/' .. concept .. '/' .. type .. '/' .. file .. ext[type])
end

vim.api.nvim_command('nnoremap <space>jc :lua require("regex_jump").tb_jump("cell")<cr> ')
vim.api.nvim_command('nnoremap <space>js :lua require("regex_jump").tb_jump("style")<cr> ')
vim.api.nvim_command('nnoremap <space>jv :lua require("regex_jump").tb_jump("view")<cr> ')
vim.api.nvim_command('nnoremap <space>jq :lua require("regex_jump").tb_jump("query")<cr> ')

return { tb_jump = tb_jump }

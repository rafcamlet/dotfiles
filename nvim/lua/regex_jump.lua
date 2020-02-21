function create_map(key, type)
  vim.api.nvim_command('nnoremap <silent> <space>j'.. key .. ' :lua require("regex_jump").tb_jump("' .. type ..  '")<cr> ')
end

function tb_jump(type)
  local ext = {
    cell = '.rb',
    style = '.scss',
    view = '.haml',
    query = '.rb',
    form = '.rb',
    operation = '.rb'
  }

  local is_controller = vim.fn.expand('%:t:r'):match('(.*)_controller')
  local is_model = vim.fn.expand('%'):match('app/models/(.*)\.rb')
  local fname = is_controller or is_model
  if fname then
    vim.api.nvim_command('e app/concepts/' .. fname:gsub('s$', '') .. '/' .. type )
    return
  end

  local path = vim.fn.expand('%')
  path = path:match('app/concepts/(.*)')
  arr_path = vim.split(path, '/', true)

  local concept = {}
  for k,v in ipairs(arr_path) do
    if not ext[v] then
      table.insert(concept, v)
    else
      break
    end
  end
  concept =  table.concat(concept, '/')

  local file = vim.fn.expand('%:t:r')

  if not file or not concept then return end

  vim.api.nvim_command('e app/concepts/' .. concept .. '/' .. type .. '/' .. file .. ext[type])
end

create_map('c', 'cell')
create_map('s', 'style')
create_map('v', 'view')
create_map('q', 'query')
create_map('o', 'operation')
create_map('f', 'form')

return { tb_jump = tb_jump }

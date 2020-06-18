local function pascal_case(str)
  local result = ''
  for x in str:gmatch('%w+') do
    result = result..x:sub(1,1):upper()..string.lower(x:sub(2))
  end
  return result
end

local function exec(command)
  local handle = io.popen(command)
  local result = handle:read("*a")
  result = vim.split(result, "\n")
  table.remove(result, #result)
  handle:close()
  return result
end

local function search(path, acc)
  if not acc then acc = {} end

  local name = pascal_case(vim.fn.fnamemodify(path, ':t:r'))
  table.insert(acc, path)

  local result = exec('rg -l "<' .. name .. '($|\\s|>)" -g "*.vue"')

  if #result > 0 then
    return search(result[1], acc)
  else
    return acc
  end
end

local function show_component_list()
  local result = search(vim.fn.expand('%:t:r'))
  local wrap = vim.call('fzf#wrap', {source = result, sink = 'e'})
  vim.call('fzf#run', wrap)
end

vim.api.nvim_command('command! ComponentsTree lua require"components_tree".show_component_list()')

return {
  show_component_list = show_component_list
}

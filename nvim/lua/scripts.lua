-- vim: foldmethod=marker:foldlevel=0

-- {{{ copy_ruby_class
function copy_ruby_class(s, e)
  local lines = vim.api.nvim_buf_get_lines(0, s - 1, e, false)
  local result = {}
  for i, v in ipairs(lines) do
    local str = v:match('class (.*)') or v:match('module (.*)')
    str = str:match('([^ ]*) ?<?')
    table.insert(result, str)
  end
  local class_name = table.concat(result, '::')
  vim.api.nvim_command('let @+="' .. class_name  .. '"')
end
--}}}
-- {{{ ruby_class_from_path
function ruby_class_from_path()
  local result = {}

  arr = vim.split(vim.api.nvim_get_current_line(), '/')

  for i, v in ipairs(arr) do
    v = v:gsub('^.', string.upper)
    v = v:gsub("_(%a)([%a]*)", function(first, rest)
      return first:upper()..rest:lower()
    end)
    table.insert(result, v)
  end

  local last = table.remove(result, #result)
  last = last:gsub('.rb$', '')

  for i, v in ipairs(result) do
    result[i] = 'module ' .. v
  end
  table.insert(result, 'class ' .. last)

  for i, v in ipairs(result) do
    result[i] = string.rep('  ', i - 1) .. v
  end

  for i=#result, 1, -1 do
    table.insert(result, string.rep('  ', i - 1) .. 'end')
  end
  vim.api.nvim_put(result, 'l', false, false)
end
-- }}}
-- {{{ horizontal_main()
function horizontal_main()
  local win = vim.api.nvim_get_current_win()
  local wins = vim.api.nvim_tabpage_list_wins(0)

  for i, v in ipairs(wins) do
    if v ~= win then
      vim.api.nvim_set_current_win(v)
      vim.api.nvim_command('wincmd J')
    end
  end

  vim.api.nvim_set_current_win(win)
  vim.api.nvim_command('wincmd H')

  local width = vim.api.nvim_get_option('columns')
  vim.api.nvim_win_set_width(0, math.ceil(width * 0.7))
end
--- }}}
-- {{{ vertical_main()
function vertical_main()
  local win = vim.api.nvim_get_current_win()
  local wins = vim.api.nvim_tabpage_list_wins(0)

  for i, v in ipairs(wins) do
    if v ~= win then
      vim.api.nvim_set_current_win(v)
      vim.api.nvim_command('wincmd L')
    end
  end

  vim.api.nvim_set_current_win(win)
  vim.api.nvim_command('wincmd K')

  local width = vim.api.nvim_get_option('lines')
  vim.api.nvim_win_set_height(0, math.ceil(width * 0.5))
end
-- }}}

vim.api.nvim_command('command! RubyClassFromPath lua ruby_class_from_path()')
vim.api.nvim_command('command! -range RubyCopyClass lua copy_ruby_class(<line1>, <line2>)')
vim.api.nvim_command('command! HorizontalMain lua horizontal_main()')
vim.api.nvim_command('command! VerticalMain lua vertical_main()')

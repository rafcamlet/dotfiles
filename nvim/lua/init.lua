function tabline()
  local get_name = function(win)
    local buf = vim.api.nvim_win_get_buf(win)
    local name = vim.api.nvim_buf_get_name(buf)
    name = vim.fn.fnamemodify(name, ':t')
    if name == '' then name = '[-]' end
    return name
  end

  local result = ''

  for i, v in ipairs(vim.api.nvim_list_tabpages()) do
    local is_current = vim.api.nvim_get_current_tabpage() == v

    if is_current then
      local name = get_name(vim.api.nvim_get_current_win())
      result = result .. ([[%s %s %s ]]):format('%#TabLineSel#', i, name)
    else
      local wins = vim.api.nvim_tabpage_list_wins(v)
      for _, win in ipairs(wins) do
        local name = get_name(win)
        if not name:match('NERD_tree') then
          result = result .. ([[%s %s %s ]]):format('%#TabLine#', i, name)
        end
      end
    end
  end
  return '%#TabLine#' .. result .. '%#TabLineFill#'
end

vim.api.nvim_command('set tabline=%!v:lua.tabline()')

function tabline()
  local result = ''

  for i, v in ipairs(vim.api.nvim_list_tabpages()) do
    local is_current = vim.api.nvim_get_current_tabpage() == v

    local wins = vim.api.nvim_tabpage_list_wins(v)
    local names = {}

    for j, win in ipairs(wins) do
      local buf = vim.api.nvim_win_get_buf(win)
      local name = vim.api.nvim_buf_get_name(buf)
      name = vim.fn.fnamemodify(name, ':t')

      is_nerdtree = name:match('NERD_tree')
      if name ~= '' and not is_nerdtree then table.insert(names, name) end
    end

    local names_str

    if #names == 0 then
      names_str = '[-]'
    elseif is_current then
      name = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
      names_str = vim.fn.fnamemodify(name, ':t')
    else
      names_str = table.concat(names, ' | ')
    end

    local prefix
    if is_current then
      prefix = '%#TabLineSel#'
    else
      prefix = '%#TabLine#'
    end

    local tab = ([[%s %s %s ]]):format(prefix, i, names_str)
    result = result .. tab 
  end
  return '%#TabLine#' .. result .. '%#TabLineFill#'
end

vim.api.nvim_command('set tabline=%!v:lua.tabline()')

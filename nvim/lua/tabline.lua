local hl_color = require 'helpers'.hl_color
local get_icon = require'nvim-web-devicons'.get_icon

-- hl_color('TabLineBack', 0, 232)
-- hl_color('TabLineNr', 111, 234)
-- hl_color('TabItem', 245, 235)
-- hl_color('TabLineSel', 250, 236)
-- hl_color('TabLineNrSel', 208, 235)

hl_color('TabLineBack', 0, 0)
hl_color('TabLineNr', 111, 232)
hl_color('TabItem', 245, 234)
hl_color('TabLineSel', 250, 234)
hl_color('TabLineNrSel', 208, 232)


hl_color('TabLineDevIconRb', 1, 234)
hl_color('TabLineDevIconRake', 1, 234)

hl_color('TabLineDevIconJs', 3, 234)
hl_color('TabLineDevIconJson', 3, 234)

hl_color('TabLineDevIconHtml', 208, 234)
hl_color('TabLineDevIconMd', 22, 234)
hl_color('TabLineDevIconScss', 5, 234)
hl_color('TabLineDevIconVim', 34, 234)
hl_color('TabLineDevIconLua', 111, 234)

local colors = {
  DevIconRb = true,
  DevIconRake = true,
  DevIconJs = true,
  DevIconJson = true,
  DevIconHtml = true,
  DevIconMd = true,
  DevIconScss = true,
  DevIconVim = true,
  DevIconLua = true,
}

function tabline()
  local result = ''

  for i, v in ipairs(vim.api.nvim_list_tabpages()) do
    local is_current = vim.api.nvim_get_current_tabpage() == v

    local wins = vim.api.nvim_tabpage_list_wins(v)
    local names = {}

    for _, win in ipairs(wins) do
      local buf = vim.api.nvim_win_get_buf(win)
      local name = vim.api.nvim_buf_get_name(buf)
      name = vim.fn.fnamemodify(name, ':t')

      is_nerdtree = name:match('NERD_tree')
      if name ~= '' and not is_nerdtree then
        local icon, color = get_icon(name, vim.fn.fnamemodify(name, ':e'), {})
        if colors[color] then
          color = ('%%#TabLine%s#'):format(color)
        else
          color = '%#TabItem#'
        end
        table.insert(names, ('%s%s %s%s'):format(color, icon, '%#TabItem#', name))
      end
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
      prefix = '%#TabItem#'
    end

    if is_current then
      nr = '%#TabLineNrSel#'
    else
      nr = '%#TabLineNr#'
    end

    local tab = ([[%s %s %s %s %s ]]):format(nr, i, prefix, names_str, '%#TabLineBack#')
    result = result .. tab
  end
  return '%#TabLineBack#' .. result .. '%#TabLineBack#'
end

local function setup()
  vim.cmd('set tabline=%!v:lua.tabline()')
end

return {
  setup = setup,
  tabline = tabline
}

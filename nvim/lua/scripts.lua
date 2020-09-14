function horizontal_main()
  local win = vim.api.nvim_get_current_win()
  local wins = vim.api.nvim_tabpage_list_wins(0)

  for _, v in ipairs(wins) do
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

function vertical_main()
  local win = vim.api.nvim_get_current_win()
  local wins = vim.api.nvim_tabpage_list_wins(0)

  for _, v in ipairs(wins) do
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

local function cmd(name, str)
  vim.cmd(([[command! %s lua require("scripts").%s]]):format(name, str))
end

cmd('HorizontalMain', 'horizontal_main()')
cmd('VerticalMain', 'vertical_main()')

return {
  horizontal_main = horizontal_main,
  vertical_main = vertical_main,
  cmd = cmd
}

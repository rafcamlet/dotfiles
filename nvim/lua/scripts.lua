local function is_qf_open()
  local tab = vim.api.nvim_get_current_tabpage()
  local wins = vim.api.nvim_tabpage_list_wins(tab)

  for _, v in ipairs(wins) do
    local buf = vim.api.nvim_win_get_buf(v)
    local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
    if ft  == 'qf' then return true end
  end
  return false
end

local function if_qf_open(if_yes, if_not)
  if is_qf_open() then
    return if_yes
  else
    return if_not
  end
end


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

local function vifm(root)
  local path

  if root then
    path = vim.fn.getcwd()
  else
    path = vim.fn.expand('%:h')
  end

  local on_choose = 'nvr --servername ' .. vim.v.servername ..  ' --remote-silent %c '
  local vifm_cmd = ('COLORTERM=tmux-256color vifm -c "view!" --on-choose "%s" %s && tmux kill-pane'):format(on_choose, path)
  vim.fn.system(("tmux split-window -hf '%s'; tmux resize-pane -Z"):format(vifm_cmd))
end


cmd('HorizontalMain', 'horizontal_main()')
cmd('VerticalMain', 'vertical_main()')

-- vim.cmd('nnoremap <space>v <cmd>lua require("scripts").vifm()<cr>')
-- vim.cmd('nnoremap <space>V <cmd>lua require("scripts").vifm(true)<cr>')

return {
  horizontal_main = horizontal_main,
  vertical_main = vertical_main,
  vifm = vifm,
  cmd = cmd,
  if_qf_open = if_qf_open
}

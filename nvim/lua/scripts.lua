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


hsl = require('lush').hsl

local function adjust_color(h, s, l)
  local str = vim.api.nvim_get_current_line()
  local pattern = '#' .. string.rep('[0-9a-fA-F]', 6)
  local hex = str:match(pattern)
  local color = hsl(hex)()
  color['h'] =  color['h'] + h
  color['s'] =  color['s'] + s
  color['l'] =  color['l'] + l
  local result = tostring(hsl(color['h'], color['s'], color['l']))
  vim.api.nvim_set_current_line(str.gsub(pattern, result))
end

vim.cmd('nnoremap <k7> <cmd>lua require"scripts".adjust_color(1,0,0)<cr>')
vim.cmd('nnoremap <k4> <cmd>lua require"scripts".adjust_color(-1,0,0)<cr>')
vim.cmd('nnoremap <k8> <cmd>lua require"scripts".adjust_color(0,1,0)<cr>')
vim.cmd('nnoremap <k5> <cmd>lua require"scripts".adjust_color(0,-1,0)<cr>')
vim.cmd('nnoremap <k9> <cmd>lua require"scripts".adjust_color(0,0,1)<cr>')
vim.cmd('nnoremap <k6> <cmd>lua require"scripts".adjust_color(0,0,-1)<cr>')

cmd('HorizontalMain', 'horizontal_main()')
cmd('VerticalMain', 'vertical_main()')

-- vim.cmd('nnoremap <space>v <cmd>lua require("scripts").vifm()<cr>')
-- vim.cmd('nnoremap <space>V <cmd>lua require("scripts").vifm(true)<cr>')

return {
  horizontal_main = horizontal_main,
  vertical_main = vertical_main,
  vifm = vifm,
  cmd = cmd,
  if_qf_open = if_qf_open,
  adjust_color = adjust_color
}

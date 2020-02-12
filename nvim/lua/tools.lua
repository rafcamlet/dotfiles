local Tools = {}

function Tools.wow()
  print 'Wow!2'
  Tools.FloatingWin()
end

function Tools.FloatingWin()
  -- get the editor's max width and height

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")
  local win_height = math.ceil(height * 0.9 - 4)
  local win_width = math.ceil(width * 0.9)

  local opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = math.ceil((height - win_height) / 2 - 1),
    col = math.ceil((width - win_width) / 2)
  }
  local win = vim.api.nvim_open_win(buf, true, opts)
  -- vim.api.nvim_command('highlight ToolsTest ctermbg=1')
  -- vim.api.nvim_buf_add_highlight(buf, -1, 'ToolsTest', 1, 0, -1)
  vim.api.nvim_buf_set_virtual_text(buf, -1, 0, {{'Niesamowite', 'Search'}}, {})
end

return Tools

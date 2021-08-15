
local buf = vim.api.nvim_create_buf(false, true)

vim.api.nvim_buf_set_lines(buf, 0, -1, false, {'1', '2', '3'})

vim.api.nvim_open_win(buf, true, {
  relative = 'win',
  row = vim.o.lines - 4,
  col = 0,
  anchor = 'SW',
  width = vim.o.columns,
  height = 10,
  style = 'minimal',
  border = 'rounded'
})

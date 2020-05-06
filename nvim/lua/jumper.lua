local api = vim.api

function jumper()
  local pos = api.nvim_win_get_cursor(0)

  while true do
    api.nvim_win_set_option(0, 'cursorline', true)
    local raw_char = vim.fn.getchar()
    local char = vim.fn.nr2char(raw_char)
    local arr = {
      ['1'] = '<template>',
      ['2'] = '<script>',
      ['3'] = '<style.*>',
      p = 'props:',
      d = 'data%(%)',
      c = 'computed:',
      m = 'methods:',
    }
    local regex = arr[char]

    if not regex then
      api.nvim_win_set_option(0, 'cursorline', false)
      if raw_char ~= 13 then api.nvim_feedkeys(char, 't', false) end
      if raw_char == 27 then api.nvim_win_set_cursor(0, pos) end
      break
    end

    local lines = api.nvim_buf_get_lines(0, 0, -1, false)
    for i, line in ipairs(lines) do
      if line:match(regex) then
        api.nvim_win_set_cursor(0, {i, 0})
        api.nvim_command('normal! zt')
        api.nvim_command('redraw')
      end
    end
  end
end

api.nvim_set_keymap('n', '<tab><tab>', ':lua jumper()<cr>', { noremap=true, silent=true })

vim.o.foldcolumn = '0'
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = -1
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

require('ufo').setup({
  provider_selector = function(bufnr, filetype)
    return {'treesitter', 'indent'}
  end
})

local utils = require('ufo.utils')

local function close_level()
  local lineCount = vim.api.nvim_buf_line_count(0)
  local winView = vim.fn.winsaveview()
  local cur = vim.fn.foldlevel('.')
  local lnum = 1
  while lnum <= lineCount do
    p(vim.fn.foldlevel(lnum), cur)
    if vim.fn.foldlevel(lnum) == cur  + 1 and vim.fn.foldclosed(lnum) == -1 then
      vim.api.nvim_win_set_cursor(0, {lnum, 0})
      vim.cmd('norm! zc')
      local endLnum = utils.foldClosedEnd(0, lnum)
      lnum = endLnum > 0 and (endLnum + 1) or (lnum + 1)
    else
      lnum = lnum + 1
    end
  end
  vim.fn.winrestview(winView)
end

local function open_level()
  local lineCount = vim.api.nvim_buf_line_count(0)
  local winView = vim.fn.winsaveview()
  local cur = vim.fn.foldlevel('.')
  local lnum = 1
  while lnum <= lineCount do
    local endLnum = utils.foldClosedEnd(0, lnum)
    if endLnum > 0 then
      vim.api.nvim_win_set_cursor(0, {lnum, 0})
      if vim.fn.foldlevel(lnum) >= cur  then
        vim.cmd('norm! zO')
      end
      lnum = endLnum + 1
    else
      lnum = lnum + 1
    end
  end
  vim.fn.winrestview(winView)
  vim.cmd('IndentBlanklineRefresh')
end

vim.keymap.set('n', 'zm', close_level)
vim.keymap.set('n', 'zr', open_level)

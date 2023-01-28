require 'config.helpers'

require "config.keybindings"
require "config.settings"
require "config.plugins"

if os.getenv('INSTALL') then return end

require "config.lsp"
require "config.dap"

load_colorscheme 'onedark'

vim.keymap.set('n', '<c-q>', require'scripts'.quickfix_toggle)
vim.keymap.set('n', '<space>f', require'scripts'.send_to_tmux)
vim.keymap.set('n', '<leader>f', function() require'scripts'.send_to_tmux(true) end)
vim.keymap.set('n', '<space>og', require'finders'.git)
vim.keymap.set('n', '<space>oo', require'finders'.find)
vim.keymap.set('n', '<space>ov', function()
  require'finders'.find { cwd = vim.fn.getcwd() .. '/app/views'}
end)
vim.keymap.set('n', '<space>ob', '<cmd> Telescope buffers<cr>')

vim.keymap.set('n', '<space>oq', function()
  require'finders'.find {
    cwd = vim.fn.fnamemodify(vim.fn.expand('$MYVIMRC'), ':h'),
    pattern = "(lua|vim)$"
  }
end)

vim.keymap.set('n', '<space>of', "<cmd>lua require'finders'.live_grep()<cr>")
vim.keymap.set('n', '<space>oB', "<cmd>lua require'finders'.live_grep_buffers()<cr>")
vim.keymap.set('n', '<space>ow', "<cmd>Telescope workspaces<cr>")
vim.keymap.set('n', '<space>oh', "<cmd>Telescope help_tags<cr>")
vim.keymap.set('n', '<space>oz', "<cmd>Telescope zoxide list<cr>")
vim.keymap.set('n', '<space><c-o><c-o>', "<cmd>Telescope resume<cr>")
vim.keymap.set('n', '<space>o<c-o>', "<cmd>Telescope resume<cr>")

vim.api.nvim_create_user_command('OpenMigration', function()
  local path = vim.fn.system 'ls -tr db/migrate | tail -1'
  vim.cmd('e db/migrate/' .. path)
end, {})

autogroup('nvimrc_group', function(autocmd)
  autocmd('BufEnter', function()
    local local_vimrc = vim.fn.getcwd() .. '/.nvimrc.lua'
    if not vim.loop.fs_stat(local_vimrc) then return end

    local source = vim.secure.read(local_vimrc)
    if not source then return end
    vim.cmd(string.format('so %s', local_vimrc))
  end)
end)

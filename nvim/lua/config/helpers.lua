function print_warn(str)
  vim.api.nvim_command('echohl WarningMsg')
  vim.api.nvim_command(('echomsg "%s"'):format(str))
  vim.api.nvim_command('echohl None')
end

function print_error(str)
  vim.api.nvim_command('echohl Error')
  vim.api.nvim_command(('echomsg "%s"'):format(str))
  vim.api.nvim_command('echohl None')
end

function prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then return lib end
  return nil
end

function p(...)
  if #{ ... } > 1 then
    print(vim.inspect({ ... }))
  else
    print(vim.inspect(...))
  end
end

local function open_github()
  local line = vim.api.nvim_get_current_line()
  local repo = line:match([['(.-/.-)']]) or line:match([["(.-/.-)"]])

  if not repo then return end

  vim.fn.system('xdg-open https://github.com/' .. repo)
end

local function open_config()
  local line = vim.api.nvim_get_current_line()
  local filename = line:match([['.-/(.-)']]) or line:match([[".-/(.-)"]])
  filename = filename:gsub('%.nvim', '')

  if not filename then return end
  local config = vim.fn.stdpath('config') .. '/lua/config/plugins/'

  vim.cmd('edit ' .. config .. filename .. '.lua')
end

function compile_plugins()
  package.loaded["config.plugins"] = nil
  require 'config.plugins'
  vim.cmd 'PackerCompile'
end

local function config_file(file)
  vim.api.nvim_command(("runtime config/%s.vim"):format(file))
end

local function update()
  package.loaded["config.plugins"] = nil
  require 'config.plugins'
  vim.cmd 'PackerSync'
end

vim.api.nvim_create_user_command('Update', function()
  require'config.helpers'.update()
end, {})

return {
  config_file = config_file,
  update = update,
  open_github = open_github,
  open_config = open_config
}

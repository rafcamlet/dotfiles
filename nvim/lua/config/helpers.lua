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

vim.cmd [[command! Update lua require'config.helpers'.update()]]

return {
  config_file = config_file,
  update = update,
  open_github = open_github
}

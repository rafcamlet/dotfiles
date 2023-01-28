local List = {}

local function filename(name)
  return name:gsub('%.nvim', ''):lower()
end

local function open_github()
  local line = vim.api.nvim_get_current_line()
  local repo = line:match([['(.-/.-)']]) or line:match([["(.-/.-)"]])

  if not repo then return end

  vim.fn.system('xdg-open https://github.com/' .. repo)
end

local function open_config()
  local line = vim.api.nvim_get_current_line()
  local name = filename(line:match([['.-/(.-)']]) or line:match([[".-/(.-)"]]))

  if not name then return end
  local config = vim.fn.stdpath('config') .. '/lua/config/plugins/'

  vim.cmd('edit ' .. config .. name .. '.lua')
end

local use = function(plugin)
  table.insert(List, plugin)
end

local Use = function(plugin)
  local plugin_name = plugin
  if type(plugin) == "table" then plugin_name = plugin[1] end

  local name = string.gsub(plugin_name, '.*/' , '')
  name = filename(name)

  local config_cmd = function()
    pcall(require, ("config/plugins/%s"):format(name))
  end

  if type(plugin) == "table" then
    if plugin.config_first == true then
      config_cmd()
    else
      plugin.config = config_cmd
    end
    table.insert(List, plugin)
  else
    table.insert(List, { plugin, config = config_cmd })
  end
end

local clear = function()
  for k, _ in pairs(List) do
    List[k] = nil
  end
end

autogroup('Packer', function(autocmd)
  autocmd('BufEnter', {
    pattern = 'plugins.lua',
    callback = function()
      vim.keymap.set('n', 'go', open_github)
      vim.keymap.set('n', 'gf', open_config)
    end
  })
end)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

return {
  list = List,
  use = use,
  Use = Use,
  clear = clear
}

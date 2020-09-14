local pascal_case = require 'helpers'.pascal_case
local dirs = {
  app = true,
  adapters = true,
  concepts = true,
  controllers = true,
  helpers = true,
  jobs = true,
  lib = true,
  loyalties = true,
  mailers = true,
  models = true,
  workers = true
}

local function split_path()
  local result = {}

  local paths = vim.split(vim.fn.expand('%:r'), '/')

  for _, v in ipairs(paths) do
    if not dirs[v] then table.insert(result, v) end
  end

  return result
end


local function copy_class(s, e)
  local lines = vim.api.nvim_buf_get_lines(0, s - 1, e, false)
  local result = {}
  for _, v in ipairs(lines) do
    local str = v:match('class (.*)') or v:match('module (.*)')
    str = str:match('([^ ]*) ?<?')
    table.insert(result, str)
  end
  local class_name = table.concat(result, '::')
  vim.api.nvim_command('let @+="' .. class_name  .. '"')
end


local function open_loyalty()
  local path_parts = split_path()

  local tail = table.remove(path_parts, #path_parts)
  if not tail:match('controller') then return print("It's not a controller") end

  tail = tail:gsub('controller', 'loyalty')
  table.insert(path_parts, tail)
  vim.cmd('e app/loyalties/' ..  table.concat(path_parts, '/') .. '.rb')
end

function ruby_class()
  local paths = split_path()

  local controller = false
  local loyalty = false

  local postfix = ''
  local result = {}

  for _, v in ipairs(paths) do
    if v == 'controllers' then controller = true end
    if v == 'loyalties' then loyalty = true end

    if not dirs[v] then table.insert(result, pascal_case(v)) end
  end

  if controller then postfix = ' < ApplicationController' end
  if loyalty then postfix = ' < ApplicationLoyalty' end

  return table.concat(result, '::') .. postfix
end

local function cmd(name, str)
  vim.cmd(([[command! %s lua require("ruby_helpers").%s]]):format( name, str))
end

cmd('RubyOpenLoyalties', 'open_loyalty()')
cmd('-range RubyCopyClass', 'copy_class(<line1>, <line2>)')

return {
  open_loyalty = open_loyalty,
  copy_class = copy_class,
  ruby_class = ruby_class
}

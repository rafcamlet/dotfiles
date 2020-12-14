local pascal_case = require 'helpers'.pascal_case
local kebab_case = require 'helpers'.kebab_case
local close_all_bufs = require 'layout'.close_all_bufs

local dirs = {
  components = true,
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
  workers = true,
  views = true
}

local types = {
  components = true,
  controllers = true,
  models = true,
}


local function git_files()
  local result = {}
  local cmd =  "git status --porcelain --untracked-files=all"
  local list = vim.fn.systemlist(cmd)

  for _, v in ipairs(list) do
    table.insert(result, v:sub(4))
  end

  return result
end

local function identify_file(path)
  local result = {
    path = path,
    filename = vim.fn.fnamemodify(path, ':t'),
    ext = vim.fn.fnamemodify(path, ':e:e'),
    file =  vim.fn.fnamemodify(path, ':t:r:r')
  }

  path = vim.fn.fnamemodify(path, ':r:r')
  local pieces = {}

  local paths =  vim.split(path or vim.fn.expand('%:r'), '/')

  for _, v in ipairs(paths) do
    if not dirs[v] then table.insert(pieces, pascal_case(v)) end
    if types[v] then result.type = v end
  end

  result.class = table.concat(pieces, '::')

  if result.type == 'components' then
    if result.ext:match('haml') then result.type = 'component_views' end
    if result.ext:match('rb') then result.type = 'component_objs' end
    if result.ext:match('scss') then result.type = 'component_styles' end
  end

  return result
end

local function get_component()
  local files =  {}
  local result = {}

  for _, v in ipairs(git_files()) do
    table.insert(files, identify_file(v))
  end


  for _, v in ipairs(files) do
    if v.type == 'component_views' then result.view = v end
    if v.type == 'component_objs' then result.obj = v end
    if v.type == 'component_styles' then result.style = v end
  end

  if next(result) then return result end
end

local function open_component()
  local c = get_component()
  if not c then return end

  close_all_bufs()
  vim.cmd('e ' .. c.view.path)
  vim.cmd('botright vnew')
  vim.cmd('e ' .. c.style.path)
end

local function split_path(path)
  local result = {}

  local paths =  vim.split(path or vim.fn.expand('%:r'), '/')

  for _, v in ipairs(paths) do
    if not dirs[v] then table.insert(result, v) end
  end

  return result
end


local function copy_class()
  local y, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local result = {}

  for i = y, 1, -1 do
    local str = lines[i]:match('class (.*)') or lines[i]:match('module (.*)')
    if str then table.insert(result, 1, str:match('([^ ]*) ?<?')) else break end
  end
  for i = y+1, #lines do
    local str = lines[i]:match('class (.*)') or lines[i]:match('module (.*)')
    if str then table.insert(result, str:match('([^ ]*) ?<?')) else break end
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


local function haml_class()
  local str = split_path()
  str = table.concat(str, '-')
  str = vim.fn.fnamemodify(str, ':r:r')
  return kebab_case(str:gsub('_component', '')) .. '__'
end

local function open_style()
  local file = identify_file(vim.fn.expand('%'))
  local fragments = split_path(file.path)
  local tail = table.remove(fragments, #fragments)
  local result = {'app/javascript/styles/components', fragments, file.file:gsub('_component', '') .. '.scss'}
  result = table.concat(vim.tbl_flatten(result), '/')

  vim.cmd('vsplit ' .. result)
end

local function cmd(name, str)
  vim.cmd(([[command! %s lua require("ruby_helpers").%s]]):format( name, str))
end

cmd('RubyOpenLoyalties', 'open_loyalty()')
cmd('RubyCopyClass', 'copy_class()')
cmd('RubyComponent', 'open_component()')
cmd('RubyOpenStyle', 'open_style()')

return {
  split_path = split_path,
  open_loyalty = open_loyalty,
  copy_class = copy_class,
  ruby_class = ruby_class,
  haml_class = haml_class,
  open_component = open_component,
  identify_file = identify_file,
  open_style = open_style
}

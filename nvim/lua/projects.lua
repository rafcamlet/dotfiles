local api = vim.api
local json_path = vim.fn.stdpath('config') .. '/vim_config/json/projects.json'
local debug = true

local f = io.open(json_path, 'r')
local projects = vim.fn.json_decode(f:read('*all'))
f:close()

local function find_project(path)
  local project = false
  for i,v in ipairs(projects) do
    local match = path:find(v['root_path'])
    if match then project = v end
  end
  return project
end

local function setup()
  local project_env_ready = pcall(function() api.nvim_buf_get_var(0, 'project_env_ready') end ) or false
  local nomodifiable = not api.nvim_buf_get_option(0, 'modifiable')
  local fugitive = vim.fn.expand('%'):match('^fugitive://')

  if project_env_ready or nomodifiable or fugitive then
    if debug then
      print('project_env_ready : ' .. tostring(project_env_ready))
      print('nomodifiable : ' .. tostring(nomodifiable))
      print('fugitive : ' .. tostring(fugitive))
    end
    return
  end

  api.nvim_buf_set_var(0, 'project_env_ready', 1)

  local path = vim.fn.expand('%:p')
  if path:len() == 0 then path = vim.fn.getcwd() end

  print(find_project(path))
end

api.nvim_command('au BufEnter * lua require("projects").setup()')

return {
  setup = setup
}

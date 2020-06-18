local api = vim.api
local json_path = vim.fn.stdpath('config') .. '/vim_config/json/projects.json'
local debug = false

local f = io.open(json_path, 'r')
local projects = vim.fn.json_decode(f:read('*all'))
f:close()

local function find_project(path)
  for _, project in ipairs(projects) do
    if path:find(project.path) then return project end
  end
  return false
end

local function set_options(project)
  if not project.options then return end
  for k, v in pairs(project.options) do
    if debug then print(k, v) end
    vim.bo[k] = v
  end
end

local function set_fzf(project)
  if not project.fzf then return end
  for k, v in pairs(project.fzf) do
    vim.api.nvim_buf_set_keymap(0, 'n', '<space>o'..k, ":F '' "..v..'<cr>', {
        nowait = true, noremap = true, silent = true
      })
  end
end

local function setup()
  local project_env_ready = vim.b.project_env_ready or false
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

  vim.b.project_env_ready = true

  local path = vim.fn.expand('%:p')
  if path:len() == 0 then path = vim.fn.getcwd() end

  local project = find_project(path)
  if not project then return end

  print('Setup ' .. project.name)
  set_options(project)
  set_fzf(project)
end

local function open_project(name)
  for i, project in ipairs(projects) do
    if project.name == name then
      vim.api.nvim_command('cd ~/' .. project.path)
      vim.api.nvim_command('F')
      return
    end
  end
end

function open_project_complete(prefix, _, _)
  print(prefix)
  local results = {}
  for i, v in ipairs(projects) do
    print(v)
    if (v.name:upper()):find(prefix:upper()) then table.insert(results, v.name) end
  end
  return results
end

api.nvim_command('au BufEnter * lua require("projects").setup()')

api.nvim_command('command! -nargs=1 -complete=customlist,v:lua.open_project_complete OpenProject :lua require("projects").open_project(<f-args>)')

return {
  setup = setup,
  open_project = open_project,
  open_project_complete = open_project_complete
}

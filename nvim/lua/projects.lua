local projects = {
  debug = false,
  arr = {}
}

-- local function pprint(str)
--   if projects.debug then p(str) end
-- end

local function set_fzf(dict)
  for k, v in pairs(dict) do
    vim.api.nvim_buf_set_keymap(0, 'n', '<space>o'..k, ":F '' "..v..'<cr>', {
        nowait = true, noremap = true, silent = true
      })
  end
end

function find_project(path)
  for _, project in pairs(projects.arr) do
    if path:find(project.path) then return project end
  end
end

function projects.setup(opt)
  projects.debug = opt.debug
  vim.cmd('au BufEnter * lua require("projects").run()')
end

function projects.add(name, path, settings)
  projects.arr[name] = { name = name, settings = settings, path = path }
end

function projects.run()
  if vim.b.project_env_ready then return end
  if not vim.bo.modifiable then return end
  if vim.fn.expand('%'):match('^fugitive://') then return end

  vim.b.project_env_ready = true

  local path = vim.fn.expand('%:p')
  if path:len() == 0 then path = vim.fn.getcwd() end

  local project = find_project(path)
  if not project then return end

  print('Setup ' .. project.name)

  if project.settings.init then
    success, result = pcall(project.settings.init)
    if not success and projects.debug then print(result) end
  end

  if project.settings.options then
    for k, v in pairs(project.settings.options) do
      vim.bo[k] = v
    end
  end

  set_fzf(project.settings.fzf)
end

return projects

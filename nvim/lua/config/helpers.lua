function p(...)
  if #{...} > 1 then
    print(vim.inspect({...}))
  else
    print(vim.inspect(...))
  end
end

local function config_file(file)
  vim.api.nvim_command(('runtime config/%s.vim'):format(file))
end

return {
  config_file = config_file
}

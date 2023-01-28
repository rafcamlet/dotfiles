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

function prequire(name)
  local status, lib = pcall(require, name)
  if (status) then
    return lib
  else
    print_warn('Lib not loaded: ' .. name)
  end
  return nil
end

function p(...)
  if #{ ... } > 1 then
    print(vim.inspect({ ... }))
  else
    print(vim.inspect(...))
  end
end

function autogroup(name, fun)
  local group = vim.api.nvim_create_augroup(name, {})
  local context =  {
    autocmd = function(event, opts)
      if type(opts) == 'function' then opts = { callback = opts } end
      opts.group = group
      vim.api.nvim_create_autocmd(event, opts)
    end
  }
  setmetatable(context, { __index = _G})

  setfenv(fun, context)
  fun(context.autocmd)
end

function underscore(self)
  return self:gsub("([A-Z]+)([A-Z][a-z])", "%1_%2"):
              gsub("([a-z%d])([A-Z])", "%1_%2"):
              gsub("[ \t]", "_"):
              lower()
end

function camelize(self)
  return underscore(self):gsub("[ \t_%-](.)", string.upper)
end

function capitalize(self)
  return self:lower():gsub("^%l", string.upper)
end

function load_colorscheme(name)
  if vim.g.colorscheme_loaded ~= 1 then
    vim.g.colorscheme_loaded = 1
    vim.cmd('colorscheme ' .. name)
  end
end

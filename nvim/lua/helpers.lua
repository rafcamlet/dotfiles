-- vim: foldmethod=marker:foldlevel=0

function p(...)
  if #{...} > 1 then
    print(vim.inspect({...}))
  else
    print(vim.inspect(...))
  end
end

function pascal_case(str)
  local result = ''
  for x in str:gmatch('%w+') do
    result = result..x:sub(1,1):upper()..string.lower(x:sub(2))
  end
  return result
end

function camel_case(str)
  local result = pascal_case(str)
  return result:sub(1,1):lower()..result:sub(2)
end

function snake_case(s)
  return s:gsub('%f[^%l]%u','_%1'):gsub('%f[^%a]%d','_%1'):gsub('%f[^%d]%a','_%1'):gsub('(%u)(%u%l)','%1_%2'):lower()
end

function kebab_case(s)
  return ({s:gsub('_', '-')})[1]
end

function hl_color(group, fg, bg, gui)
  local cmd = ('highlight %s guifg=%s guibg=%s gui=%s'):format(
    group,
    fg or 'NONE',
    bg or 'NONE',
    gui or 'NONE'
  )
  vim.api.nvim_command(cmd)
  return cmd
end

local function after_init(name, cmd)
  vim.cmd('augroup ' .. name)
  vim.cmd('autocmd!')
  vim.cmd('autocmd User InitVimLoaded ' .. cmd)
  vim.cmd('augroup end')
end

return {
  p = p,
  pascal_case = pascal_case,
  camel_case = camel_case,
  snake_case = snake_case,
  kebab_case = kebab_case,
  hl_color = hl_color,
  after_init = after_init
}

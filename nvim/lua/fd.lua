local Job = require('plenary.job')

local function fd(opts)
  if opts.cwd then vim.cmd('cd ' .. opts.cwd) end
  local prefix = (vim.fn.getcwd()) .. ".*"

  local args = {
    '-ptf', prefix .. (opts.reg or '')
  }

  if opts.E then
    table.insert(args, '-E')
    table.insert(args, opts.E)
  end

  if opts.path then table.insert(args, opts.path) end

  Job:new({
    command = 'fd',
    args = args,
    cwd = opts.cwd,
    on_exit = function(j, _)
      local result = {}
      for _, v in ipairs(j:result()) do
        table.insert(result, { filename = v })
      end

      vim.schedule(function()
        vim.fn.setqflist(result)
      end)

      print('Results ' .. tostring(#result))
    end,
  }):sync()
end

return fd

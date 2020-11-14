local Boss = {
  address = 'localhost:3443'
}

local function sleep(n)
  os.execute("sleep " .. tonumber(n))
end

function Boss.nvim(str, ...)
  return vim.api.nvim_call_function('rpcrequest', {Boss.connection, "nvim_" .. str, unpack({...})})
end

function Boss.cmd(str)
  Boss.nvim('command', str)
end

function Boss.setup()
  local arr = {
    'tmux kill-pane -a -t 0',
    'tmux split-window -h -d -p 40',
    ('tmux send-keys -t 1 "nvim --listen %s" C-m'):format(Boss.address)
  }
  for _, v in ipairs(arr) do os.execute(v) end

  sleep(1)

  Boss.connection = vim.api.nvim_call_function(
    'sockconnect',
    {'tcp', Boss.address, {rpc = true}}
  )
end

function Boss.finish()
  vim.api.nvim_call_function('chanclose', {Boss.connection})
end

function Boss.run(fun)
  Boss.setup()
  setfenv(fun, Boss)
  fun(Boss)
  Boss.finish()
end

return Boss

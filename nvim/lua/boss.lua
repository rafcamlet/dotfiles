local Boss = {
  address = 'localhost:3443'
}

function Boss.sleep(n)
  os.execute("sleep " .. tonumber(n))
end

function Boss.nvim(str, ...)
  return vim.api.nvim_call_function('rpcrequest', {Boss.connection, "nvim_" .. str, unpack({...})})
end

function Boss.cmd(str)
  Boss.nvim('command', str)
end

function Boss.split_keys(str)
  local flag = false
  local result = {}
  local buf

  for c in str:gmatch"." do
    if c == '<' then
      buf = '<'
      flag = true
    elseif c == '>' then
      table.insert(result, buf .. '>')
      flag = false
    elseif flag then
      buf = buf .. c
    else
      table.insert(result, c)
    end
  end

  return result
end

function Boss.input(str)
  Boss.nvim('input', str)
end

function Boss.typein(str)
  for _, v in ipairs(Boss.split_keys(str)) do
    Boss.input(v)
    Boss.sleep(0.1)
  end
end

function Boss.lines(tbl, start, finish)
  if type(tbl) == 'string' then tbl = vim.split(tbl, "\n") end
  Boss.nvim('buf_set_lines', 0, start or 0, finish or 0, false, tbl)
end

function Boss.setup()
  local arr = {
    'tmux kill-pane -a -t 0',
    'tmux split-window -h -d -p 40',
    ('tmux send-keys -t 1 "nvim --listen %s" C-m'):format(Boss.address)
  }
  for _, v in ipairs(arr) do os.execute(v) end

  Boss.sleep(1)

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

function Boss.eval(str)
  local f, err = loadstring(str)
  if not f then return print(err) end
  Boss.run(f)
end

-- aliases
Boss.c = Boss.cmd
Boss.i = Boss.input
Boss.l = Boss.lines
Boss.t = Boss.typein

return Boss

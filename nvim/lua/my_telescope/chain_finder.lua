local make_entry = require "telescope.make_entry"

local async_job = require "telescope._"

local LinesPipe = require("telescope._").LinesPipe
local WritePipe = require 'my_telescope.write_pipe'

return function(opts)
  opts = opts or {}

  local tbl = opts.chains
  local entry_maker = opts.entry_maker or make_entry.gen_from_string(opts)
  local cwd = opts.cwd
  local results = {}
  local job

  local call = function(_, prompt, process_result, process_complete)
    for i, v in ipairs(tbl) do
      local should_run = false

      if type(v.should_run) == 'function' then
        should_run = v.should_run(prompt)
      else
        should_run = should_run
      end

      if should_run then
        local args = v.get_cmd(prompt)
        local stdout = LinesPipe()
        local stdin = WritePipe()

        local job_opts = {
          command = table.remove(args, 1),
          args = args,
          cwd = cwd,
          stdout = stdout,
          stdin = stdin
        }

        if job then
          job:close(true)
        end

        job = async_job.spawn(job_opts)

        if i ~= 1 then
          stdin:write(table.concat(results, "\n"))
          stdin:close()
        end

        results = {}
        for line in stdout:iter(true) do
          table.insert(results, line)
        end
        job:close()
      end
    end

    for _, result in ipairs(results) do
      process_result(entry_maker(result))
    end
    process_complete()
  end


  return setmetatable({
    close = function() if job then job:close(true) end end,
  }, {
    __call = call
  })
end

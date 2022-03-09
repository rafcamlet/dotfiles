local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local sorters = require "telescope.sorters"
local previewers = require "telescope.previewers"
local conf = require("telescope.config").values

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local async = require "plenary.async"
local async_job = require "telescope._"
local LinesPipe = require("telescope._").LinesPipe

local make_entry = require "telescope.make_entry"
local log = require "telescope.log"


local channel = require("plenary.async").control.channel
local Object = require "plenary.class"
local BasePipe = Object:extend()

function BasePipe:new()
  self.eof_tx, self.eof_rx = channel.oneshot()
end

function BasePipe:close(force)
  if force == nil then
    force = true
  end

  assert(self.handle, "Must have a pipe to close. Otherwise it's weird!")

  if self.handle:is_closing() then
    return
  end

  -- If we're not forcing the stop, allow waiting for eof
  -- This ensures that we don't end up with weird race conditions
  if not force then
    self.eof_rx()
  end

  self.handle:read_stop()
  if not self.handle:is_closing() then
    self.handle:close()
  end

  self._closed = true
end

local WritePipe = BasePipe:extend()

function WritePipe:new()
  WritePipe.super.new(self)
  self.handle = vim.loop.new_pipe()
end

function WritePipe:write(data)
  self.handle:write(data)
end

local function base_finder(opts)
  local entry_maker = opts.entry_maker or make_entry.gen_from_string()

  local stdout = nil
  local results = {}
  local num_results = 0

  local callable = function(_, prompt, process_result, process_complete)

    if string.len(prompt) < 3 then return end

    local rg_prompt, fzy_prompt

    if string.find(prompt, ";") then
      rg_prompt = string.sub(prompt, 1, string.find(prompt, ";") - 1)
      fzy_prompt = string.sub(prompt, string.find(prompt, ";") + 1, #prompt)
    else
      rg_prompt = prompt
      fzy_prompt = ""
    end

    local args = vim.tbl_flatten({ conf.vimgrep_arguments, '--max-columns', '500', rg_prompt, "." })

    local cmds = {
      command = table.remove(args, 1),
      args = args,
    }

    if job then
      job:close(true)
      results = {}
    end

    if jober then jober:close(true) end

    local job_opts = cmds

    stdout = LinesPipe()
    job = async_job.spawn {
      command = job_opts.command,
      args = job_opts.args,
      cwd = job_opts.cwd or opts.cwd,
      stdout = stdout,
    }

    if not tostring(prompt):find(";") then
      for v in stdout:iter(true) do
        process_result(entry_maker(v))
      end
      process_complete()
      return
    end


    jober_out = LinesPipe()
    jober_in = WritePipe()

    jober = async_job.spawn {
      command = 'fzy',
      args = { '-e', fzy_prompt },
      cwd = job_opts.cwd or opts.cwd,
      stdout = jober_out,
      stdin =  jober_in
    }


    for line in stdout:iter(true) do
      table.insert(results, line)
    end

    jober_in:write(table.concat(results, "\n"))
    jober_in:close()

    for v in jober_out:iter(true) do
      num_results = num_results + 1
      v = entry_maker(v)
      process_result(v)
    end


    process_complete()
  end

  return setmetatable({
    close = function()
      if job then
        job:close(true)
      end
    end,
  }, {
    __call = callable,
  })
end

local function live_grep(opts)
  opts = opts or {}
  opts.entry_maker = make_entry.gen_from_vimgrep(opts)

  pickers.new(opts, {
    prompt_title = "fd",
    finder = base_finder(opts),
    previewer = conf.grep_previewer(opts),
    sorter = sorters.highlighter_only(opts),
  }):find()
end

return live_grep

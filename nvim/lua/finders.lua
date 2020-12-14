local Job = require('plenary.job')
local conf = require('telescope.config').values
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local previewers = require('telescope.previewers')
local sorters = require('telescope.sorters')
local make_entry = require('telescope.make_entry')

local minimum_grep_characters = 0
local use_highlighter = true

local function find(opts)
  opts = opts or {}

  local sfs = finders._new {
    fn_command = function(_, prompt)
      if #prompt < minimum_grep_characters then
        return nil
      end

      if opts.cwd then vim.cmd('cd ' .. opts.cwd) end
      local prefix = (vim.fn.getcwd()) .. ".*"

      local args = {
        '-ptf', prefix .. (opts.pattern or '')
      }

      if opts.path then table.insert(args, opts.path) end

      return {
        writer = Job:new {
          command = 'fd',
          args = args
        },
        command = 'fzy',
        args = {'-e', prompt},
      }
    end,

    entry_maker = make_entry.gen_from_file(opts),
  }

  pickers.new(opts, {
    prompt_title = 'fd + fzy',
    finder = sfs,
    previewer = previewers.vimgrep.new(opts),
    sorter = use_highlighter and sorters.highlighter_only(opts),
  }):find()
end

local function grep(opts)
  opts = opts or {}

  local live_grepper = finders._new {
    fn_command = function(_, prompt)
      if #prompt < minimum_grep_characters then
        return nil
      end

      local rg_prompt, fzf_prompt
      if string.find(prompt, ";") then
        rg_prompt  = string.sub(prompt, 1, string.find(prompt, ";") - 1)
        fzf_prompt = string.sub(prompt, string.find(prompt, ";") + 1, #prompt)
      else
        rg_prompt = prompt
        fzf_prompt = ""
      end

      local rg_args = vim.tbl_flatten { conf.vimgrep_arguments, rg_prompt, "." }
      table.remove(rg_args, 1)

      return {
        writer = Job:new {
          command = 'rg',
          args = rg_args,
        },
        command = 'fzy',
        args = {'-e', fzf_prompt},
      }
    end,

    entry_maker = make_entry.gen_from_vimgrep(opts),
  }

  pickers.new(opts, {
    prompt_title = 'rg + fzy',
    finder = live_grepper,
    previewer = previewers.vimgrep.new(opts),
    sorter = use_highlighter and sorters.highlighter_only(opts),
  }):find()
end

return {
  find = find,
  grep = grep
}

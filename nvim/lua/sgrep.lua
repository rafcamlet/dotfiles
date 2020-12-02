local Job = require('plenary.job')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local previewers = require('telescope.previewers')
local sorters = require('telescope.sorters')
local make_entry = require('telescope.make_entry')

local minimum_grep_characters = 2
local separator = ";"
local use_highlighter = true

local function super_file_search(opts)
  opts = opts or {}

  local sfs = finders._new {
    fn_command = function(_, prompt)
      if #prompt < minimum_grep_characters then
        return nil
      end

      local fd_prompt, fzf_prompt

      if string.find(prompt, separator) then
        fd_prompt = string.sub(prompt, 1, string.find(prompt, separator) - 1)
        fzf_prompt = string.sub(prompt, string.find(prompt, separator) + 1, #prompt)
      else
        fd_prompt = prompt
        fzf_prompt = ""
      end

      return {
        writer = Job:new {
          command = 'fd',
          args = {'-ptf', fd_prompt},
        },

        command = 'fzf',
        args = {'--filter', fzf_prompt},
      }
    end,

    entry_maker = make_entry.gen_from_file(opts),
  }

  pickers.new(opts, {
    prompt_title = 'Super File Search',
    finder = sfs,
    previewer = previewers.vimgrep.new(opts),
    sorter = use_highlighter and sorters.highlighter_only(opts),
  }):find()
end

return super_file_search

local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local previewers = require('telescope.previewers')
local conf = require('telescope.config').values

local function porcelain(opts)

  opts.entry_maker = function(line)
    local filename = line:sub(4)

    return {
      valid = true,
      ordinal = line,
      display = line,
      filename = filename
    }
  end

  pickers.new(opts, {
    prompt_title = 'Git Status Porcelain',
    finder = finders.new_oneshot_job(
      { "git", "status", "--porcelain", "--untracked-files=all"},
      opts
    ),
    previewer = previewers.cat.new(opts),
    sorter = conf.file_sorter(opts),
  }):find()
end

return porcelain

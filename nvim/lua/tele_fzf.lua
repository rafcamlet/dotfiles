local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local pickers = require("telescope.pickers")
local sorters = require("telescope.sorters")
local previewers = require("telescope.previewers")

local Job = require("plenary.job")

local function tele_fzf(opts)
  pickers.new(
  {
    prompt = "Piped FZF",
    finder = finders._new {
      fn_command = function(_, prompt)
        return {
          command = "fzf",
          args = {"--filter", prompt or ""},
          writer = Job:new {
            command = "fd",
            args = { "-tf" },
            cwd =  opts.cwd or vim.fn.getcwd(),
            enable_handlers = false,
          }
        }
      end,
      entry_maker = make_entry.gen_from_file(),
      sorter = sorters.get_fzy_sorter(),
    }
  },
  {
    previewer = previewers.cat.new({
      entry_maker = make_entry.gen_from_file()
    })
  }
  ):find()
end

return tele_fzf

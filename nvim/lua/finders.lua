local Job = require('plenary.job')

local conf = require('telescope.config').values
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local previewers = require('telescope.previewers')
local sorters = require('telescope.sorters')
local make_entry = require('telescope.make_entry')
local actions = require('telescope.actions')

local minimum_grep_characters = 0
local use_highlighter = true

local function find(opts)
  opts = opts or {}

  local sfs = finders._new {
    fn_command = function(_, prompt)
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
    -- previewer = previewers.cat.new(opts),
    previewer = require'telescope.previewers'.cat.new(opts),
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


local function wins(opts)
  if not opts then opts = {} end
  local results = {}

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local name = vim.api.nvim_buf_get_name(buf)
    if name and name ~= '' then table.insert(results, {win, name}) end
  end

  pickers.new(opts, {
    prompt_title = 'Wins',
    finder = finders.new_table{
      results = results,
      entry_maker = function(line)
        return {
          ordinal = line[2],
          value = line[1],
          display = line[2],
          path = line[2] or ''
        }
      end
    },
    sorter = conf.generic_sorter(opts),
    previewer = previewers.cat.new(opts),
    attach_mappings = function(prompt_bufnr)
      actions._goto_file_selection:replace(function()
        local selection = actions.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.api.nvim_set_current_win(selection.value);
      end)
      return true
    end
  }):find()
end

local function porcelain(opts)
  if not opts then opts = {} end

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
    sorter = sorters.get_fzy_sorter(),
  }):find()
end

return {
  find = find,
  grep = grep,
  wins = wins,
  porcelain = porcelain
}

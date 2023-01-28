local pickers = require "telescope.pickers"
local sorters = require "telescope.sorters"
local conf = require("telescope.config").values
local make_entry = require "telescope.make_entry"

local chain_finder = require 'my_telescope.chain_finder'

local function live_grep_buffers(opts)
  opts = opts or {}

  opts.entry_maker = make_entry.gen_from_vimgrep(opts)
  opts.chains = {
    {
      should_run = function(prompt)
        if string.len(prompt) > 2 then return true end
      end,
      get_cmd = function(prompt)
        local query

        if not string.find(prompt, ";.") then
          if prompt:sub(-1) == ';' then prompt = prompt:sub(1, #prompt - 1) end
          query = prompt
        else
          query = string.sub(prompt, 1, string.find(prompt, ";") - 1)
        end

        local buf_tbl = {}
        local bufs_list = vim.api.nvim_list_bufs()

        for _, v in ipairs(bufs_list) do
          if  vim.api.nvim_buf_is_loaded(v) then
            local name = vim.api.nvim_buf_get_name(v)
            if name ~= '' then
              table.insert(buf_tbl, name)
            end
          end
        end

        return vim.tbl_flatten({
          conf.vimgrep_arguments, '--max-columns', '500', query, buf_tbl
        })
      end
    }, {
      should_run = function(prompt)
        return string.find(prompt, ";.")
      end,
      get_cmd = function(prompt)
        query = string.sub(prompt, string.find(prompt, ";") + 1, #prompt)
        return { 'fzy', '-e', query }
      end
    }
  }

  pickers.new(opts, {
    prompt_title = "buffers: rg + fzy",
    finder = chain_finder(opts),
    previewer = conf.grep_previewer(opts),
    sorter = sorters.highlighter_only(opts),
  }):find()
end

return live_grep_buffers

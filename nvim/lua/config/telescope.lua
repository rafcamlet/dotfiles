local previewers = require('telescope.previewers')
local putils = require('telescope.previewers.utils')
local pfiletype = require('plenary.filetype')
local new_maker = function(filepath, bufnr, bufname, use_ft_detect, callback)
  if use_ft_detect == nil then use_ft_detect = true end

  if use_ft_detect then
    previewers.buffer_previewer_maker(filepath, bufnr, bufname, false, callback)
    local ft = pfiletype.detect(filepath)
    putils.regex_highlighter(bufnr, ft)
  else
    previewers.buffer_previewer_maker(filepath, bufnr, bufname, use_ft_detect, callback)
  end
end

local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    buffer_previewer_maker = new_maker,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous
      }
    },
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`
  }
}

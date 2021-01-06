local vimp = require('vimp')

vimp.map_command('Bundle', function()
  require'finders'.find{
    cwd = "~/projects/dotfiles/nvim/bundle/",
    pattern = '(lua|vim)$'
  }
end)

local finders = require'finders'
vimp.nnoremap('<space>ok', require'sfs')
vimp.nnoremap({'override'}, '<space>oo', finders.find)
vimp.nnoremap({'override'}, '<space>ow', finders.wins)
vimp.nnoremap({'override'}, '<space>of', finders.grep)
vimp.nnoremap({'override'}, '<space>op', finders.porcelain)
vimp.nnoremap('<space>o<c-f>', require('telescope.builtin').current_buffer_fuzzy_find)

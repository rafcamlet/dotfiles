require('tabline').setup()
require('jumper').setup()


local projects = require('projects')

projects.setup({})
projects.add('Customease', 'projects/customease', {
    init = function()
      vim.cmd [[nnoremap <buffer> <space>ov :F '.*\.vue$' app/javascript<cr>]]
    end,
    options = {
      path = ".,app/**,app/javascript,,",
      suffixesadd = ".js,.vue",
      includeexpr = "Snakecase(v:fname)",
      include = "import "
    },
    fzf = {
      o = "app/",
      a = "app/concepts",
      j = "app/javascript"
    }
  })


local hl_color = require('helpers').hl_color
hl_color('QuickFixLine', 11)
hl_color('MatchTag', nil, 53)

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

projects.add('Milabo', 'projects/milabo', {
  init = function()
    vim.cmd [[nnoremap <buffer> <space>os <cmd>lua require'finders'.find{ pattern = 'scss$', path="app/javascript/styles" }<cr> ]]
    vim.cmd [[nnoremap <buffer> <space>ov <cmd>lua require'finders'.find{ pattern = 'html.haml$' }<cr> ]]
    vim.cmd [[nnoremap <buffer> <space>oj :F '.*\.js$' app/javascript<cr>]]
  end,
  options = {
    makeprg = [[{stylelint app/javascript/styles -f unix; eslint app/javascript -f unix ; rg --vimgrep "(<<<<<<<\|=======\|>>>>>>>\|console.log\|binding.pry\|jard)" app/}]],
    path = ".,app/**,app/javascript,,",
    suffixesadd = ".js,.vue",
    includeexpr = "Snakecase(v:fname)",
    include = "import "
  },
  fzf = { }
})


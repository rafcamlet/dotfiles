require('pounce').setup {
  accept_keys = "JKLHNMUIOP",
  debug = false,
}

vim.cmd "nmap s <cmd>Pounce<CR>"
vim.cmd "vmap s <cmd>Pounce<CR>"
vim.cmd "omap gs <cmd>Pounce<CR>"

require("neotest").setup({
  icons = {
    running = "•",
  },
  adapters = {
    require('neotest-rspec'),
    -- require("neotest-plenary"),
  },
})

vim.cmd [[command! Neotest lua require('neotest').summary.open()]]
vim.cmd [[command! NeotestRun lua require('neotest').run.run()]]

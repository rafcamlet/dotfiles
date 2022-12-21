require("neotest").setup({
  icons = {
    running = "•",
    child_indent = "│",
    child_prefix = "├",
    collapsed = "─",
    expanded = "╮",
    failed = "",
    final_child_indent = " ",
    final_child_prefix = "╰",
    non_collapsible = "─",
    passed = "",
    running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
    skipped = "罹",
    unknown = ""
  },
  adapters = {
    require('neotest-rspec'),
    -- require("neotest-plenary"),
  },
})

vim.cmd [[command! Neotest lua require('neotest').summary.open()]]
vim.cmd [[command! NeotestRun lua require('neotest').run.run()]]

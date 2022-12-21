require('nvim-surround').setup({
  keymaps = { -- vim-surround style keymaps
    insert = "<C-g>s",
    insert_line = "<C-g>S",
    normal = "ys",
    normal_cur = "yss",
    normal_line = "yS",
    normal_cur_line = "ySS",
    visual = "S",
    visual_line = "gS",
    delete = "ds",
    change = "cs",
  },
  surrounds = {
  },
  highlight = { -- Highlight before inserting/changing surrounds
    duration = 0,
  }
})

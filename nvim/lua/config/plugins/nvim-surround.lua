require('nvim-surround').setup({
    keymaps = { -- vim-surround style keymaps
        insert = "ys",
        insert_line = "yss",
        visual = "S",
        delete = "ds",
        change = "cs",
    },
    surrounds = {
    },
    highlight = { -- Highlight before inserting/changing surrounds
        duration = 0,
    }
})

require("formatter").setup({
  logging = false,
  log_level = vim.log.levels.INFO,
  filetype = {
    ruby = {
      require('formatter.filetypes.ruby').rubocop
    },
    sql = {
      function()
        local formaters = {
          { exe = 'pg_format', args = { '-', '-W', '5' }, stdin = true },
          { exe = "sqlformat", args = { "-", '-k', 'upper', '-a' }, stdin = true }
        }
        print('Select formatter (1) pg_format, (2) sqlformat:')
        local nr = vim.fn.nr2char(vim.fn.getchar())
        return formaters[tonumber(nr)]
      end
    },
    lua = {
      function()
        return { exe = "stylua", args = { "-" }, stdin = true }
      end,
    },
  },
})

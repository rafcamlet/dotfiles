-- vim.cmd [[highlight IndentOne guifg=#BF616A guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentTwo guifg=#D08770 guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentThree guifg=#EBCB8B guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentFour guifg=#A3BE8C guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentFive guifg=#5E81AC guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentSix guifg=#88C0D0 guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentSeven guifg=#B48EAD guibg=NONE gui=nocombine]]

vim.schedule(function()
  vim.cmd [[highlight IndentOne guifg=#63363A guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentTwo guifg=#5C443D guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentThree guifg=#5C523D guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentFour guifg=#4B5C3D guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentFive guifg=#3D4B5C guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentSix guifg=#3D555C guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentSeven guifg=#5C3D56 guibg=NONE gui=nocombine]]
end)

require('indent_blankline').setup {
  indent = false,
  show_first_indent_level = true,
  char_highlight_list = {
    "IndentOne", "IndentTwo", "IndentThree", "IndentFour", "IndentFive",
    "IndentSix", "IndentSeven"
  },
  filetype_exclude = {
    "startify", "dashboard", "dotooagenda", "log", "fugitive", "gitcommit",
    "packer", "vimwiki", "markdown", "json", "txt", "vista", "help",
    "todoist", "NvimTree", "peekaboo", "git", "TelescopePrompt", "undotree",
    "flutterToolsOutline", "" -- for all buffers without a file type
  },
  buftype_exclude = {"terminal", "nofile"},
  show_current_context = false,
  show_current_context_start = false,
}

vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')

local luasnip = prequire('luasnip')
local cmp = prequire("cmp")


--[[ local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end ]]

--[[ local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end ]]

--[[ _G.tab_complete = function()
  if cmp and cmp.visible() then
    cmp.select_next_item()
  elseif luasnip and luasnip.expand_or_jumpable() then
    return t("<Plug>luasnip-expand-or-jump")
  elseif check_back_space() then
    return t "<Tab>"
  else
    cmp.complete()
  end
  return ""
end
_G.s_tab_complete = function()
  if cmp and cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip and luasnip.jumpable(-1) then
    return t("<Plug>luasnip-jump-prev")
  else
    return t "<S-Tab>"
  end
  return ""
end ]]

vim.cmd [[imap <c-j> <Plug>luasnip-expand-or-jump]]
vim.cmd [[imap <c-k> <Plug>luasnip-jump-prev]]

--[[ vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true}) ]]
vim.api.nvim_set_keymap("i", "<C-f>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-f>", "<Plug>luasnip-next-choice", {})


local ls = require"luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local events = require("luasnip.util.events") 

ls.config.set_config({
  region_check_events = "InsertEnter,CursorHold",
  delete_check_events = "TextChanged,InsertLeave",
})

ls.snippets = {
  ruby = {
    s('pry', t'binding.pry'),
  },
  lua = {
    s('for', {
      t'for ',
      c(1, {
        sn(nil, {t'i, v in ipairs(', i(1), t')'}),
        sn(nil, {t'k, v in pairs(', i(1), t')'}),
      }),
      t{' do', '\t'},
      i(0),
      t{'', 'end'}
    }),
  },
  all = {
    s("asdf", {
      t({"Wow! "}), i(1,"test"), t({"", ""}),
      t("Text!"), i(2),
      t('kurwa'), i(0)
    }),
  s({trig = "b(%d)", regTrig = true},
    	f(function(args, snip) return
    		"Captured Text: " .. snip.captures[1] .. "." end, {})
    )
  }
}

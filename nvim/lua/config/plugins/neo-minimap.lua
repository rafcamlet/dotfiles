local nm = require("neo-minimap") -- for shorthand use later

local win_opts  = {
  winhl = "FloatBorder:Normal,Normal:",
}

local function set_minimap(lang, query)
  nm.set("zi", lang, {
    win_opts = win_opts,
    disable_indentaion = true,
    query = query
  })
end

set_minimap('lua', [[
;; query
((for_statement) @cap) ;; matches for loops
((function_call (dot_index_expression) @field (#eq? @field "vim.keymap.set")) @cap) ;; matches vim.keymap.set
((function_declaration) @cap) ;; matches function declarations
]])

-- Lua
set_minimap('ruby', "((method) @cap)")

-- -- Lua
-- nm.set("zi", "lua", { -- press `zi` to open the minimap, in `lua` files
--   win_opts = win_opts,
--   query = [[
-- ;; query
-- ((for_statement) @cap) ;; matches for loops
-- ((function_call (dot_index_expression) @field (#eq? @field "vim.keymap.set")) @cap) ;; matches vim.keymap.set
-- ((function_declaration) @cap) ;; matches function declarations
--   ]],
--   regex = { [[\.insert]] }, -- 1 vim regex, matches lines with `.insert` pattern
--   search_patterns = {
--     { "function", "<C-j>", true }, -- jump to the next 'function' (Vim pattern)
--     { "function", "<C-k>", false }, -- jump to the previous 'function' (Vim pattern)
--     { "keymap", "<A-j>", true }, -- jump to the next 'keymap' (Vim pattern)
--     { "keymap", "<A-k>", false }, -- jump to the previous 'keymap' (Vim pattern)
--   },
-- })

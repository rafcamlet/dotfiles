local ls = require"luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local rep = require('luasnip.extras').rep
local fmta = require("luasnip.extras.fmt").fmta
local events = require("luasnip.util.events")


local function lang(name)
  return setmetatable({}, {
    __newindex = function (_, key, val)
      if type(val) == 'string' then
        val = val:gsub('\n$', '')
        ls.add_snippets(name, {ls.parser.parse_snippet(key, val)})
        return
      end
      ls.add_snippets(name, {s(key, val)})
    end
  })
end

local all = lang('all')
local haml = lang('haml')
local ruby = lang('ruby')
local eruby = lang('eruby')
local lua  = lang('lua')
local slim  = lang('slim')

haml.pry = 'binding.pry'
slim.pry = 'binding.pry'
eruby.pry = 'binding.pry'
ruby.pry = 'require "pry"; binding.pry'
ruby.class = 'class $1\n  $0\nend'

lua.class = [[
---@class $1
${1:ClassName} = {}
$1.__index = $1

---@param opts? table
---@return $1
function $1:new(opts)
  opts = opts or {}
  return setmetatable(opts, self)
end
]]

local function for_value(args)
  local str = args[1][1]
  if not str then return 'v' end

  if str:match('%.') then
    local tbl = vim.split(str, '.', true)
    str = tbl[#tbl]
  end

  if (str):match('s$') then return str:sub(1, #str - 1) end
  return 'v'
end

lua['for'] = fmta([[
for <> do
  <>
end
]], {
  c(1, {
    sn(nil, {t'i, ', f(for_value, 1), t' in ipairs(', i(1), t')'}),
    sn(nil, {t'k, ', f(for_value, 1), t' in pairs(', i(1), t')'}),
  }),
  i(0)
})

lua.req = fmta("local <> = require('<>')", {i(1), rep(1)})

lua.f = "function($1) $0 end"

lua.lf = [[
local function $1($2)
  $0
end
]]

lua.m = "$1 = $1"
lua.l = 'local '

all.lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et elit volutpat, pretium nulla vel, suscipit neque. Etiam id ipsum rutrum, gravida erat ac, bibendum nisl. Proin ultricies lectus nec iaculis molestie. Duis aliquam risus et nulla consectetur, nec accumsan leo vestibulum. Etiam dapibus luctus velit id facilisis. Fusce sed risus purus. Proin nec gravida mauris. Nam fringilla quam et elit aliquam ullamcorper.'

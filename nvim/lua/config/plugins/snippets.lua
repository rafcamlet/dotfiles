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

ls.snippets = {}

local function lang(name)
  if not ls.snippets[name] then ls.snippets[name] = {} end
  return setmetatable({}, {
    __index = function(self, key)
      return setmetatable({}, {
        __index = function(self2, key2)
          local f = ({
            s = ls.snippet,
            sn = ls.snippet_node,
            isn = ls.indent_snippet_node,
            t = ls.text_node,
            i = ls.insert_node,
            f = ls.function_node,
            c = ls.choice_node,
            d = ls.dynamic_node,
            fmta = require("luasnip.extras.fmt").fmta,
            events = require("luasnip.util.events")
          })[key2]
          return function(...)
            table.insert(ls.snippets[name], s(key, f(...)))
          end
        end
      })
    end,
    __newindex = function (_, key, val)
      if type(val) == 'string' then
        val = val:gsub('\n$', '')
        table.insert(ls.snippets[name], ls.parser.parse_snippet(key, val))
        return
      end
      table.insert(ls.snippets[name], s(key, val))
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

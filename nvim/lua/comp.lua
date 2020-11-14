local matching = require'completion.matching'.matching

local function dict(name, items)
  return function(prefix)
    local result = {}

    for _, item in ipairs(items) do
      matching(result, prefix, {
        word = item,
        -- kind = 'd',
        menu = name,
        info = nil,
        -- score = score,
        icase = 1,
        dup = 0,
        empty = 0
      })
    end

    return result
  end
end


-- rg --color=never --no-filename --no-line-number -e '^.*?class +([a-zA-Z0-9:]*) ?.*$' app/components -r '$1' | sed '/^$/d'

local function components(prefix)
  local result = {}
  cmd = [[rg --color=never --no-filename --no-line-number -e '^.*?class +([a-zA-Z0-9:]*) ?.*$' app/components -r '$1' | sed '/^$/d']]
  raw_results = vim.fn.systemlist(cmd)

  for _, item in ipairs(raw_results) do
    matching(result, prefix, {
      word = item,
      -- kind = 'd',
      menu = 'com',
      info = nil,
      -- score = score,
      icase = 1,
      dup = 0,
      empty = 0
    })
  end

  return result
end


return {
  dict = dict,
  components = components
}

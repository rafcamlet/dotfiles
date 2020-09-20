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

return {
  dict = dict
}

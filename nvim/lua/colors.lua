local hl_color = require('helpers').hl_color
local after_init = require('helpers').after_init

after_init('unload_colors', 'lua package.loaded.colors = nil')

local Colors = {}

Colors.paradiso = 4
Colors.tapestry = 5

Colors.keyword = 103
Colors.variable = 103
Colors.property = 138
Colors.fun = 12

-- Colors.gray1 = '#060606'
-- Colors.gray2 = '#0e0e0e'
-- Colors.gray3 = '#161616'
-- Colors.gray4 = '#1e1e1e'
-- Colors.gray5 = '#262626'
-- Colors.gray6 = '#2e2e2e'
-- Colors.gray7 = '#363636'
-- Colors.gray8 = '#3e3e3e'
-- Colors.gray9 = '#464646'
-- Colors.gray10 = '#4e4e4e'
-- Colors.gray11 = '#565656'
-- Colors.gray12 = '#5e5e5e'
-- Colors.gray13 = '#666666'
-- Colors.gray14 = '#6e6e6e'
-- Colors.gray15 = '#767676'
-- Colors.gray16 = '#7e7e7e'
-- Colors.gray17 = '#868686'
-- Colors.gray18 = '#8e8e8e'
-- Colors.gray19 = '#969696'
-- Colors.gray20 = '#9e9e9e'
-- Colors.gray21 = '#a6a6a6'
-- Colors.gray22 = '#aeaeae'
-- Colors.gray23 = '#b6b6b6'
-- Colors.gray24 = '#bebebe'
-- Colors.gray25 = '#c6c6c6'

-- Colors.brown = '#8c6c4c'
-- Colors.paradiso = '#458588'
-- Colors.tapestry = '#B16286'
-- Colors.cancan = '#D3869B'
-- Colors.chetwode_blue = '#6C6CAC'
-- Colors.trendy_pink = '#8C6C8C'
--
-- Colors.background = Colors.gray5


Colors.gray1 = 231
Colors.gray2 = 232
Colors.gray3 = 233
Colors.gray4 = 234
Colors.gray5 = 235
Colors.gray6 = 236
Colors.gray7 = 237
Colors.gray8 = 238
Colors.gray9 = 239
Colors.gray10 = 240
Colors.gray11 = 241
Colors.gray12 = 242
Colors.gray13 = 243
Colors.gray14 = 244
Colors.gray15 = 245
Colors.gray16 = 246
Colors.gray17 = 247
Colors.gray18 = 248
Colors.gray19 = 249
Colors.gray20 = 250
Colors.gray21 = 251
Colors.gray22 = 252
Colors.gray23 = 253
Colors.gray24 = 254

Colors.brown = 137

Colors.background = Colors.gray5

hl_color('Normal', Colors.brown, Colors.background)
hl_color('YankHighlight', nil, Colors.gray8)

hl_color('TelescopeBorder', Colors.paradiso)
hl_color('TelescopeMatching', 1)

return Colors

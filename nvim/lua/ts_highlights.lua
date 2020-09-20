package.loaded.ts_highlights = nil

local hl_color = require('helpers').hl_color
local Colors = require('colors')

hl_color('TSVariable', Colors.variable)
hl_color('TSKeyword', Colors.keyword )
hl_color('TSKeywordFunction', Colors.keyword )
hl_color('TSProperty', Colors.property )

hl_color('TSBoolean', Colors.tapestry )
hl_color('TSOperator', Colors.paradiso )
hl_color('TSFunction', Colors.fun )

--  hl_color('TSError', 0)
--
--  hl_color('TSPunctDelimiter', 0)
--  hl_color('TSPunctBracket', 0)
--  hl_color('TSPunctSpecial', 0)
--
--  hl_color('TSConstant', 0)
--  hl_color('TSConstBuiltin', 0)
--  hl_color('TSConstMacro', 0)
--  hl_color('TSString', 0)
--  hl_color('TSStringRegex', 0)
--  hl_color('TSStringEscape', 0)
--  hl_color('TSCharacter', 0)
--  hl_color('TSNumber', 0)
--  hl_color('TSBoolean', 0)
--  hl_color('TSFloat', 0)
--
--  hl_color('TSFunction', 0)
--  hl_color('TSFuncBuiltin', 0)
--  hl_color('TSFuncMacro', 0)
--  hl_color('TSParameter', 0)
--  hl_color('TSParameterReference', 0)
--  hl_color('TSMethod', 0)
--  hl_color('TSField', 0)
--  hl_color('TSProperty', 0)
--  hl_color('TSConstructor', 0)
--  hl_color('TSAnnotation', 0)
--  hl_color('TSAttribute', 0)
--  hl_color('TSNamespace', 0)
--
--  hl_color('TSConditional', 0)
--  hl_color('TSRepeat', 0)
--  hl_color('TSLabel', 0)
--  hl_color('TSOperator', 0)
--  hl_color('TSKeyword', 0)
--  hl_color('TSKeywordFunction', 0)
--  hl_color('TSKeywordOperator', 0)
--  hl_color('TSException', 0)
--
--  hl_color('TSType', 0)
--  hl_color('TSTypeBuiltin', 0)
--  hl_color('TSInclude', 0)
--
--  hl_color('TSVariable', 0)
--  hl_color('TSVariableBuiltin', 0)
--
--  hl_color('TSText', 0)
--  hl_color('TSTitle', 0)
--  hl_color('TSLiteral', 0)
--  hl_color('TSURI', 0)
--
--  hl_color('TSTag', 0)
--  hl_color('TSTagDelimiter', 0)

-- TSStrong term=bold cterm=bold gui=bold
-- TSEmphasis term=italic cterm=italic gui=italic
-- TSUnderline term=underline cterm=underline gui=underline


-- hi Comment    guifg=#808080 gui=italic ctermfg=244
-- hi Todo       guifg=#ff5f87 guibg=NONE cterm=reverse ctermfg=green ctermbg=none
-- hi Boolean    guifg=#b1d631 gui=none ctermfg=148
-- hi String     guifg=#afd787 gui=none ctermfg=150
-- hi Identifier guifg=#b1d631 gui=none ctermfg=148
-- hi Function   guifg=#ffffff gui=none ctermfg=255
-- hi Type       guifg=#7e8aa2 gui=none ctermfg=103
-- hi Statement  guifg=#7e8aa2 gui=none ctermfg=103
-- hi Keyword    guifg=#ff9800 gui=none ctermfg=208
-- hi Constant   guifg=#ff9800 gui=none ctermfg=208
-- hi Number     guifg=#ff9800 gui=none ctermfg=208
-- hi Special    guifg=#ff9800 gui=none ctermfg=208
-- hi PreProc    guifg=#faf4c6 gui=none ctermfg=230

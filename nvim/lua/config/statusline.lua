-- Based on: https://github.com/superhawk610/dotfiles/blob/7e5de3315fea88f4a3fe904ca43e7cbfd33d7469/.config/nvim/lua/plugins/statusline.lua

local gl = require('galaxyline')
local condition = require('galaxyline.condition')


gl.short_line_list = { 'NvimTree' }

-- onedark
local colors = {
  bg = '#282c34',
  bg_dim = '#333842',
  bg_light = '#444b59',
  black = '#222222',
  white = '#abb2bf',
  gray = '#868c96',
  red = '#e06c75',
  green = '#98c379',
  yellow = '#e5c07b',
  blue = '#61afef',
  purple = '#7c7cff',
  teal = '#56b6c2',
  success = '#cae682',
  error  = '#e86671',
  warning = '#e5c07b'
}

local function mode_alias(m)
  local alias = {
    n = 'NORMAL',
    i = 'INSERT',
    c = 'COMMAND',
    R = 'REPLACE',
    t = 'TERMINAL',
    [''] = 'V-BLOCK',
    V = 'V-LINE',
    v = 'VISUAL',
  }

  return alias[m] or ''
end


local function mode_color(m)
  local mode_colors = {
    normal =  colors.green,
    insert =  colors.blue,
    visual =  colors.purple,
    replace =  colors.red,
  }

  local color = {
    n = mode_colors.normal,
    i = mode_colors.insert,
    c = mode_colors.replace,
    R = mode_colors.replace,
    t = mode_colors.insert,
    [''] = mode_colors.visual,
    V = mode_colors.visual,
    v = mode_colors.visual,
  }

  return color[m] or colors.bg_light
end


local function ale(kind)
  local ok, data = pcall(vim.fn["ale#statusline#Count"], vim.api.nvim_get_current_buf())

  if not ok then return 0 end

  local errors = data['error'] + data['style_error']
  local warnings = data['total'] - errors

  return ({ errors = errors, warnings = warnings})[kind]
end

local function lsp(kind)
  kind = ({
    errors = vim.diagnostic.severity.ERROR,
    warinings =vim.diagnostic.severity.WARN
  })[kind]

  return #vim.diagnostic.get(0, { severity = kind })
end

local function section(name)
  return {
    __newindex = function(_, key, val)
      table.insert(gl.section[name], {
        [key] = val
      })
    end
  }
end

Left = setmetatable({}, section('left'))
Right = setmetatable({}, section('right'))
Short = setmetatable({}, section('short_line_left'))

-- ===================

Short.InactiveBugIcon = {
  separator = '  ',
  separator_highlight = {colors.black, colors.bg},
  highlight = {colors.white, colors.black},
  provider = function() return '   ' end
}

Short.InactiveName = {
  provider = 'FileName',
  highlight = { colors.gray, colors.bg }
}

Left.ViModeIcon = {
  separator = '  ',
  separator_highlight = function()
    if not condition.hide_in_width() and condition.buffer_not_empty() then
      return { colors.black, colors.bg_dim }
    end

    return {colors.black, condition.hide_in_width() and colors.bg_light or colors.bg}
  end,
  highlight = {colors.white, colors.black},
  provider = function() return '   ' end
}

Left.CWD = {
  separator = '  ',
  separator_highlight = function()
    return {colors.bg_light, condition.buffer_not_empty() and colors.bg_dim or colors.bg}
  end,
  condition = condition.hide_in_width,
  highlight = {colors.white, colors.bg_light},
  provider = function()
    local dirname = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    return ' ' .. dirname .. ' '
  end,
}

Left.FileName = {
  provider = 'FileName',
  condition = condition.buffer_not_empty,
  highlight = {colors.gray, colors.bg_dim},
  separator_highlight = {colors.bg_dim, colors.bg},
  separator = '  ',
}

Left.DiffAdd = {
  icon = '  ',
  provider = 'DiffAdd',
  condition = condition.hide_in_width,
  highlight = {colors.success, colors.bg},
}

Left.DiffModified = {
  icon = '  ',
  provider = 'DiffModified',
  condition = condition.hide_in_width,
  highlight = {colors.warning, colors.bg},
}

Left.DiffRemove = {
  icon = '  ',
  provider = 'DiffRemove',
  condition = condition.hide_in_width,
  highlight = {colors.error, colors.bg},
}



Right.Errors = {
  icon = '  ',
  highlight = {colors.error, colors.bg},
  provider = function()
    return ('%i '):format(ale('errors') + lsp('errors'))
  end,
}

Right.Warnings = {
  icon = '  ',
  highlight = {colors.warning, colors.bg},
  provider = function()
    return ('%i '):format(ale('warnigns') + lsp('warnigns'))
  end,
}

Right.FileIcon = {
  separator = '  ',
  highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg},
  condition = condition.buffer_not_empty,
  provider = 'FileIcon'
}


Right.FileType = {
  highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg},
  provider = function()
    local buf = require('galaxyline.provider_buffer')
    return string.lower(buf.get_buffer_filetype())
  end,
}

Right.GitBranch = {
  icon = ' ',
  separator = '  ',
  condition = condition.check_git_workspace,
  highlight = {colors.teal, colors.bg},
  provider = 'GitBranch',
}


vim.api.nvim_command('hi GalaxyViModeReverse guibg=' .. colors.bg_dim)

local function luapad_color()
  if require('luapad.statusline').status() == 'ok' then
    return colors.green
  else
    return colors.red
  end
end

Right.Luapad = {
  separator = '  ',
  condition = require('luapad.state').current,
  highlight = {luapad_color(), colors.bg },
  provider = function()
    vim.api.nvim_command('hi GalaxyLuapad guifg=' .. luapad_color())
    local status = require('luapad.statusline').status()
    return string.upper(tostring(status))
  end
}

Right.FileLocation = {
  icon = ' ',
  separator = ' ',
  separator_highlight = { colors.bg_dim, colors.bg },
  highlight = { colors.gray, colors.bg_dim },
  provider = function()
    local current_line = vim.fn.line('.')
    local total_lines = vim.fn.line('$')
    if current_line == 1 then return 'Top' end
    if current_line == total_lines then return 'Bot' end
    local percent, _ = math.modf((current_line / total_lines) * 100)
    return ('%.2i%%'):format(percent)
  end
}


vim.api.nvim_command('hi GalaxyViModeReverse guibg=' .. colors.bg_dim)

Right.ViMode = {
  icon = ' ',
  separator = ' ',
  separator_highlight = 'GalaxyViModeReverse',
  highlight = {colors.bg, mode_color()},
  provider = function()
    local m = vim.fn.mode() or vim.fn.visualmode()
    local mode = mode_alias(m)
    local color = mode_color(m)
    vim.api.nvim_command('hi GalaxyViMode guibg=' .. color)
    vim.api.nvim_command('hi GalaxyViModeReverse guifg=' .. color)
    return ' ' .. mode .. ' '
  end,
}

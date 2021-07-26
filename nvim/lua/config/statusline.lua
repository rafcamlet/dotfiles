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
  purple = '#7c7cff', -- tweaked to match custom color
  teal = '#56b6c2',
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



gl.section.left[1] = {
  ViModeIcon = {
    separator = '  ',
    separator_highlight = {colors.black, colors.bg_light},
    highlight = {colors.white, colors.black},
    provider = function() return "   " end,
  }
}

gl.section.left[2] = {
  CWD = {
    separator = '  ',
    separator_highlight = function()
      return {colors.bg_light, condition.buffer_not_empty() and colors.bg_dim or colors.bg}
    end,
    highlight = {colors.white, colors.bg_light},
    provider = function()
      local dirname = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
      return ' ' .. dirname .. ' '
    end,
  }
}

gl.section.left[3] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {colors.gray, colors.bg_dim},
  }
}

gl.section.left[4] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.gray, colors.bg_dim},
    separator_highlight = {colors.bg_dim, colors.bg},
    separator = '  ',
  }
}

gl.section.left[5] = {
  DiffAdd = {
    icon = '  ',
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    highlight = {colors.white, colors.bg},
  }
}

gl.section.left[6] = {
  DiffModified = {
    icon = '  ',
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    highlight = {colors.gray, colors.bg},
  }
}

gl.section.left[7] = {
  DiffRemove = {
    icon = '  ',
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    highlight = {colors.gray, colors.bg},
  }
}

-- gl.section.left[8] = {
--   CocStatus = {
--     highlight = {colors.gray, colors.bg},
--     provider = function()
--       return vim.fn['coc#status']()
--         :gsub('\u{274c}', '\u{f06a}')         -- 
--         :gsub('\u{26a0}\u{fe0f}', '\u{f071}') -- 
--     end
--   }
-- }

-- gl.section.left[9] = {
--   CocFunction = {
--     icon = 'λ ',
--     highlight = {colors.gray, colors.bg},
--     provider = function()
--       local has_func, func_name = pcall(vim.api.nvim_buf_get_var, 0, 'coc_current_function')
--       if not has_func then return '' end
--       return func_name or ''
--     end,
--   }
-- }

gl.section.right[1] = {
  FileType = {
    highlight = {colors.gray, colors.bg},
    provider = function()
      local buf = require('galaxyline.provider_buffer')
      return string.lower(buf.get_buffer_filetype())
    end,
  }
}


gl.section.right[2] = {
  GitBranch = {
    icon = ' ',
    separator = '  ',
    condition = condition.check_git_workspace,
    highlight = {colors.teal, colors.bg},
    provider = 'GitBranch',
  }
}

gl.section.right[3] = {
  FileLocation = {
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
}


vim.api.nvim_command('hi GalaxyViModeReverse guibg=' .. colors.bg_dim)

gl.section.right[4] = {
  ViMode = {
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
}

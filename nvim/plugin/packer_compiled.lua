-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/r/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/r/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/r/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/r/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/r/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["DAPInstall.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/DAPInstall.nvim"
  },
  ["Navigator.nvim"] = {
    config = { "\27LJ\2\2ê\3\0\0\a\0\16\0\"6\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0005\1\6\0\18\2\0\0'\3\a\0'\4\b\0'\5\t\0\18\6\1\0B\2\5\1\18\2\0\0'\3\a\0'\4\n\0'\5\v\0\18\6\1\0B\2\5\1\18\2\0\0'\3\a\0'\4\f\0'\5\r\0\18\6\1\0B\2\5\1\18\2\0\0'\3\a\0'\4\14\0'\5\15\0\18\6\1\0B\2\5\1K\0\1\0.<CMD>lua require('Navigator').right()<CR>\n<c-l>+<CMD>lua require('Navigator').up()<CR>\n<c-k>-<CMD>lua require('Navigator').down()<CR>\n<c-j>-<CMD>lua require('Navigator').left()<CR>\n<c-h>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\nsetup\14Navigator\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/Navigator.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\0027\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\6-\1\0\2\nstdin\2\bexe\vstyluap\1\0\5\0\b\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\5\0004\3\3\0003\4\4\0>\4\1\3=\3\6\2=\2\a\1B\0\2\1K\0\1\0\rfiletype\blua\1\0\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  fzf = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["galaxyline.nvim"] = {
    config = { 'require"config.statusline"' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\2ë\v\0\0\4\0\24\0\0276\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\14\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2=\2\15\0015\2\16\0005\3\17\0=\3\18\0025\3\19\0=\3\20\2=\2\21\0015\2\22\0=\2\23\1B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3Ë\a\fkeymaps\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\n\vbuffer\2\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\fnoremap\2\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\nsigns\1\0\t\20update_debounce\3d\29current_line_blame_delay\3Ë\a\vlinehl\1\22use_internal_diff\2\nnumhl\1\18sign_priority\3\6\23current_line_blame\1 current_line_blame_position\beol\23use_decoration_api\2\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\b‚Äæ\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\b‚îÇ\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\b‚îÇ\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\2å\t\0\0\2\0\19\00056\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\0\0009\0\1\0'\1\4\0B\0\2\0016\0\0\0009\0\1\0'\1\5\0B\0\2\0016\0\0\0009\0\1\0'\1\6\0B\0\2\0016\0\0\0009\0\1\0'\1\a\0B\0\2\0016\0\0\0009\0\1\0'\1\b\0B\0\2\0016\0\0\0009\0\t\0005\1\v\0=\1\n\0006\0\0\0009\0\t\0+\1\2\0=\1\f\0006\0\0\0009\0\t\0005\1\14\0=\1\r\0006\0\0\0009\0\t\0005\1\16\0=\1\15\0006\0\0\0009\0\t\0+\1\1\0=\1\17\0006\0\0\0009\0\1\0'\1\18\0B\0\2\1K\0\1\0001autocmd CursorMoved * IndentBlanklineRefresh4indent_blankline_show_trailing_blankline_indent\1\3\0\0\rterminal\vnofile%indent_blankline_buftype_exclude\1\22\0\0\rstartify\14dashboard\16dotooagenda\blog\rfugitive\14gitcommit\vpacker\fvimwiki\rmarkdown\tjson\btxt\nvista\thelp\ftodoist\rNvimTree\rpeekaboo\bgit\20TelescopePrompt\rundotree\24flutterToolsOutline\5&indent_blankline_filetype_exclude-indent_blankline_show_first_indent_level\1\b\0\0\14IndentOne\14IndentTwo\16IndentThree\15IndentFour\15IndentFive\14IndentSix\16IndentSeven)indent_blankline_char_highlight_list\6gAhighlight IndentSeven guifg=#5C3D56 guibg=NONE gui=nocombine?highlight IndentSix guifg=#3D555C guibg=NONE gui=nocombine@highlight IndentFive guifg=#3D4B5C guibg=NONE gui=nocombine@highlight IndentFour guifg=#4B5C3D guibg=NONE gui=nocombineAhighlight IndentThree guifg=#5C523D guibg=NONE gui=nocombine?highlight IndentTwo guifg=#5C443D guibg=NONE gui=nocombine?highlight IndentOne guifg=#63363A guibg=NONE gui=nocombine\bcmd\bvim\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\2ó\4\0\0\5\0\19\0&6\0\0\0'\1\1\0B\0\2\0027\0\2\0006\0\2\0009\0\3\0'\1\4\0005\2\5\0B\0\3\0016\0\6\0009\0\a\0+\1\1\0=\1\b\0006\0\6\0009\0\t\0'\1\n\0B\0\2\0016\0\6\0009\0\t\0'\1\v\0B\0\2\0016\0\6\0009\0\f\0009\0\r\0'\1\14\0'\2\15\0'\3\16\0004\4\0\0B\0\5\0016\0\6\0009\0\f\0009\0\r\0'\1\17\0'\2\15\0'\3\18\0004\4\0\0B\0\5\1K\0\1\0)<Plug>kommentary_visual_default<C-c>\6v$<Plug>kommentary_motion_default\agc\6n\20nvim_set_keymap\bapi\30nmap gcc <Plug>commentaryynnoremap <Plug>commentary :call v:lua.kommentary.go(1)<cr>:silent! call repeat#set(\"\\<Plug>commentary\", v:count)<cr>\bcmd'kommentary_create_default_mappings\6g\bvim\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\vconfig\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lightspeed.nvim"] = {
    config = { "\27LJ\2\2Ö\2\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\a\25grey_out_search_area\2)jump_on_partial_input_safety_timeout\3ê\3\24jump_to_first_match\2+match_only_the_start_of_same_char_seqs\2\21limit_ft_matches\3\5\30full_inclusive_prefix_key\n<c-x>\27highlight_unique_chars\1\nsetup\15lightspeed\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/lightspeed.nvim"
  },
  ["lsp-rooter.nvim"] = {
    config = { 'require("lsp-rooter").setup {}' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/lsp-rooter.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["lush.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/lush.nvim"
  },
  ["luv-vimdocs"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/luv-vimdocs"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'require("nvim-autopairs").setup()' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu"
  },
  ["nvim-colorizer.lua"] = {
    config = { 'require"colorizer".setup()' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\2≥\1\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\1B\0\2\1K\0\1\0\vsource\1\0\4\vbuffer\2\14ultisnips\2\rnvim_lsp\2\tpath\2\1\0\5\14preselect\venable\15min_length\3\1\fenabled\2\ndebug\1\25allow_prefix_unmatch\1\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\2£\6\0\0\2\0\v\0%6\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\0\0009\0\1\0'\1\4\0B\0\2\0016\0\0\0009\0\1\0'\1\5\0B\0\2\0016\0\0\0009\0\1\0'\1\6\0B\0\2\0016\0\0\0009\0\1\0'\1\a\0B\0\2\0016\0\0\0009\0\1\0'\1\b\0B\0\2\0016\0\0\0009\0\1\0'\1\t\0B\0\2\0016\0\0\0009\0\1\0'\1\n\0B\0\2\1K\0\1\0Bnnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>Cnnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>unnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>mnnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>Jnnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>=nnoremap <silent> <F10> :lua require'dap'.step_out()<CR>=nnoremap <silent> <F9> :lua require'dap'.step_into()<CR>=nnoremap <silent> <F8> :lua require'dap'.step_over()<CR><nnoremap <silent> <F5> :lua require'dap'.continue()<CR>\bcmd\bvim\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-luapad"
  },
  ["nvim-miniyank"] = {
    config = { "\27LJ\2\2Õ\1\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0≠\1    map p <Plug>(miniyank-autoput)\n    map P <Plug>(miniyank-autoPut)\n    map <silent><c-p> <Plug>(miniyank-cycle)\n    map <silent><c-n> <Plug>(miniyank-cycleback)\n    \bcmd\bvim\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-miniyank"
  },
  ["nvim-terminal.lua"] = {
    config = { 'require"terminal".setup()' },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-terminal.lua"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\2y\0\1\2\0\6\1\0159\1\0\0\a\1\1\0X\1\3Ä)\1\15\0L\1\2\0X\1\bÄ9\1\0\0\a\1\2\0X\1\5Ä6\1\3\0009\1\4\0019\1\5\1\24\1\0\1L\1\2\0K\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14directionµÊÃô\19ô≥Ê˛\3˚\1\1\0\3\0\r\0\0206\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0003\2\3\0=\2\5\1B\0\2\0016\0\6\0009\0\a\0'\1\t\0=\1\b\0006\0\6\0009\0\n\0'\1\v\0B\0\2\0016\0\0\0'\1\f\0B\0\2\1K\0\1\0#config.plugins.nvim-toggleterm\30tnoremap <c-]> <c-\\><c-n>\bcmd\f#595959\21terminal_color_8\6g\bvim\tsize\1\0\2\17open_mapping\n<c-\\>\14direction\rvertical\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\2•\f\0\0\t\0G\0«\0016\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\4\0'\1\5\0B\0\2\0029\0\6\0006\1\4\0'\2\a\0B\1\2\0029\1\b\0015\2\t\0005\3D\0005\4B\0004\5\30\0005\6\n\0\18\a\0\0'\b\v\0B\a\2\2=\a\f\6>\6\1\0055\6\r\0\18\a\0\0'\b\v\0B\a\2\2=\a\f\6>\6\2\0055\6\14\0\18\a\0\0'\b\v\0B\a\2\2=\a\f\6>\6\3\0055\6\15\0\18\a\0\0'\b\16\0B\a\2\2=\a\f\6>\6\4\0055\6\17\0\18\a\0\0'\b\16\0B\a\2\2=\a\f\6>\6\5\0055\6\18\0\18\a\0\0'\b\19\0B\a\2\2=\a\f\6>\6\6\0055\6\20\0\18\a\0\0'\b\21\0B\a\2\2=\a\f\6>\6\a\0055\6\22\0\18\a\0\0'\b\23\0B\a\2\2=\a\f\6>\6\b\0055\6\24\0\18\a\0\0'\b\25\0B\a\2\2=\a\f\6>\6\t\0055\6\26\0\18\a\0\0'\b\27\0B\a\2\2=\a\f\6>\6\n\0055\6\28\0\18\a\0\0'\b\29\0B\a\2\2=\a\f\6>\6\v\0055\6\30\0\18\a\0\0'\b\31\0B\a\2\2=\a\f\6>\6\f\0055\6 \0\18\a\0\0'\b!\0B\a\2\2=\a\f\6>\6\r\0055\6\"\0\18\a\0\0'\b#\0B\a\2\2=\a\f\6>\6\14\0055\6$\0\18\a\0\0'\b%\0B\a\2\2=\a\f\6>\6\15\0055\6&\0\18\a\0\0'\b'\0B\a\2\2=\a\f\6>\6\16\0055\6(\0\18\a\0\0'\b)\0B\a\2\2=\a\f\6>\6\17\0055\6*\0\18\a\0\0'\b+\0B\a\2\2=\a\f\6>\6\18\0055\6,\0\18\a\0\0'\b-\0B\a\2\2=\a\f\6>\6\19\0055\6.\0\18\a\0\0'\b/\0B\a\2\2=\a\f\6>\6\20\0055\0060\0\18\a\0\0'\b1\0B\a\2\2=\a\f\6>\6\21\0055\0062\0\18\a\0\0'\b3\0B\a\2\2=\a\f\6>\6\22\0055\0064\0\18\a\0\0'\b5\0B\a\2\2=\a\f\6>\6\23\0055\0066\0\18\a\0\0'\b7\0B\a\2\2=\a\f\6>\6\24\0055\0068\0\18\a\0\0'\b9\0B\a\2\2=\a\f\6>\6\25\0055\6:\0\18\a\0\0'\b;\0B\a\2\2=\a\f\6>\6\26\0055\6<\0\18\a\0\0'\b=\0B\a\2\2=\a\f\6>\6\27\0055\6>\0\18\a\0\0'\b?\0B\a\2\2=\a\f\6>\6\28\0055\6@\0\18\a\0\0'\bA\0B\a\2\2=\a\f\6>\6\29\5=\5C\4=\4E\3=\3F\2B\1\2\1K\0\1\0\tview\rmappings\1\0\0\tlist\1\0\0\nclose\1\0\1\bkey\6q\vdir_up\1\0\1\bkey\6u\18next_git_item\1\0\1\bkey\a]c\18prev_git_item\1\0\1\bkey\a[c\23copy_absolute_path\1\0\1\bkey\agy\14copy_path\1\0\1\bkey\6Y\14copy_name\1\0\1\bkey\6y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\n<C-r>\vrename\1\0\1\bkey\6r\vremove\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\frefresh\1\0\1\bkey\6R\20toggle_dotfiles\1\0\1\bkey\6H\19toggle_ignored\1\0\1\bkey\6I\fpreview\1\0\1\bkey\n<Tab>\15close_node\1\0\1\bkey\v<s-cr>\17next_sibling\1\0\1\bkey\6>\17prev_sibling\1\0\1\bkey\6<\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-x>\vvsplit\1\0\1\bkey\n<C-v>\1\0\1\bkey\n<C-]>\acd\1\0\1\bkey\19<2-RightMouse>\1\0\1\bkey\18<2-LeftMouse>\1\0\1\bkey\6o\acb\tedit\1\0\1\bkey\t<CR>\1\0\2\15update_cwd\2\18hijack_cursor\1\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire.nnoremap <c-g><c-f> :NvimTreeFindFile<CR>,nnoremap <c-g><c-g> :NvimTreeToggle<CR>\bcmd\bvim\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\2Û\3\0\0\5\0\18\0\0236\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\b\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2=\2\t\0015\2\n\0=\2\v\0015\2\f\0004\3\0\0=\3\r\2=\2\14\0015\2\15\0005\3\16\0=\3\5\2=\2\17\1B\0\2\1K\0\1\0\26incremental_selection\1\0\4\19init_selection\agn\21node_decremental\n<c-k>\21node_incremental\n<c-j>\22scope_incremental\n<c-l>\1\0\1\venable\2\14highlight\20custom_captures\1\0\1\venable\2\15playground\1\0\3\20persist_queries\1\15updatetime\3\25\venable\2\16textobjects\1\0\0\vselect\1\0\0\fkeymaps\1\0\6\aac\17@class.outer\aaf\20@function.outer\aab\17@block.outer\aif\20@function.inner\aib\17@black.inner\aic\17@class.inner\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\2ê\1\0\0\4\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\6\0005\2\4\0005\3\3\0=\3\5\2=\2\a\1B\0\2\1K\0\1\0\roverride\1\0\1\fdefault\2\arb\1\0\0\1\0\3\ncolor\f#ff5f5f\ticon\bÓûë\tname\aRb\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["one-small-step-for-vimkind"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/one-small-step-for-vimkind"
  },
  ["onedark.nvim"] = {
    after = { "indent-blankline.nvim" },
    loaded = true,
    only_config = true
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\2˝\5\0\0\5\0!\0.5\0\16\0005\1\0\0005\2\1\0=\2\2\0015\2\3\0=\2\4\0015\2\r\0004\3\t\0005\4\5\0>\4\1\0035\4\6\0>\4\2\0035\4\a\0>\4\3\0035\4\b\0>\4\4\0035\4\t\0>\4\5\0035\4\n\0>\4\6\0035\4\v\0>\4\a\0035\4\f\0>\4\b\3=\3\14\2=\2\15\1=\1\17\0005\1\27\0005\2\25\0005\3\19\0005\4\18\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\26\2=\2\28\1=\1\29\0006\1\30\0'\2\31\0B\1\2\0029\1 \1\18\2\0\0B\1\2\1K\0\1\0\nsetup\15rust-tools\frequire\vserver\rsettings\1\0\0\18rust-analyzer\1\0\0\16diagnostics\1\0\2\23enableExperimental\1\venable\1\ncargo\1\0\1\20runBuildScripts\1\16checkOnSave\1\0\0\1\0\1\venable\1\ntools\1\0\0\18hover_actions\vborder\1\0\0\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚ï∞\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚ïØ\16FloatBorder\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚ïÆ\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚ï≠\16FloatBorder\16inlay_hints\1\0\a\27parameter_hints_prefix\a<-\26max_len_align_padding\3\1\16right_align\1\23other_hints_prefix\b=> \18max_len_align\1\24right_align_padding\3\a\25show_parameter_hints\2\14runnables\1\0\1\18use_telescope\2\1\0\2\23hover_with_actions\1\17autoSetHints\2\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
  },
  ["simple-wiki.nvim"] = {
    config = { "\27LJ\2\2˝\1\0\0\2\0\b\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\0016\0\4\0009\0\5\0'\1\6\0B\0\2\0016\0\4\0009\0\5\0'\1\a\0B\0\2\1K\0\1\0;nnoremap _ <CMD>lua require \"simple-wiki\".search()<CR>:nnoremap - <CMD>lua require \"simple-wiki\".index()<CR>\bcmd\bvim\1\0\2\21link_key_mapping\agf\tpath\19~/Dropbox/wiki\nsetup\16simple-wiki\frequire\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/simple-wiki.nvim"
  },
  ["splitjoin.vim"] = {
    config = { "\27LJ\2\2∑\1\0\0\2\0\5\0\0176\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0002splitjoin_html_attributes_bracket_on_new_line splitjoin_ruby_hanging_args splitjoin_ruby_curly_braces\6g\bvim\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["telescope.nvim"] = {
    after = { "trouble.nvim" },
    loaded = true,
    only_config = true
  },
  ["the-lists"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/the-lists"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\2\1\0\0\b\0\16\0\0286\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0016\0\0\0'\1\3\0B\0\2\0026\1\0\0'\2\4\0B\1\2\0029\2\2\0015\3\14\0005\4\f\0005\5\b\0005\6\6\0009\a\5\0=\a\a\6=\6\t\0055\6\n\0009\a\5\0=\a\a\6=\6\v\5=\5\r\4=\4\15\3B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\n<c-e>\1\0\0\22open_with_trouble\14telescope trouble.providers.telescope\nsetup\ftrouble\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/r/.local/share/nvim/site/pack/packer/opt/trouble.nvim"
  },
  ["typescript-vim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/typescript-vim"
  },
  ultisnips = {
    config = { "\27LJ\2\2…\1\0\0\2\0\t\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0K\0\1\0\rvertical\23UltiSnipsEditSplit\n<C-k>!UltiSnipsJumpBackwardTrigger UltiSnipsJumpForwardTrigger\n<C-j>\27UltiSnipsExpandTrigger\6g\bvim\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-jsx-typescript"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-jsx-typescript"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-visual-multi"] = {
    config = { "\27LJ\2\2Ê\6\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0∆\6    let g:VM_Mono_hl   = 'Visual'\n    let g:VM_Extend_hl = 'WildMenu'\n    let g:VM_Cursor_hl = 'Visual'\n    let g:VM_Insert_hl = 'IncSearch'\n\n    let g:VM_highlight_matches = 'red'\n    let g:VM_leader = '<space>'\n    let g:VM_maps = {}\n    let g:VM_maps['Find Under']         = '<C-d>'\n    let g:VM_maps['Find Subword Under'] = '<C-d>'\n\n    let g:VM_maps['Add Cursor Down']             = '<C-U>'\n    let g:VM_maps['Visual Cursors']              = '<space>'\n    let g:VM_maps['Switch Mode']                 = 'v'\n    let g:VM_maps['Visual Regex']                = '/'\n\n    \" autocmd User visual_multi_start nnoremap <c-l> l\n    \" autocmd User visual_multi_start nnoremap <c-h> h\n    \" autocmd User visual_multi_exit nnoremap  <c-l> :TmuxNavigateRight<CR>\n    \" autocmd User visual_multi_exit nnoremap  <c-h> :TmuxNavigateLeft<CR>\n    \bcmd\bvim\0" },
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/r/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\0027\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\6-\1\0\2\nstdin\2\bexe\vstyluap\1\0\5\0\b\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\5\0004\3\3\0003\4\4\0>\4\1\3=\3\6\2=\2\a\1B\0\2\1K\0\1\0\rfiletype\blua\1\0\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\2Û\3\0\0\5\0\18\0\0236\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\b\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2=\2\t\0015\2\n\0=\2\v\0015\2\f\0004\3\0\0=\3\r\2=\2\14\0015\2\15\0005\3\16\0=\3\5\2=\2\17\1B\0\2\1K\0\1\0\26incremental_selection\1\0\4\19init_selection\agn\21node_decremental\n<c-k>\21node_incremental\n<c-j>\22scope_incremental\n<c-l>\1\0\1\venable\2\14highlight\20custom_captures\1\0\1\venable\2\15playground\1\0\3\20persist_queries\1\15updatetime\3\25\venable\2\16textobjects\1\0\0\vselect\1\0\0\fkeymaps\1\0\6\aac\17@class.outer\aaf\20@function.outer\aab\17@block.outer\aif\20@function.inner\aib\17@black.inner\aic\17@class.inner\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: simple-wiki.nvim
time([[Config for simple-wiki.nvim]], true)
try_loadstring("\27LJ\2\2˝\1\0\0\2\0\b\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\0016\0\4\0009\0\5\0'\1\6\0B\0\2\0016\0\4\0009\0\5\0'\1\a\0B\0\2\1K\0\1\0;nnoremap _ <CMD>lua require \"simple-wiki\".search()<CR>:nnoremap - <CMD>lua require \"simple-wiki\".index()<CR>\bcmd\bvim\1\0\2\21link_key_mapping\agf\tpath\19~/Dropbox/wiki\nsetup\16simple-wiki\frequire\0", "config", "simple-wiki.nvim")
time([[Config for simple-wiki.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\2£\6\0\0\2\0\v\0%6\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\0\0009\0\1\0'\1\4\0B\0\2\0016\0\0\0009\0\1\0'\1\5\0B\0\2\0016\0\0\0009\0\1\0'\1\6\0B\0\2\0016\0\0\0009\0\1\0'\1\a\0B\0\2\0016\0\0\0009\0\1\0'\1\b\0B\0\2\0016\0\0\0009\0\1\0'\1\t\0B\0\2\0016\0\0\0009\0\1\0'\1\n\0B\0\2\1K\0\1\0Bnnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>Cnnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>unnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>mnnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>Jnnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>=nnoremap <silent> <F10> :lua require'dap'.step_out()<CR>=nnoremap <silent> <F9> :lua require'dap'.step_into()<CR>=nnoremap <silent> <F8> :lua require'dap'.step_over()<CR><nnoremap <silent> <F5> :lua require'dap'.continue()<CR>\bcmd\bvim\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\2\2ó\4\0\0\5\0\19\0&6\0\0\0'\1\1\0B\0\2\0027\0\2\0006\0\2\0009\0\3\0'\1\4\0005\2\5\0B\0\3\0016\0\6\0009\0\a\0+\1\1\0=\1\b\0006\0\6\0009\0\t\0'\1\n\0B\0\2\0016\0\6\0009\0\t\0'\1\v\0B\0\2\0016\0\6\0009\0\f\0009\0\r\0'\1\14\0'\2\15\0'\3\16\0004\4\0\0B\0\5\0016\0\6\0009\0\f\0009\0\r\0'\1\17\0'\2\15\0'\3\18\0004\4\0\0B\0\5\1K\0\1\0)<Plug>kommentary_visual_default<C-c>\6v$<Plug>kommentary_motion_default\agc\6n\20nvim_set_keymap\bapi\30nmap gcc <Plug>commentaryynnoremap <Plug>commentary :call v:lua.kommentary.go(1)<cr>:silent! call repeat#set(\"\\<Plug>commentary\", v:count)<cr>\bcmd'kommentary_create_default_mappings\6g\bvim\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\vconfig\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
vim.cmd "colorscheme onedark"
time([[Config for onedark.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require("nvim-autopairs").setup()
time([[Config for nvim-autopairs]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
require"config.statusline"
time([[Config for galaxyline.nvim]], false)
-- Config for: nvim-toggleterm.lua
time([[Config for nvim-toggleterm.lua]], true)
try_loadstring("\27LJ\2\2y\0\1\2\0\6\1\0159\1\0\0\a\1\1\0X\1\3Ä)\1\15\0L\1\2\0X\1\bÄ9\1\0\0\a\1\2\0X\1\5Ä6\1\3\0009\1\4\0019\1\5\1\24\1\0\1L\1\2\0K\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14directionµÊÃô\19ô≥Ê˛\3˚\1\1\0\3\0\r\0\0206\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0003\2\3\0=\2\5\1B\0\2\0016\0\6\0009\0\a\0'\1\t\0=\1\b\0006\0\6\0009\0\n\0'\1\v\0B\0\2\0016\0\0\0'\1\f\0B\0\2\1K\0\1\0#config.plugins.nvim-toggleterm\30tnoremap <c-]> <c-\\><c-n>\bcmd\f#595959\21terminal_color_8\6g\bvim\tsize\1\0\2\17open_mapping\n<c-\\>\14direction\rvertical\0\nsetup\15toggleterm\frequire\0", "config", "nvim-toggleterm.lua")
time([[Config for nvim-toggleterm.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\2à\6\0\0\b\0\29\00066\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\2\3\0005\3\21\0005\4\v\0005\5\t\0005\6\5\0009\a\4\1=\a\6\0069\a\a\1=\a\b\6=\6\n\5=\5\f\0046\5\0\0'\6\r\0B\5\2\0029\5\14\0059\5\15\5=\5\16\0046\5\0\0'\6\r\0B\5\2\0029\5\17\0059\5\15\5=\5\18\0046\5\0\0'\6\r\0B\5\2\0029\5\19\0059\5\15\5=\5\20\4=\4\22\3B\2\2\0016\2\23\0009\2\24\2'\3\25\0B\2\2\0016\2\23\0009\2\24\2'\3\26\0B\2\2\0016\2\23\0009\2\24\2'\3\27\0B\2\2\0016\2\23\0009\2\24\2'\3\28\0B\2\2\1K\0\1\0Mnnoremap <space>ot <cmd>lua require(\"telescope.builtin\").help_tags()<cr>Knnoremap <space>ob <cmd>lua require(\"telescope.builtin\").buffers()<cr>Mnnoremap <space>of <cmd>lua require(\"telescope.builtin\").live_grep()<cr>Nnnoremap <space>oo <cmd>lua require(\"telescope.builtin\").find_files()<cr>\bcmd\bvim\rdefaults\1\0\0\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\rmappings\1\0\0\6i\1\0\0\n<c-k>\28move_selection_previous\n<c-j>\1\0\0\24move_selection_next\nsetup\22telescope.actions\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: splitjoin.vim
time([[Config for splitjoin.vim]], true)
try_loadstring("\27LJ\2\2∑\1\0\0\2\0\5\0\0176\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0002splitjoin_html_attributes_bracket_on_new_line splitjoin_ruby_hanging_args splitjoin_ruby_curly_braces\6g\bvim\0", "config", "splitjoin.vim")
time([[Config for splitjoin.vim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\2ê\1\0\0\4\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\6\0005\2\4\0005\3\3\0=\3\5\2=\2\a\1B\0\2\1K\0\1\0\roverride\1\0\1\fdefault\2\arb\1\0\0\1\0\3\ncolor\f#ff5f5f\ticon\bÓûë\tname\aRb\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: ultisnips
time([[Config for ultisnips]], true)
try_loadstring("\27LJ\2\2…\1\0\0\2\0\t\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0K\0\1\0\rvertical\23UltiSnipsEditSplit\n<C-k>!UltiSnipsJumpBackwardTrigger UltiSnipsJumpForwardTrigger\n<C-j>\27UltiSnipsExpandTrigger\6g\bvim\0", "config", "ultisnips")
time([[Config for ultisnips]], false)
-- Config for: nvim-terminal.lua
time([[Config for nvim-terminal.lua]], true)
require"terminal".setup()
time([[Config for nvim-terminal.lua]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\2≥\1\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\1B\0\2\1K\0\1\0\vsource\1\0\4\vbuffer\2\14ultisnips\2\rnvim_lsp\2\tpath\2\1\0\5\14preselect\venable\15min_length\3\1\fenabled\2\ndebug\1\25allow_prefix_unmatch\1\nsetup\ncompe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: vim-visual-multi
time([[Config for vim-visual-multi]], true)
try_loadstring("\27LJ\2\2Ê\6\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0∆\6    let g:VM_Mono_hl   = 'Visual'\n    let g:VM_Extend_hl = 'WildMenu'\n    let g:VM_Cursor_hl = 'Visual'\n    let g:VM_Insert_hl = 'IncSearch'\n\n    let g:VM_highlight_matches = 'red'\n    let g:VM_leader = '<space>'\n    let g:VM_maps = {}\n    let g:VM_maps['Find Under']         = '<C-d>'\n    let g:VM_maps['Find Subword Under'] = '<C-d>'\n\n    let g:VM_maps['Add Cursor Down']             = '<C-U>'\n    let g:VM_maps['Visual Cursors']              = '<space>'\n    let g:VM_maps['Switch Mode']                 = 'v'\n    let g:VM_maps['Visual Regex']                = '/'\n\n    \" autocmd User visual_multi_start nnoremap <c-l> l\n    \" autocmd User visual_multi_start nnoremap <c-h> h\n    \" autocmd User visual_multi_exit nnoremap  <c-l> :TmuxNavigateRight<CR>\n    \" autocmd User visual_multi_exit nnoremap  <c-h> :TmuxNavigateLeft<CR>\n    \bcmd\bvim\0", "config", "vim-visual-multi")
time([[Config for vim-visual-multi]], false)
-- Config for: nvim-miniyank
time([[Config for nvim-miniyank]], true)
try_loadstring("\27LJ\2\2Õ\1\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0≠\1    map p <Plug>(miniyank-autoput)\n    map P <Plug>(miniyank-autoPut)\n    map <silent><c-p> <Plug>(miniyank-cycle)\n    map <silent><c-n> <Plug>(miniyank-cycleback)\n    \bcmd\bvim\0", "config", "nvim-miniyank")
time([[Config for nvim-miniyank]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)
try_loadstring("\27LJ\2\2˝\5\0\0\5\0!\0.5\0\16\0005\1\0\0005\2\1\0=\2\2\0015\2\3\0=\2\4\0015\2\r\0004\3\t\0005\4\5\0>\4\1\0035\4\6\0>\4\2\0035\4\a\0>\4\3\0035\4\b\0>\4\4\0035\4\t\0>\4\5\0035\4\n\0>\4\6\0035\4\v\0>\4\a\0035\4\f\0>\4\b\3=\3\14\2=\2\15\1=\1\17\0005\1\27\0005\2\25\0005\3\19\0005\4\18\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\26\2=\2\28\1=\1\29\0006\1\30\0'\2\31\0B\1\2\0029\1 \1\18\2\0\0B\1\2\1K\0\1\0\nsetup\15rust-tools\frequire\vserver\rsettings\1\0\0\18rust-analyzer\1\0\0\16diagnostics\1\0\2\23enableExperimental\1\venable\1\ncargo\1\0\1\20runBuildScripts\1\16checkOnSave\1\0\0\1\0\1\venable\1\ntools\1\0\0\18hover_actions\vborder\1\0\0\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚ï∞\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚ïØ\16FloatBorder\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚ïÆ\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚ï≠\16FloatBorder\16inlay_hints\1\0\a\27parameter_hints_prefix\a<-\26max_len_align_padding\3\1\16right_align\1\23other_hints_prefix\b=> \18max_len_align\1\24right_align_padding\3\a\25show_parameter_hints\2\14runnables\1\0\1\18use_telescope\2\1\0\2\23hover_with_actions\1\17autoSetHints\2\0", "config", "rust-tools.nvim")
time([[Config for rust-tools.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\2ë\v\0\0\4\0\24\0\0276\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\14\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2=\2\15\0015\2\16\0005\3\17\0=\3\18\0025\3\19\0=\3\20\2=\2\21\0015\2\22\0=\2\23\1B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3Ë\a\fkeymaps\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\n\vbuffer\2\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\fnoremap\2\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\nsigns\1\0\t\20update_debounce\3d\29current_line_blame_delay\3Ë\a\vlinehl\1\22use_internal_diff\2\nnumhl\1\18sign_priority\3\6\23current_line_blame\1 current_line_blame_position\beol\23use_decoration_api\2\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\b‚Äæ\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\b‚îÇ\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\b‚îÇ\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\2•\f\0\0\t\0G\0«\0016\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\4\0'\1\5\0B\0\2\0029\0\6\0006\1\4\0'\2\a\0B\1\2\0029\1\b\0015\2\t\0005\3D\0005\4B\0004\5\30\0005\6\n\0\18\a\0\0'\b\v\0B\a\2\2=\a\f\6>\6\1\0055\6\r\0\18\a\0\0'\b\v\0B\a\2\2=\a\f\6>\6\2\0055\6\14\0\18\a\0\0'\b\v\0B\a\2\2=\a\f\6>\6\3\0055\6\15\0\18\a\0\0'\b\16\0B\a\2\2=\a\f\6>\6\4\0055\6\17\0\18\a\0\0'\b\16\0B\a\2\2=\a\f\6>\6\5\0055\6\18\0\18\a\0\0'\b\19\0B\a\2\2=\a\f\6>\6\6\0055\6\20\0\18\a\0\0'\b\21\0B\a\2\2=\a\f\6>\6\a\0055\6\22\0\18\a\0\0'\b\23\0B\a\2\2=\a\f\6>\6\b\0055\6\24\0\18\a\0\0'\b\25\0B\a\2\2=\a\f\6>\6\t\0055\6\26\0\18\a\0\0'\b\27\0B\a\2\2=\a\f\6>\6\n\0055\6\28\0\18\a\0\0'\b\29\0B\a\2\2=\a\f\6>\6\v\0055\6\30\0\18\a\0\0'\b\31\0B\a\2\2=\a\f\6>\6\f\0055\6 \0\18\a\0\0'\b!\0B\a\2\2=\a\f\6>\6\r\0055\6\"\0\18\a\0\0'\b#\0B\a\2\2=\a\f\6>\6\14\0055\6$\0\18\a\0\0'\b%\0B\a\2\2=\a\f\6>\6\15\0055\6&\0\18\a\0\0'\b'\0B\a\2\2=\a\f\6>\6\16\0055\6(\0\18\a\0\0'\b)\0B\a\2\2=\a\f\6>\6\17\0055\6*\0\18\a\0\0'\b+\0B\a\2\2=\a\f\6>\6\18\0055\6,\0\18\a\0\0'\b-\0B\a\2\2=\a\f\6>\6\19\0055\6.\0\18\a\0\0'\b/\0B\a\2\2=\a\f\6>\6\20\0055\0060\0\18\a\0\0'\b1\0B\a\2\2=\a\f\6>\6\21\0055\0062\0\18\a\0\0'\b3\0B\a\2\2=\a\f\6>\6\22\0055\0064\0\18\a\0\0'\b5\0B\a\2\2=\a\f\6>\6\23\0055\0066\0\18\a\0\0'\b7\0B\a\2\2=\a\f\6>\6\24\0055\0068\0\18\a\0\0'\b9\0B\a\2\2=\a\f\6>\6\25\0055\6:\0\18\a\0\0'\b;\0B\a\2\2=\a\f\6>\6\26\0055\6<\0\18\a\0\0'\b=\0B\a\2\2=\a\f\6>\6\27\0055\6>\0\18\a\0\0'\b?\0B\a\2\2=\a\f\6>\6\28\0055\6@\0\18\a\0\0'\bA\0B\a\2\2=\a\f\6>\6\29\5=\5C\4=\4E\3=\3F\2B\1\2\1K\0\1\0\tview\rmappings\1\0\0\tlist\1\0\0\nclose\1\0\1\bkey\6q\vdir_up\1\0\1\bkey\6u\18next_git_item\1\0\1\bkey\a]c\18prev_git_item\1\0\1\bkey\a[c\23copy_absolute_path\1\0\1\bkey\agy\14copy_path\1\0\1\bkey\6Y\14copy_name\1\0\1\bkey\6y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\n<C-r>\vrename\1\0\1\bkey\6r\vremove\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\frefresh\1\0\1\bkey\6R\20toggle_dotfiles\1\0\1\bkey\6H\19toggle_ignored\1\0\1\bkey\6I\fpreview\1\0\1\bkey\n<Tab>\15close_node\1\0\1\bkey\v<s-cr>\17next_sibling\1\0\1\bkey\6>\17prev_sibling\1\0\1\bkey\6<\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-x>\vvsplit\1\0\1\bkey\n<C-v>\1\0\1\bkey\n<C-]>\acd\1\0\1\bkey\19<2-RightMouse>\1\0\1\bkey\18<2-LeftMouse>\1\0\1\bkey\6o\acb\tedit\1\0\1\bkey\t<CR>\1\0\2\15update_cwd\2\18hijack_cursor\1\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire.nnoremap <c-g><c-f> :NvimTreeFindFile<CR>,nnoremap <c-g><c-g> :NvimTreeToggle<CR>\bcmd\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: lsp-rooter.nvim
time([[Config for lsp-rooter.nvim]], true)
require("lsp-rooter").setup {}
time([[Config for lsp-rooter.nvim]], false)
-- Config for: Navigator.nvim
time([[Config for Navigator.nvim]], true)
try_loadstring("\27LJ\2\2ê\3\0\0\a\0\16\0\"6\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0005\1\6\0\18\2\0\0'\3\a\0'\4\b\0'\5\t\0\18\6\1\0B\2\5\1\18\2\0\0'\3\a\0'\4\n\0'\5\v\0\18\6\1\0B\2\5\1\18\2\0\0'\3\a\0'\4\f\0'\5\r\0\18\6\1\0B\2\5\1\18\2\0\0'\3\a\0'\4\14\0'\5\15\0\18\6\1\0B\2\5\1K\0\1\0.<CMD>lua require('Navigator').right()<CR>\n<c-l>+<CMD>lua require('Navigator').up()<CR>\n<c-k>-<CMD>lua require('Navigator').down()<CR>\n<c-j>-<CMD>lua require('Navigator').left()<CR>\n<c-h>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\nsetup\14Navigator\frequire\0", "config", "Navigator.nvim")
time([[Config for Navigator.nvim]], false)
-- Config for: lightspeed.nvim
time([[Config for lightspeed.nvim]], true)
try_loadstring("\27LJ\2\2Ö\2\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\a\25grey_out_search_area\2)jump_on_partial_input_safety_timeout\3ê\3\24jump_to_first_match\2+match_only_the_start_of_same_char_seqs\2\21limit_ft_matches\3\5\30full_inclusive_prefix_key\n<c-x>\27highlight_unique_chars\1\nsetup\15lightspeed\frequire\0", "config", "lightspeed.nvim")
time([[Config for lightspeed.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require"colorizer".setup()
time([[Config for nvim-colorizer.lua]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd indent-blankline.nvim ]]

-- Config for: indent-blankline.nvim
try_loadstring("\27LJ\2\2å\t\0\0\2\0\19\00056\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\0\0009\0\1\0'\1\4\0B\0\2\0016\0\0\0009\0\1\0'\1\5\0B\0\2\0016\0\0\0009\0\1\0'\1\6\0B\0\2\0016\0\0\0009\0\1\0'\1\a\0B\0\2\0016\0\0\0009\0\1\0'\1\b\0B\0\2\0016\0\0\0009\0\t\0005\1\v\0=\1\n\0006\0\0\0009\0\t\0+\1\2\0=\1\f\0006\0\0\0009\0\t\0005\1\14\0=\1\r\0006\0\0\0009\0\t\0005\1\16\0=\1\15\0006\0\0\0009\0\t\0+\1\1\0=\1\17\0006\0\0\0009\0\1\0'\1\18\0B\0\2\1K\0\1\0001autocmd CursorMoved * IndentBlanklineRefresh4indent_blankline_show_trailing_blankline_indent\1\3\0\0\rterminal\vnofile%indent_blankline_buftype_exclude\1\22\0\0\rstartify\14dashboard\16dotooagenda\blog\rfugitive\14gitcommit\vpacker\fvimwiki\rmarkdown\tjson\btxt\nvista\thelp\ftodoist\rNvimTree\rpeekaboo\bgit\20TelescopePrompt\rundotree\24flutterToolsOutline\5&indent_blankline_filetype_exclude-indent_blankline_show_first_indent_level\1\b\0\0\14IndentOne\14IndentTwo\16IndentThree\15IndentFour\15IndentFive\14IndentSix\16IndentSeven)indent_blankline_char_highlight_list\6gAhighlight IndentSeven guifg=#5C3D56 guibg=NONE gui=nocombine?highlight IndentSix guifg=#3D555C guibg=NONE gui=nocombine@highlight IndentFive guifg=#3D4B5C guibg=NONE gui=nocombine@highlight IndentFour guifg=#4B5C3D guibg=NONE gui=nocombineAhighlight IndentThree guifg=#5C523D guibg=NONE gui=nocombine?highlight IndentTwo guifg=#5C443D guibg=NONE gui=nocombine?highlight IndentOne guifg=#63363A guibg=NONE gui=nocombine\bcmd\bvim\0", "config", "indent-blankline.nvim")

vim.cmd [[ packadd trouble.nvim ]]

-- Config for: trouble.nvim
try_loadstring("\27LJ\2\2\1\0\0\b\0\16\0\0286\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0016\0\0\0'\1\3\0B\0\2\0026\1\0\0'\2\4\0B\1\2\0029\2\2\0015\3\14\0005\4\f\0005\5\b\0005\6\6\0009\a\5\0=\a\a\6=\6\t\0055\6\n\0009\a\5\0=\a\a\6=\6\v\5=\5\r\4=\4\15\3B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\n<c-e>\1\0\0\22open_with_trouble\14telescope trouble.providers.telescope\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

function p(...)
	if #{ ... } > 1 then
		print(vim.inspect({ ... }))
	else
		print(vim.inspect(...))
	end
end

local function config_file(file)
	vim.api.nvim_command(("runtime config/%s.vim"):format(file))
end

local function update()
  package.loaded["config.plugins"] = nil
  require 'config.plugins'
  vim.cmd 'PackerSync'
end

vim.cmd [[command! Update lua require'config.helpers'.update()]]

return {
	config_file = config_file,
  update = update
}

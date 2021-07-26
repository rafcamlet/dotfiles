function quickfix_toggle()
	local quickfix = false

	local tab = vim.api.nvim_get_current_tabpage()
	local wins = vim.api.nvim_tabpage_list_wins(tab)

	for _, v in ipairs(wins) do
		local buf = vim.api.nvim_win_get_buf(v)
		local ft = vim.api.nvim_buf_get_option(buf, "filetype")
		if ft == "qf" then
			quickfix = true
		end
	end

	if quickfix then
		vim.cmd("cclose")
	else
		vim.cmd("copen")
	end
end

function send_to_tmux(visual)
	local arr
	local pane

	if visual then
		local s = vim.fn.getpos("'<")[2]
		local f = vim.fn.getpos("'>")[2]
		arr = vim.api.nvim_buf_get_lines(0, s - 1, f, false)
	else
		arr = { vim.api.nvim_get_current_line() }
	end

	local current_pane = vim.fn.system("tmux display-message -p '#{pane_index}'")

	if current_pane == "0\n" then
		pane = ".1"
	else
		pane = ".0"
	end

	local result = {}
	for _, v in ipairs(arr) do
		table.insert(result, vim.fn.escape(v, '"$`'))
	end

	local cmd = ([[tmux send-keys -t %s -l "%s"]]):format(pane, table.concat(result, "\n"))
	-- p(cmd)
	vim.fn.system(cmd)
	vim.fn.system(([[tmux send-keys -t %s c-m]]):format(pane))
end

return {
	quickfix_toggle = quickfix_toggle,
	send_to_tmux = send_to_tmux,
}

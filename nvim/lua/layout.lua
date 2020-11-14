local function close_all_bufs()
  vim.cmd('botright vnew')
  local start_buf = vim.api.nvim_get_current_buf()

  bufs = vim.api.nvim_list_bufs()
  for _, v in ipairs(bufs) do
    if v ~= start_buf and vim.api.nvim_buf_is_valid(v) then
      vim.api.nvim_buf_delete(v, {force = true})
    end
  end
end

return {
  close_all_bufs = close_all_bufs
}

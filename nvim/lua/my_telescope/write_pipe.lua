local BasePipe = require 'my_telescope.base_pipe'

local WritePipe = BasePipe:extend()

function WritePipe:new()
  WritePipe.super.new(self)
  self.handle = vim.loop.new_pipe()
end

function WritePipe:write(data)
  self.handle:write(data)
end

return WritePipe

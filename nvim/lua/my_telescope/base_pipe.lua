-- BasePipe implementation extracted from Telescope plugin
-- lua/telescope/_.lua

local channel = require("plenary.async").control.channel
local Object = require "plenary.class"

local BasePipe = Object:extend()

function BasePipe:new()
  self.eof_tx, self.eof_rx = channel.oneshot()
end

function BasePipe:close(force)
  if force == nil then
    force = true
  end

  assert(self.handle, "Must have a pipe to close. Otherwise it's weird!")

  if self.handle:is_closing() then
    return
  end

  -- If we're not forcing the stop, allow waiting for eof
  -- This ensures that we don't end up with weird race conditions
  if not force then
    self.eof_rx()
  end

  self.handle:read_stop()
  if not self.handle:is_closing() then
    self.handle:close()
  end

  self._closed = true
end

return BasePipe

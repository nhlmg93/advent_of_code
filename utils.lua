luaunit = require('luaunit')

M = {}

function M:readFileStripWhitespace(filename)
  local file, err = io.open(filename, "r")
  if not file then
    return nil, "Could not open file: " .. (err or "unknown error")
  end

  local content = file:read("*all")
  file:close()

  -- Remove all whitespace (spaces, tabs, newlines)
  content = content:gsub("%s+", "")

  return content
end

--[[
TestLogger = {}

function TestLogger:setUp()
  -- define the fname to use for logging
  self.fname = 'mytmplog.log'
  -- make sure the file does not already exists
  os.remove(self.fname)
end

function TestLogger:testLoggerCreatesFile()
  luaunit.LuaUnit.(self.fname)
  log('toto')
  f = io.open(self.fname, 'r')
  luaunit.assertNotNil(f)
  f:close()
end

function TestLogger:tearDown()
  self.fname = 'mytmplog.log'
  -- cleanup our log file after all tests
  os.remove(self.fname)
end
]]--


return M

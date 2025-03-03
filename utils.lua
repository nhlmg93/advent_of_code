luaunit = require('luaunit')

TestLogger = {}

function TestLogger:setUp()
  -- define the fname to use for logging
  self.fname = 'mytmplog.log'
  -- make sure the file does not already exists
  os.remove(self.fname)
end

function TestLogger:testLoggerCreatesFile()
  initLog(self.fname)
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

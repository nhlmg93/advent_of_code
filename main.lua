local luaunit = require("lib.luaunit")
require("tests.2015.test_day1")
require("tests.2015.test_day2")
require("tests.2015.test_day3")

os.exit(luaunit.LuaUnit.run())

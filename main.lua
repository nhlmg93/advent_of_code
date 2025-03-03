local luaunit= require("lib.luaunit")
require("tests.2015.test_day1")
require("tests.2015.test_day2")

os.exit(luaunit.LuaUnit.run())

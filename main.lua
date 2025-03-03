local luaunit= require("lib.luaunit")
require("tests.2015.test_day1")

os.exit(luaunit.LuaUnit.run())

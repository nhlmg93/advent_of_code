local luaunit = require('lib.luaunit')
local utils = require("utils")
local day1 = require("modules.2015.day2")

TestDay2 = {}

function TestDay2:setUp()
  self.input = utils.readFileToList("assets/day2.txt")
end

function TestDay2:testPartOne()
  local floors = day1.partOne(self.input)
  print(floors)
  luaunit.assertEquals(floors, 138)
end

return TestDay1

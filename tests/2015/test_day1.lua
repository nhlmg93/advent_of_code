local luaunit = require('lib.luaunit')
local utils = require("utils")
local day1 = require("modules.2015.day1")

TestDay1 = {}

function TestDay1:setUp()
  self.input = utils.readFileToString("assets/2015/day1.txt")
end

function TestDay1:testPartOne()
  local floors = day1.partOne(self.input)
  luaunit.assertEquals(floors, 138)
end

function TestDay1:testPartTwo()
  local floors = day1.partTwo(self.input)
  luaunit.assertEquals(floors, 1771)
end

return TestDay1

local luaunit = require('lib.luaunit')
local utils = require("utils")
local day3 = require("modules.2015.day3")

TestDay3 = {}

function TestDay3:setUp()
  self.input = utils.readFileToString("assets/2015/day3.txt")
end

function TestDay3:testPartOne()
  local houses = day3.partOne(self.input)
  luaunit.assertEquals(houses, 2081)
end

function TestDay3:testPartTwo()
  local houses = day3.partTwo(self.input)
  luaunit.assertEquals(houses, 2341)
end

return TestDay3

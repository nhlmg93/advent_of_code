local luaunit = require('lib.luaunit')
local utils = require("utils")
local day2 = require("modules.2015.day2")

TestDay2 = {}

function TestDay2:setUp()
  self.input = utils.readFileToList("assets/2015/day2.txt")
end

function TestDay2:testPartOne()
  local sqft = day2.partOne(self.input)
  luaunit.assertEquals(sqft, 1598415)
end

function TestDay2:testPartTwo()
  local feet = day2.partTwo(self.input)
  luaunit.assertEquals(feet, 3812909)
end

return TestDay2

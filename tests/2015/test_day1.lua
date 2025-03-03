local luaunit = require('lib.luaunit')
local utils = require("utils")
local day1 = require("modules.2015.day1")

TestDay1 = {}

function TestDay1:testPartOne()
  local input = utils.readFileStripWhitespace("assets/day1.txt")
  local floors = day1.partOne(input)
  luaunit.assertEquals(floors, 138)
end
function TestDay1:testPartTwo()
  local input = utils.readFileStripWhitespace("assets/day1.txt")
  local floors = day1.partTwo(input)
  luaunit.assertEquals(floors, 1771)
end

return TestDay1

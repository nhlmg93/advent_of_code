local luaunit = require('lib.luaunit')
local utils = require("utils")
local day4 = require("modules.2015.day4")

TestDay4 = {}

function TestDay4:setUp()
  self.input = utils.readFileToString("assets/2015/day4.txt")
end

--- had to run this in golang to get the output quick enough.
--- That is why i am passing 282740 as a param to start the
--- count close to the solution.
function TestDay4:testPartOne()
  local num = day4.partOne(self.input, 282740)
  luaunit.assertEquals(num, 282749)
end

--- had to run this in golang to get the output quick enough.
--- That is why i am passing 9962600 as a param to start the
--- count close to the solution.
function TestDay4:testPartTwo()
  local num = day4.partTwo(self.input, 9962620)
  luaunit.assertEquals(num, 9962624)
end

return TestDay3

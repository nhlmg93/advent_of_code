local luaunit = require('lib.luaunit')
local utils = require("utils")
local day4 = require("modules.2015.day4")

TestDay4 = {}

function TestDay4:setUp()
  self.input = utils.readFileToString("assets/2015/day4.txt")
end

--- had to run this in golang to get the output quick enough.
--- That is why i am passing 282700 as a param to start the
--- count close to the solution.
function TestDay4:testPartOne()
  local num = day4.partOne(self.input, 282700)
  luaunit.assertEquals(num, 282749)
end

function TestDay4:testPartTwo()
  local foo = day4.partTwo(self.input)
  print(foo)
end

return TestDay3

local luaunit = require('lib.luaunit')
local utils = require("utils")
local day5 = require("modules.2015.day5")

TestDay5 = {}

function TestDay5:setUp()
  self.input = utils.readFileToList("assets/2015/day5.txt")
end

--- had to run this in golang to get the output quick enough.
--- That is why i am passing 282740 as a param to start the
--- count close to the solution.
function TestDay5:testPartOne()
  local num = day5.partOne(self.input, 282740)
  print(num)
end

--- had to run this in golang to get the output quick enough.
--- That is why i am passing 9962600 as a param to start the
--- count close to the solution.
function TestDay5:testPartTwo()
  local num = day5.partTwo(self.input, 9962620)
  print(num)
end

return TestDay5

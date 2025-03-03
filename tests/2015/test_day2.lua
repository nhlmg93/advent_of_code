local luaunit = require('lib.luaunit')
local utils = require("utils")
local day2 = require("modules.2015.day2")

TestDay2 = {}

function TestDay2:setUp()
  self.input = utils.readFileToList("assets/day2.txt")
end

function TestDay2:testPartOne()
  local sqft = day2.partOne(self.input)
  print(sqft)
end

return TestDay2

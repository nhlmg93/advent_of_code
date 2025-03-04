-- local luaunit = require('lib.luaunit')
local utils = require("utils")
local day4 = require("modules.2015.day4")

TestDay4 = {}

function TestDay4:setUp()
  self.input = utils.readFileToString("assets/2015/day4.txt")
end

function TestDay4:testPartOne()
  local foo = day4.partOne(self.input)
  print(foo)
end

function TestDay4:testPartTwo()
  local foo = day4.partTwo(self.input)
  print(foo)
end

return TestDay3

local luaunit = require('lib.luaunit')
local utils = require("utils")
local day1 = require("modules.2015.day1")

TestDay1 = {}

function TestDay1:print()
  local input = utils:readFileStripWhitespace("./day1_p1.txt")
  local floors = day1:partOne(input)
  luaunit.assertEquals(floors, 138)
end

--[[
--- Day 3: Perfectly Spherical Houses in a Vacuum ---

Santa is delivering presents to an infinite two-dimensional grid of houses.

He begins by delivering a present to the house at his starting location, and then an elf at the North Pole calls him via radio and tells him where to move next. Moves are always exactly one house to the north (^), south (v), east (>), or west (<). After each move, he delivers another present to the house at his new location.

However, the elf back at the north pole has had a little too much eggnog, and so his directions are a little off, and Santa ends up visiting some houses more than once. How many houses receive at least one present?

For example:

    > delivers presents to 2 houses: one at the starting location, and one to the east.
    ^>v< delivers presents to 4 houses in a square, including twice to the house at his starting/ending location.
    ^v^v^v^v^v delivers a bunch of presents to some very lucky children at only 2 houses.

--- Part Two ---

The next year, to speed up the process, Santa creates a robot version of himself, Robo-Santa, to deliver presents with him.

Santa and Robo-Santa start at the same location (delivering two presents to the same starting house), then take turns moving based on instructions from the elf, who is eggnoggedly reading from the same script as the previous year.

This year, how many houses receive at least one present?

For example:

    ^v delivers presents to 3 houses, because Santa goes north, and then Robo-Santa goes south.
    ^>v< now delivers presents to 3 houses, and Santa and Robo-Santa end up back where they started.
    ^v^v^v^v^v now delivers presents to 11 houses, with Santa going one direction and Robo-Santa going the other.

--]]

local HashSet = require("lib.hashset")
--- @class Module
M = {}

--- Look up the coordinates of the house
--- @param x integer
--- @param y integer
--- @param dir string
--- @return integer
--- @return integer
function lookUpCoordinates(x, y, dir)
  if dir == "<" then
    x = x - 1
  elseif dir == ">" then
    x = x + 1
  elseif dir == "^" then
    y = y + 1
  elseif dir == "v" then
    y = y - 1
  end
  return x, y
end

--- Calculates the number of unique houses santa visited
--- @param directions string directions santa takes
--- @return integer houses
function M.partOne(directions)
  local set = HashSet:new()
  set:addToSet(0 .. "," .. 0, true)
  local houses = 0
  local x, y = 0, 0
  for i = 1, #directions do
    local char = directions:sub(i, i)
    x, y = lookUpCoordinates(x, y, char)
    local key = x .. "," .. y
    set:addToSet(key, true)
  end
  houses = set:countElements()
  return houses
end

--- Calculates the number of unique houses santa and robo santa visited
--- @param directions string directions santa(odd) and robo santa(even) takes
--- @return integer houses
function M.partTwo(directions)
  local houses = 0
  local santa = HashSet:new()
  santa:addToSet(0 .. "," .. 0, true)
  local x0, y0 = 0, 0
  local roboSanta = HashSet:new()
  roboSanta:addToSet(0 .. "," .. 0, true)
  local x1, y1 = 0, 0
  for i = 1, #directions do
    local char = directions:sub(i, i)
    if i % 2 ~= 0 then
      --odd so santa move
      x0, y0 = lookUpCoordinates(x0, y0, char)
      local key = x0 .. "," .. y0
      santa:addToSet(key, true)
    else
      --even so robo santa move
      x1, y1 = lookUpCoordinates(x1, y1, char)
      local key = x1 .. "," .. y1
      roboSanta:addToSet(key, true)
    end
  end
  local combinedVisits = HashSet:new()
  -- Add all of Santa's houses
  for k, v in pairs(santa.visited) do
    combinedVisits:addToSet(k, true)
  end

  -- Add all of Robo-Santa's houses
  for k, v in pairs(roboSanta.visited) do
    combinedVisits:addToSet(k, true)
  end

  houses = combinedVisits:countElements()
  return houses
end

return M

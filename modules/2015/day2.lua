--[[
--- Day 2: I Was Told There Would Be No Math ---

The elves are running low on wrapping paper, and so they need to submit an order for more.
They have a list of the dimensions (length l, width w, and height h) of each present, and only
want to order exactly as much as they need.

Fortunately, every present is a box (a perfect right rectangular prism), which makes calculating
the required wrapping paper for each gift a little easier: find the surface area of the box,
which is 2*l*w + 2*w*h + 2*h*l. The elves also need a little extra paper for each present: the area of the smallest side.

For example:

    A present with dimensions 2x3x4 requires 2*6 + 2*12 + 2*8 = 52 square feet of wrapping paper
        plus 6 square feet of slack, for a total of 58 square feet.
    A present with dimensions 1x1x10 requires 2*1 + 2*10 + 2*10 = 42 square feet of wrapping paper
        plus 1 square foot of slack, for a total of 43 square feet.

All numbers in the elves' list are in feet. How many total square feet of wrapping paper should they order?

--- Part Two ---

The elves are also running low on ribbon. Ribbon is all the same width, so they only have to worry about the length they need to order, which they would again like to be exact.

The ribbon required to wrap a present is the shortest distance around its sides, or the smallest perimeter of any one face. Each present also requires a bow made out of ribbon as well; the feet of ribbon required for the perfect bow is equal to the cubic feet of volume of the present. Don't ask how they tie the bow, though; they'll never tell.

For example:

    A present with dimensions 2x3x4 requires 2+2+3+3 = 10 feet of ribbon to wrap the present plus 2*3*4 = 24 feet of ribbon for the bow, for a total of 34 feet.
    A present with dimensions 1x1x10 requires 1+1+1+1 = 4 feet of ribbon to wrap the present plus 1*1*10 = 10 feet of ribbon for the bow, for a total of 14 feet.

How many total feet of ribbon should they order?

--]]

--- @class Module
M = {}

--- parses a string of dimensions LxWxH Ex... 10x10x15
--- @param dimensionStr string The dimensions of presents
--- @return integer, integer, integer
local function parse(dimensionStr)
  dimensionStr = dimensionStr:gsub("\n", "")
  local lwh = {}
  local p1 = 1
  local p2 = 1
  while p2 <= #dimensionStr do
    local char = dimensionStr:sub(p2, p2)
    if char ~= "x" then
      p2 = p2 + 1
    else
      local numStr = dimensionStr:sub(p1, p2 - 1)
      local num = tonumber(numStr)
      table.insert(lwh, num)
      p2 = p2 + 1
      p1 = p2
    end
  end
  local num = tonumber(dimensionStr:sub(p1, #dimensionStr))
  table.insert(lwh, num)
  return lwh[1], lwh[2], lwh[3]
end

--- calculate surface area of a box
--- @param l integer length
--- @param w integer width
--- @param h integer height
--- @return integer, integer, integer
local function surfaceArea(l, w, h)
  return (2 * l * w) + (2 * w * h) + (2 * h * l)
end
--- calculate smallest perimeter of any one face
--- @param l integer length
--- @param w integer width
--- @param h integer height
--- @return integer, integer
local function shortestDistance(l, w, h)
  local sorted = { l, w, h }
  table.sort(sorted, function(a, b)
    return a < b
  end)
  return sorted[1], sorted[2]
end

--- calculate cubic feet
--- @param l integer length
--- @param w integer width
--- @param h integer height
--- @return integer, integer
local function cubicFeet(l, w, h)
  return l * w * h
end

--- Calculates the total square feet of wrapping paper
--- @param dimensions table The dimensions of presents
--- @return integer sqft
function M.partOne(dimensions)
  local totalSqft = 0
  for _, value in ipairs(dimensions) do
    local l, w, h = parse(value)
    local boxSqrft = surfaceArea(l, w, h) + math.min(l * w, w * h, h * l)
    totalSqft = totalSqft + boxSqrft
  end
  return totalSqft
end

--- Calculates the total square feet of wrapping paper
--- @param dimensions table The dimensions of presents
--- @return integer feet
function M.partTwo(dimensions)
  local feet = 0
  for _, value in ipairs(dimensions) do
    local l, w, h = parse(value)
    local d1, d2 = shortestDistance(l, w, h)
    local shortest = 2 * d1 + 2 * d2
    local volume = cubicFeet(l, w, h)
    feet = feet + shortest + volume
  end
  return feet
end

return M

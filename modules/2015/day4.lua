--[[
--- Day 4: The Ideal Stocking Stuffer ---

Santa needs help mining some AdventCoins (very similar to bitcoins) to use as gifts for all the economically forward-thinking little girls and boys.

To do this, he needs to find MD5 hashes which, in hexadecimal, start with at least five zeroes. The input to the MD5 hash is some secret key (your puzzle input, given below)
followed by a number in decimal. To mine AdventCoins, you must find Santa the lowest positive number (no leading zeroes: 1, 2, 3, ...) that produces such a hash.

For example:

    If your secret key is abcdef, the answer is 609043, because the MD5 hash of abcdef609043 starts with five zeroes (000001dbbfa...), and it is the lowest such number to do so.
    If your secret key is pqrstuv, the lowest number it combines with to make an MD5 hash starting with five zeroes is 1048970; that is, the MD5 hash of pqrstuv1048970 looks like 000006136ef....

--- Part Two ---

Now find one that starts with six zeroes.
--]]

local md5 = require("lib.md5")

--- @class Module
M = {}

--- Give a input find the trailing smallest real positive n that gives
--- the hash 5 leading zeros
--- @param input string secret key
--- @param num integer|nil num to use so our hash (given a input)
--- will have 5 leading zeros. We will brute force if nil. expect
--- a wait
--- @return integer answer
function M.partOne(input, num)
  local count = num or 0
  local hash = ''
  while hash:sub(1, 5) ~= "00000" do
    count = count + 1
    hash = md5.sumhexa(input .. count)
    -- Print progress every 10000 attempts
    if count % 100 == 0 then
      print("Tried " .. count .. " combinations...")
    end
  end
  return count
end

--- Give a input find the trailing smallest real positive n that gives
--- the hash 6 leading zeros
--- @param input string secret key
--- @param num integer|nil num to use so our hash (given a input)
--- will have 6 leading zeros. We will brute force if nil. expect
--- a wait
--- @return integer answer
function M.partTwo(input, num)
  local count = num or 0
  local hash = ''
  while hash:sub(1, 6) ~= "000000" do
    count = count + 1
    hash = md5.sumhexa(input .. count)
    -- Print progress every 1000 attempts
    if count % 100 == 0 then
      print("Tried " .. count .. " combinations...")
    end
  end
  return count
end

return M

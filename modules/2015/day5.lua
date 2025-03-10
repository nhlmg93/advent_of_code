--[[
--- Day 5: Doesn't He Have Intern-Elves For This? ---

Santa needs help figuring out which strings in his text file are naughty or nice.

A nice string is one with all of the following properties:

    It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
    It contains at least one letter that appears twice in a row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
    It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements.

For example:

    ugknbfddgicrmopn is nice because it has at least three vowels (u...i...o...), a double letter (...dd...), and none of the disallowed substrings.
    aaa is nice because it has at least three vowels and a double letter, even though the letters used by different rules overlap.
    jchzalrnumimnmhp is naughty because it has no double letter.
    haegwjzuvuyypxyu is naughty because it contains the string xy.
    dvszwmarrgswjxmb is naughty because it contains only one vowel.

How many strings are nice?
--]]

--- @class Module
M = {}

--- Give a input find the trailing smallest real positive n that gives
--- the hash 5 leading zeros
--- @param input string secret key
--- @return integer answer
function M.partOne(input)
  -- Flags
  local totalNiceStrings = 0
  local vowlCount = 0
  local vowls = {"a", "e", "i", "o", "u"}
  local repeatedLetters = false
  local containsNaughtyStrings = false
  local naughtyStrings = {
    ["ab"] = true,
    ["cd"] = true,
    ["pq"] = true,
    ["xy"] = true,
  }
  local function resetFlags()
   vowlCount = 0
   containsNaughtyStrings = false
   repeatedLetters = false
  end

  for _, s in pairs(input) do
    for i = 1, #s do
      local char = s:sub(i,i)
      local charNext = s:sub(i+1, i+1)

      if char == charNext then
        repeatedLetters = true
      end


      if naughtyStrings[char .. charNext] then
        containsNaughtyStrings = true
      end

      for j = 1, #vowls do
       if char == vowls[j] then vowlCount = vowlCount + 1 end
      end

    end

    if vowlCount >= 3 and repeatedLetters and not containsNaughtyStrings then totalNiceStrings = totalNiceStrings + 1 end

    resetFlags()
  end
  return totalNiceStrings
end

--- Give a input find the trailing smallest real positive n that gives
--- the hash 6 leading zeros
--- @param input string secret key
--- @return integer answer
function M.partTwo(input)
  error("Not Implemented!")
end

return M

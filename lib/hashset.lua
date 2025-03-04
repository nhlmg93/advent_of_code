--- @class HashSet
--- @field visited table The table storing set elements as keys
local M = {}

--- Initialize a new HashSet
--- @return HashSet a new empty HashSet instance
function M:new()
  local set = {}
  set.visited = {}
  setmetatable(set, self)
  self.__index = self
  return set
end

--- Add an element to the HashSet
--- @param key any the key to add to the set
--- @param value any the value to add to the set
--- @return nil
function M:addToSet(key, value)
  if not self:__containsKey(key) then
    self.visited[key] = value
  end
end

--- Check if an element exists in the HashSet
--- @param key any the key to check
--- @return boolean true if the key exists, false otherwise
function M:__containsKey(key)
  return self.visited[key] ~= nil
end

--- Count elements in the HashSet
--- @return number the number of elements in the set
function M:countElements()
  local count = 0
  for _ in pairs(self.visited) do
    count = count + 1
  end
  return count
end

return M

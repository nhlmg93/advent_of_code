M = {}

function M:partOne(instructions)
  local floor = 0

  for i = 1, #instructions do
    local char = instructions:sub(i, i)
    if char == "(" then
      floor = floor + 1
    elseif char == ")" then
      floor = floor - 1
    end
  end

  return floor
end

return M

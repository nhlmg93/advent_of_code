M = {}

function M.readFileToString(filename)
  local file, err = io.open(filename, "r")
  if not file then
    return nil, "Could not open file: " .. (err or "unknown error")
  end

  local content = file:read("*all")
  file:close()

  -- Remove all whitespace (spaces, tabs, newlines)
  content = content:gsub("%s+", "")

  return content
end

function M.readFileToList(filename)
  local list = {}
  local file, err = io.open(filename, "r")
  if not file then
    return nil, "Could not open file: " .. (err or "unknown error")
  end

  while true do
    local line = file:read("l")
    if line == nil then break end
    line = line:gsub("%s+", "")
    table.insert(list, line)
  end

  return list
end

return M
